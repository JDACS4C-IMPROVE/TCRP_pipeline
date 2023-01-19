# import time
# import argparse
# import numpy as np
# from array import array
# import random
# import torch
# import torch.nn.functional as F
# import torch.optim as optim
import os
# import glob
# from torch.autograd import Variable
# import sys
# import torch.nn as nn
import pickle
# import copy
from data_loading import *
# from utils import *
from score import *
from inner_loop import InnerLoop
from mlp import mlp
import warnings
warnings.filterwarnings("ignore", category=FutureWarning)

########################
filepath = os.path.realpath(__file__)
dir_name = os.path.dirname(filepath)
home_dir = os.path.dirname(os.path.dirname(dir_name))
project_root = os.path.dirname(home_dir)
data_root = "/infodev1/non-phi-projects/junjiang/TCRP_pipeline/data"
work_dic = os.path.join(data_root, "data", "merged")
data_dic = os.path.join(data_root, "data", "merged", "drug_feature")

tissue = "PDTC"
# tissue = "lung"
drug = "AZ628"
num_trials = 10 #TODO: should be smaller than tissue_num
tissue_num = 6
inner_batch_size = 10
meta_batch_size = 10
K = 5  # Perform K shot learning
layer = 1
hidden = 5
meta_lr = 0.001
inner_lr = 0.01
num_inner_updates = 1
num_updates = 20
seed = 19
patience = 3

'''
python MAML_DRUG.py --tissue PDTC --drug KU-55933 --K 10 --num_trials 20 --num_updates 20 
--tissue_num 6 --meta_batch_size 10 --meta_lr 0.001 --inner_lr 0.01 --layer 1 --hidden 5 
--run_name 210803_drug-baseline-models
'''
###############################################################################################
def zero_shot_test(unseen_test_loader):
    unseen_tissue_model = mlp(feature_dim, layer, hidden)

    # First need to copy the original meta learning model
    unseen_tissue_model.copy_weights(observed_tissue_model)
    unseen_tissue_model.cuda()

    unseen_tissue_model.eval()

    mtest_loss, mtest_pear_corr, test_prediction, test_true_label = evaluate_new(unseen_tissue_model,
                                                                                 unseen_test_loader, 0)

    return mtest_loss, mtest_pear_corr, test_prediction, test_true_label


def unseen_tissue_learn(unseen_train_loader, unseen_test_loader):
    unseen_tissue_model = mlp(feature_dim, layer, hidden)

    # First need to copy the original meta learning model
    unseen_tissue_model.copy_weights(observed_tissue_model)
    unseen_tissue_model.cuda()
    # unseen_tissue_model.train()
    unseen_tissue_model.eval()

    unseen_opt = torch.optim.SGD(unseen_tissue_model.parameters(), lr=inner_lr)
    # unseen_opt = torch.optim.Adam(unseen_tissue_model.parameters(), lr=args.test_inner_lr, betas=(0.9, 0.99), eps=1e-05)

    # Here test_feature and test_label contains only one tissue info
    # unseen_train_loader, unseen_test_loader = get_unseen_data_loader(test_feature, test_label, K, args.inner_batch_size)

    for i in range(num_inner_updates):
        in_, target = unseen_train_loader.__iter__().__next__()
        loss, _ = forward_pass(unseen_tissue_model, in_, target)
        unseen_opt.zero_grad()
        loss.backward()
        unseen_opt.step()

    # Test on the rest of cell lines in this tissue (unseen_test_loader)
    mtrain_loss, mtrain_pear_corr, _, _ = evaluate_new(unseen_tissue_model, unseen_train_loader, 1)
    mtest_loss, mtest_pear_corr, test_prediction, test_true_label = evaluate_new(unseen_tissue_model,
                                                                                 unseen_test_loader, 0)

    return mtrain_loss, mtrain_pear_corr, mtest_loss, mtest_pear_corr, test_prediction, test_true_label


def meta_update(test_loader, ls):
    # print 'Meta update'
    in_, target = test_loader.__iter__().__next__()

    # We use a dummy forward / backward pass to get the correct grads into self.net
    loss, out = forward_pass(observed_tissue_model, in_, target)

    # Unpack the list of grad dicts
    gradients = {k: sum(d[k] for d in ls) for k in ls[0].keys()}

    # for k, val, in gradients.items():
    #	gradients[k] = val / args.meta_batch_size
    #	print k,':',gradients[k]

    # Register a hook on each parameter in the net that replaces the current dummy grad
    # with our grads accumulated across the meta-batch
    hooks = []
    for (k, v) in observed_tissue_model.named_parameters():
        def get_closure():
            key = k

            def replace_grad(grad):
                return gradients[key]

            return replace_grad

        hooks.append(v.register_hook(get_closure()))

    # Compute grads for current step, replace with summed gradients as defined by hook
    observed_opt.zero_grad()

    loss.backward()
    # Update the net parameters with the accumulated gradient according to optimizer
    observed_opt.step()
    # Remove the hooks before next training phase
    for h in hooks:
        h.remove()



