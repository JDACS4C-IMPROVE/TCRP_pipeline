#!/bin/bash
python=/cellar/users/shfong/bin/miniconda3/envs/tcrp/bin/python
$python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue breast --drug GSK269962A --K 10 --num_trials 20 --run_name 210803_drug-baseline-models
$python /code/tcrp/baselines/baseline_DRUG.py --tissue breast --drug GSK269962A --K 10 --num_trials 20 --run_name 210803_drug-baseline-models --fewshot_data_path /results/output/
$python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue breast --drug XMD15-27 --K 10 --num_trials 20 --run_name 210803_drug-baseline-models
$python /code/tcrp/baselines/baseline_DRUG.py --tissue breast --drug XMD15-27 --K 10 --num_trials 20 --run_name 210803_drug-baseline-models --fewshot_data_path /results/output/
$python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue breast --drug IPA-3 --K 10 --num_trials 20 --run_name 210803_drug-baseline-models
$python /code/tcrp/baselines/baseline_DRUG.py --tissue breast --drug IPA-3 --K 10 --num_trials 20 --run_name 210803_drug-baseline-models --fewshot_data_path /results/output/
