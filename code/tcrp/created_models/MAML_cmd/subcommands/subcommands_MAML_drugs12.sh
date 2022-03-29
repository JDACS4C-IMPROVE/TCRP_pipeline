#!/bin/bash
python=/opt/conda/bin/python
$python /root/capsule/code/tcrp/pipelines/generate_baseline_job_cv.py--tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --run_name 210803_drug-baseline-models
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 6 --meta_batch_size 10 --meta_lr 0.1 --inner_lr 0.1 --layer 1 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.1_0.1_1_6.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 12 --meta_batch_size 10 --meta_lr 0.1 --inner_lr 0.1 --layer 1 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.1_0.1_1_12.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 20 --meta_batch_size 10 --meta_lr 0.1 --inner_lr 0.1 --layer 1 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.1_0.1_1_20.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 6 --meta_batch_size 10 --meta_lr 0.1 --inner_lr 0.1 --layer 2 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.1_0.1_2_6.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 12 --meta_batch_size 10 --meta_lr 0.1 --inner_lr 0.1 --layer 2 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.1_0.1_2_12.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 20 --meta_batch_size 10 --meta_lr 0.1 --inner_lr 0.1 --layer 2 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.1_0.1_2_20.log

$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 6 --meta_batch_size 10 --meta_lr 0.1 --inner_lr 0.01 --layer 1 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.1_0.01_1_6.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 12 --meta_batch_size 10 --meta_lr 0.1 --inner_lr 0.01 --layer 1 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.1_0.01_1_12.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 20 --meta_batch_size 10 --meta_lr 0.1 --inner_lr 0.01 --layer 1 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.1_0.01_1_20.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 6 --meta_batch_size 10 --meta_lr 0.1 --inner_lr 0.01 --layer 2 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.1_0.01_2_6.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 12 --meta_batch_size 10 --meta_lr 0.1 --inner_lr 0.01 --layer 2 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.1_0.01_2_12.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 20 --meta_batch_size 10 --meta_lr 0.1 --inner_lr 0.01 --layer 2 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.1_0.01_2_20.log

$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 6 --meta_batch_size 10 --meta_lr 0.1 --inner_lr 0.001 --layer 1 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.1_0.001_1_6.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 12 --meta_batch_size 10 --meta_lr 0.1 --inner_lr 0.001 --layer 1 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.1_0.001_1_12.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 20 --meta_batch_size 10 --meta_lr 0.1 --inner_lr 0.001 --layer 1 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.1_0.001_1_20.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 6 --meta_batch_size 10 --meta_lr 0.1 --inner_lr 0.001 --layer 2 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.1_0.001_2_6.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 12 --meta_batch_size 10 --meta_lr 0.1 --inner_lr 0.001 --layer 2 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.1_0.001_2_12.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 20 --meta_batch_size 10 --meta_lr 0.1 --inner_lr 0.001 --layer 2 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.1_0.001_2_20.log

$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 6 --meta_batch_size 10 --meta_lr 0.01 --inner_lr 0.1 --layer 1 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.01_0.1_1_6.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 12 --meta_batch_size 10 --meta_lr 0.01 --inner_lr 0.1 --layer 1 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.01_0.1_1_12.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 20 --meta_batch_size 10 --meta_lr 0.01 --inner_lr 0.1 --layer 1 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.01_0.1_1_20.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 6 --meta_batch_size 10 --meta_lr 0.01 --inner_lr 0.1 --layer 2 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.01_0.1_2_6.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 12 --meta_batch_size 10 --meta_lr 0.01 --inner_lr 0.1 --layer 2 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.01_0.1_2_12.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 20 --meta_batch_size 10 --meta_lr 0.01 --inner_lr 0.1 --layer 2 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.01_0.1_2_20.log