###############################################################################################
drug_tissue_list = os.path.join(work_dic, drug + '_tissue_cell_line_list.pkl')
with open(drug_tissue_list, 'rb') as f:
    drug_tissue_map = pickle.load(f)

train_feature, train_label, tissue_index_list, drug_test_feature, drug_test_label, _ = load_data_cell_line(drug_tissue_map, drug, tissue, K, path=data_dic+"/")
feature_dim = train_feature.shape[1]

observed_tissue_model = mlp(feature_dim, layer, hidden)
observed_opt = torch.optim.Adam(observed_tissue_model.parameters(), lr=meta_lr, betas=(0.9, 0.99), eps=1e-05)


# This is the inside learner
inner_net = InnerLoop(num_inner_updates, inner_lr, feature_dim, layer, hidden)

torch.cuda.manual_seed(seed)
observed_tissue_model.cuda()
inner_net.cuda()


###############################################################################################
# Here the training process starts
train_loss, train_corr, train_spear_corr = np.zeros((num_updates, K)), np.zeros((num_updates, K)), np.zeros((num_updates, K))
test_loss, test_corr, test_spear_corr = np.zeros((num_updates, K)), np.zeros((num_updates, K)), np.zeros((num_updates, K))

best_loss = 10000
best_epoch = 0

############################################
# load testing dataset to validate the training loss
unseen_train_loader_list = []
unseen_test_loader_list = []
test_data_path = os.path.join(data_root, "data", "fewshot_data", drug, tissue)  #

for trial in range(num_trials):
    # Sample a few shot learning task. Here we use k training, and use the rest for testing.
    # unseen_train_loader, unseen_test_loader = get_unseen_data_loader(drug_test_feature, drug_test_label, K, args.inner_batch_size)
    unseen_train, unseen_test = [], []

    for k in range(1, K + 1):
        # # Sample a few shot learning task. Here we use k training, and use the rest for testing.
        # unseen_train_loader, unseen_test_loader = get_unseen_data_loader(drug_test_feature, drug_test_label, K, args.inner_batch_size)
        # print(len(unseen_train_loader))
        # print(len(unseen_train_loader[0]))
        # print(len(unseen_test_loader))
        # print(len(unseen_test_loader[0]))
        # raise
        # train_index_file = testing_path_suffix + args.tissue + '_' + args.drug + '_train_index_' + str(trial) + '_' + str(k) + '.npy'
        # test_index_file = testing_path_suffix + args.tissue + '_' + args.drug + '_test_index_' + str(trial) + '_' + str(k) + '.npy'
        train_data = np.load(os.path.join(test_data_path, '{}_{}_{}-shot_{}-trial_train.npz'.format(drug, tissue, k, trial)))
        train_X = torch.tensor(train_data['train_X']).cuda()
        train_y = torch.tensor(train_data['train_y']).cuda()
        unseen_train_loader = [(train_X, train_y)]
        test_data = np.load(os.path.join(test_data_path, '{}_{}_{}-trial_test.npz'.format(drug, tissue, trial)))
        test_X = torch.tensor(test_data['test_X']).cuda()
        test_y = torch.tensor(test_data['test_y']).cuda()
        unseen_test_loader = [(test_X, test_y)]

        # 	unseen_train_loader, unseen_test_loader = load_unseen_data_loader(train_index_file, test_index_file, drug_test_feature, drug_test_label, K, trial, batch_size=K)
        unseen_train.append(unseen_train_loader)
        unseen_test.append(unseen_test_loader)

    unseen_train_loader_list.append(unseen_train)
    unseen_test_loader_list.append(unseen_test)
zero_shot_test_dataset = du.TensorDataset(torch.FloatTensor(drug_test_feature), torch.FloatTensor(drug_test_label))
zero_test_loader = du.DataLoader(zero_shot_test_dataset, batch_size=200)
zero_test_data_list = []
for batch_feature, batch_label in zero_test_loader:
    zero_test_data_list.append((batch_feature.cuda(), batch_label.cuda()))

