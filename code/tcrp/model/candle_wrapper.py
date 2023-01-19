import my_MAML_DRUG_candle as TCRP
from inner_loop import InnerLoop
import warnings
import candle
import torch
import os
import matplotlib.pyplot as plt

warnings.filterwarnings("ignore", category=FutureWarning)


def initialize_parameters():
    unet_common = TCRP.tcrp_candel(TCRP.dir_name,
                                   'tcrp_params.txt',
                                   'torch',
                                   prog='tcrp_example',
                                   desc='tcrp example'
                                   )

    # Initialize parameters
    gParameters = candle.finalize_parameters(unet_common)
    return gParameters


def run(gParameters):
    drug = gParameters['drug']
    tissue = gParameters['tissue']
    K = gParameters['k_shot']  # k shot learning
    layer = gParameters['layer']
    hidden = gParameters['hidden']
    num_updates = gParameters['num_updates']
    meta_batch_size = gParameters['meta_batch_size']
    inner_batch_size = gParameters['inner_batch_size']
    num_inner_updates = gParameters['num_inner_updates']
    patience = gParameters['patience']
    meta_lr = gParameters['meta_lr']
    num_trials = gParameters['num_trials']
    inner_lr = gParameters['inner_lr']
    tissue_num = gParameters['tissue_num']
    # load data
    train_feature, train_label, tissue_index_list, drug_test_feature, drug_test_label, feature_dim = TCRP.load_data(
        drug, tissue, K)
    observed_tissue_model, observed_opt = TCRP.build_model(feature_dim, layer, hidden, meta_lr)

    # This is the inside learner
    inner_net = InnerLoop(gParameters['num_inner_updates'], gParameters['inner_lr'], feature_dim, gParameters['layer'],
                          gParameters['hidden'])

    torch.cuda.manual_seed(gParameters['seed'])
    observed_tissue_model.cuda()
    inner_net.cuda()

    ###############################################################################################
    unseen_train_loader_list, unseen_test_loader_list = TCRP.load_unseen_data(drug, tissue, num_trials, K)
    zero_test_data_list = TCRP.load_zero_shot_data_list(drug_test_feature, drug_test_label)
    hyperparam_str, output_folder = TCRP.make_output_dir(drug, tissue, meta_lr, inner_lr, layer, tissue_num)
    best_epoch, train_loss, test_loss, train_spear_corr, test_spear_corr = TCRP.train(inner_net, train_feature,
                                                                                      train_label,
                                                                                      output_folder, num_updates,
                                                                                      meta_batch_size, inner_batch_size,
                                                                                      layer,
                                                                                      hidden, zero_test_data_list,
                                                                                      unseen_train_loader_list,
                                                                                      unseen_test_loader_list,
                                                                                      inner_lr, num_inner_updates,
                                                                                      tissue_num, patience, feature_dim,
                                                                                      K,
                                                                                      num_trials, observed_tissue_model,
                                                                                      observed_opt, tissue_index_list)

    return best_epoch, train_loss, test_loss, train_spear_corr, test_spear_corr


def draw_curves(gParameters, train_loss, test_loss, train_spear_corr, test_spear_corr):
    output_path = gParameters['output_path']
    num_trials = train_loss.shape[1]
    num_updates = train_loss.shape[0]
    for trial_idx in range(num_trials):
        x = range(num_updates)
        plt.plot(x, train_loss[:, trial_idx], 'r')
        plt.plot(x, test_loss[:, trial_idx], 'b')
        plt.show()
        plt.savefig(os.path.join(output_path, str(trial_idx) + "_loss.png"))

        plt.plot(x, train_spear_corr[:, trial_idx], 'r')
        plt.plot(x, test_spear_corr[:, trial_idx], 'b')
        plt.show()
        plt.savefig(os.path.join(output_path, str(trial_idx) + "_corr.png"))


def main():
    gParameters = initialize_parameters()
    best_epoch, train_loss, test_loss, train_spear_corr, test_spear_corr = run(gParameters)
    draw_curves(gParameters, train_loss, test_loss, train_spear_corr, test_spear_corr)


if __name__ == '__main__':
    main()
    try:
        print()
    except AttributeError:
        pass
