#!/bin/bash
python=/cellar/users/shfong/bin/miniconda3/envs/tcrp/bin/python
$python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue breast --drug Embelin --K 10 --num_trials 20 --run_name 210803_drug-baseline-models
$python /code/tcrp/baselines/baseline_DRUG.py --tissue breast --drug Embelin --K 10 --num_trials 20 --run_name 210803_drug-baseline-models --fewshot_data_path /results/output/
$python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue breast --drug QL-X-138 --K 10 --num_trials 20 --run_name 210803_drug-baseline-models
$python /code/tcrp/baselines/baseline_DRUG.py --tissue breast --drug QL-X-138 --K 10 --num_trials 20 --run_name 210803_drug-baseline-models --fewshot_data_path /results/output/
$python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue breast --drug NPK76-II-72-1 --K 10 --num_trials 20 --run_name 210803_drug-baseline-models
$python /code/tcrp/baselines/baseline_DRUG.py --tissue breast --drug NPK76-II-72-1 --K 10 --num_trials 20 --run_name 210803_drug-baseline-models --fewshot_data_path /results/output/