############################################
hyperparam_str = str(meta_lr) + '_' + str(inner_lr) + '_' + str(layer) + '_' + str(tissue_num)
predict_folder = os.path.join(project_root, "results","predictions", drug, tissue, hyperparam_str) #TODO:
mkdir_cmd = 'mkdir -p ' + predict_folder
os.system(mkdir_cmd)
# training process
for epoch in range(num_updates):
    # print("epoch: ", epoch)

    zero_test_loss, zero_test_corr, test_prediction, test_true_label = zero_shot_test(zero_test_data_list)
    # print('0 Few shot', epoch, 'meta training:', '-1', '-1', zero_test_loss, zero_test_corr)

    epoch_folder = os.path.join(predict_folder, 'epochs_' + str(epoch))
    mkdir_cmd = 'mkdir -p ' + epoch_folder
    os.system(mkdir_cmd)

    zero_predict_file = os.path.join(epoch_folder, 'zero_shot_predict.npy')
    np.save(zero_predict_file, test_prediction.cpu())

    zero_true_file = os.path.join(epoch_folder, 'zero_shot_true.npy')
    np.save(zero_true_file, test_true_label.cpu())

    for k in range(1, K + 1):

        tissue_train_loss, tissue_test_loss, tissue_train_corr, tissue_test_corr, = np.zeros((num_trials,)), np.zeros(
            (num_trials,)), np.zeros((num_trials,)), np.zeros((num_trials,))

        for i in range(num_trials):
            # Evaluate on unseen test tasks
            # tissue_test_corr is the one that I want to save
            tissue_train_loss[i], tissue_train_corr[i], tissue_test_loss[i], tissue_test_corr[
                i], test_prediction, test_true_label = unseen_tissue_learn(unseen_train_loader_list[i][k - 1],
                                                                           unseen_test_loader_list[i][k - 1])

            k_shot_predict_file = os.path.join(epoch_folder, str(k) + '_' + str(i) + '_shot_predict.npy')
            np.save(k_shot_predict_file, test_prediction.cpu())

            k_shot_true_file = os.path.join(epoch_folder, str(k) + '_' + str(i) + '_shot_true.npy')
            np.save(k_shot_true_file, test_true_label.cpu())

        train_loss[epoch][k - 1], train_corr[epoch][k - 1] = tissue_train_loss.mean(), tissue_train_corr.mean()
        test_loss[epoch][k - 1], test_corr[epoch][k - 1] = tissue_test_loss.mean(), tissue_test_corr.mean()

    # k, 'Few shot', epoch, 'meta training:', train_loss[epoch][k-1], train_corr[epoch][k-1], test_loss[epoch][k-1], test_corr[epoch][k-1])

    # Collect a meta batch update
    grads = []

    meta_train_loss, meta_train_corr, meta_val_loss, meta_val_corr = np.zeros((meta_batch_size,)), np.zeros(
        (meta_batch_size,)), np.zeros((meta_batch_size,)), np.zeros((meta_batch_size,))

    for i in range(meta_batch_size):
        train_feature = train_feature.astype(np.float32)
        observed_train_loader, observed_test_loader = get_observed_data_loader(train_feature, train_label,
                                                                               tissue_index_list, K,
                                                                               inner_batch_size, tissue_num)
        # observed_train_loader, observed_test_loader = get_observed_data_loader( train_feature, train_label, tissue_index_list, K, K)

        inner_net.copy_weights(observed_tissue_model)

        metrics, g = inner_net.forward(observed_train_loader, observed_test_loader)

        grads.append(g)

        meta_train_loss[i], meta_train_corr[i], meta_val_loss[i], meta_val_corr[i] = metrics

    if meta_val_loss.mean() < best_loss:
        best_loss = meta_val_loss.mean()
        best_epoch = epoch
        bad_counter = 0
    else:
        bad_counter += 1

    if bad_counter == patience:
        # print("Ran out of patience. Breaking out...")
        break

    # print('Meta update', epoch, meta_train_loss.mean(), meta_train_corr.mean(), meta_val_loss.mean(), meta_val_corr.mean(), 'best epoch', best_epoch)
    # Perform the meta update
    meta_update(observed_test_loader, grads)
# print('Best loss meta training:', test_corr[best_epoch])

import matplotlib.pyplot as plt
for trial_idx in range(num_trials):
    x = range(num_updates)
    plt.plot(x, train_loss[:, trial_idx], 'r')
    plt.plot(x, test_loss[:, trial_idx], 'b')
    plt.show()

    plt.plot(x, train_spear_corr[:, trial_idx], 'r')
    plt.plot(x, test_spear_corr[:, trial_idx], 'b')
    plt.show()

output_path = os.path.join(project_root, "results", "merged_performances", "TCRP_performances", drug , tissue)
os.system("mkdir -p {}".format(output_path))
new_test_corr = test_corr[test_corr != 0]
if isinstance(zero_test_corr, int):
    corr_zero = zero_test_corr
else:
    corr_zero = zero_test_corr.data.cpu().numpy()
best_corr = test_corr[best_epoch]
corr_mean = np.mean(test_corr[best_epoch])
print("corr mean", corr_mean)
results = {}
results["TCRP-zero"] = corr_zero
# print("here")
results["TCRP-fewshot"] = test_corr[best_epoch]
# print(results["TCRP-fewshot"])
np.savez(
    output_path + "TCRP_performance",
    **results
)
print('Best corr meta training:', test_corr[best_epoch])
print("zero", zero_test_corr)