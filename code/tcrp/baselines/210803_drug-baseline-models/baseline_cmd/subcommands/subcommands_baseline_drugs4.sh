#!/bin/bash
python=/cellar/users/shfong/bin/miniconda3/envs/tcrp/bin/python
$python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue breast --drug Camptothecin --K 10 --num_trials 20 --run_name 210803_drug-baseline-models
$python /code/tcrp/baselines/baseline_DRUG.py --tissue breast --drug Camptothecin --K 10 --num_trials 20 --run_name 210803_drug-baseline-models --fewshot_data_path /results/output/
$python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue breast --drug CCT007093 --K 10 --num_trials 20 --run_name 210803_drug-baseline-models
$python /code/tcrp/baselines/baseline_DRUG.py --tissue breast --drug CCT007093 --K 10 --num_trials 20 --run_name 210803_drug-baseline-models --fewshot_data_path /results/output/
$python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue breast --drug Temsirolimus --K 10 --num_trials 20 --run_name 210803_drug-baseline-models
$python /code/tcrp/baselines/baseline_DRUG.py --tissue breast --drug Temsirolimus --K 10 --num_trials 20 --run_name 210803_drug-baseline-models --fewshot_data_path /results/output/
$python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue breast --drug CAY10603 --K 10 --num_trials 20 --run_name 210803_drug-baseline-models
$python /code/tcrp/baselines/baseline_DRUG.py --tissue breast --drug CAY10603 --K 10 --num_trials 20 --run_name 210803_drug-baseline-models --fewshot_data_path /results/output/
