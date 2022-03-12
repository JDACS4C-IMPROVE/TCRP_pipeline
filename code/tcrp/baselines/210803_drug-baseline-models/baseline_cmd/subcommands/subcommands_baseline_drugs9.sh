#!/bin/bash
python=/cellar/users/shfong/bin/miniconda3/envs/tcrp/bin/python
$python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue breast --drug RO-3306 --K 10 --num_trials 20 --run_name 210803_drug-baseline-models
$python /code/tcrp/baselines/baseline_DRUG.py --tissue breast --drug RO-3306 --K 10 --num_trials 20 --run_name 210803_drug-baseline-models --fewshot_data_path /results/output/
$python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue breast --drug GSK429286A --K 10 --num_trials 20 --run_name 210803_drug-baseline-models
$python /code/tcrp/baselines/baseline_DRUG.py --tissue breast --drug GSK429286A --K 10 --num_trials 20 --run_name 210803_drug-baseline-models --fewshot_data_path /results/output/
$python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue breast --drug Afatinib --K 10 --num_trials 20 --run_name 210803_drug-baseline-models
$python /code/tcrp/baselines/baseline_DRUG.py --tissue breast --drug Afatinib --K 10 --num_trials 20 --run_name 210803_drug-baseline-models --fewshot_data_path /results/output/
$python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue breast --drug JW-7-24-1 --K 10 --num_trials 20 --run_name 210803_drug-baseline-models
$python /code/tcrp/baselines/baseline_DRUG.py --tissue breast --drug JW-7-24-1 --K 10 --num_trials 20 --run_name 210803_drug-baseline-models --fewshot_data_path /results/output/