$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 6 --meta_batch_size 10 --meta_lr 0.01 --inner_lr 0.01 --layer 1 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.01_0.01_1_6.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 12 --meta_batch_size 10 --meta_lr 0.01 --inner_lr 0.01 --layer 1 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.01_0.01_1_12.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 20 --meta_batch_size 10 --meta_lr 0.01 --inner_lr 0.01 --layer 1 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.01_0.01_1_20.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 6 --meta_batch_size 10 --meta_lr 0.01 --inner_lr 0.01 --layer 2 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.01_0.01_2_6.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 12 --meta_batch_size 10 --meta_lr 0.01 --inner_lr 0.01 --layer 2 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.01_0.01_2_12.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 20 --meta_batch_size 10 --meta_lr 0.01 --inner_lr 0.01 --layer 2 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.01_0.01_2_20.log

$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 6 --meta_batch_size 10 --meta_lr 0.01 --inner_lr 0.001 --layer 1 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.01_0.001_1_6.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 12 --meta_batch_size 10 --meta_lr 0.01 --inner_lr 0.001 --layer 1 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.01_0.001_1_12.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 20 --meta_batch_size 10 --meta_lr 0.01 --inner_lr 0.001 --layer 1 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.01_0.001_1_20.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 6 --meta_batch_size 10 --meta_lr 0.01 --inner_lr 0.001 --layer 2 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.01_0.001_2_6.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 12 --meta_batch_size 10 --meta_lr 0.01 --inner_lr 0.001 --layer 2 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.01_0.001_2_12.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 20 --meta_batch_size 10 --meta_lr 0.01 --inner_lr 0.001 --layer 2 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.01_0.001_2_20.log

$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 6 --meta_batch_size 10 --meta_lr 0.001 --inner_lr 0.1 --layer 1 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.001_0.1_1_6.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 12 --meta_batch_size 10 --meta_lr 0.001 --inner_lr 0.1 --layer 1 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.001_0.1_1_12.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 20 --meta_batch_size 10 --meta_lr 0.001 --inner_lr 0.1 --layer 1 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.001_0.1_1_20.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 6 --meta_batch_size 10 --meta_lr 0.001 --inner_lr 0.1 --layer 2 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.001_0.1_2_6.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 12 --meta_batch_size 10 --meta_lr 0.001 --inner_lr 0.1 --layer 2 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.001_0.1_2_12.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 20 --meta_batch_size 10 --meta_lr 0.001 --inner_lr 0.1 --layer 2 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.001_0.1_2_20.log

$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 6 --meta_batch_size 10 --meta_lr 0.001 --inner_lr 0.01 --layer 1 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.001_0.01_1_6.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 12 --meta_batch_size 10 --meta_lr 0.001 --inner_lr 0.01 --layer 1 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.001_0.01_1_12.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 20 --meta_batch_size 10 --meta_lr 0.001 --inner_lr 0.01 --layer 1 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.001_0.01_1_20.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 6 --meta_batch_size 10 --meta_lr 0.001 --inner_lr 0.01 --layer 2 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.001_0.01_2_6.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 12 --meta_batch_size 10 --meta_lr 0.001 --inner_lr 0.01 --layer 2 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.001_0.01_2_12.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 20 --meta_batch_size 10 --meta_lr 0.001 --inner_lr 0.01 --layer 2 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.001_0.01_2_20.log

$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 6 --meta_batch_size 10 --meta_lr 0.001 --inner_lr 0.001 --layer 1 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.001_0.001_1_6.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 12 --meta_batch_size 10 --meta_lr 0.001 --inner_lr 0.001 --layer 1 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.001_0.001_1_12.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 20 --meta_batch_size 10 --meta_lr 0.001 --inner_lr 0.001 --layer 1 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.001_0.001_1_20.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 6 --meta_batch_size 10 --meta_lr 0.001 --inner_lr 0.001 --layer 2 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.001_0.001_2_6.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 12 --meta_batch_size 10 --meta_lr 0.001 --inner_lr 0.001 --layer 2 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.001_0.001_2_12.log
$python /root/capsule/code/tcrp/model/MAML_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 20 --tissue_num 20 --meta_batch_size 10 --meta_lr 0.001 --inner_lr 0.001 --layer 2 --run_name 210803_drug-baseline-models > /results/210803_drug-baseline-models/run-logs/Camptothecin/PDTC/PDTC_Camptothecin_0.001_0.001_2_20.log

