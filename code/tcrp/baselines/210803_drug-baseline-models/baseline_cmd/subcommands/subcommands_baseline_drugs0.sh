#!/bin/bash
python3 /code/tcrp/pipelines/generate_fewshot_samples.py --tissue breast --drug Gefitinib --K 10 --num_trials 20 --run_name 210803_drug-baseline-models
python3 /code/tcrp/baselines/baseline_DRUG.py --tissue breast --drug Gefitinib --K 10 --num_trials 20 --run_name 210803_drug-baseline-models --fewshot_data_path /results/output/
python3 /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue breast --drug CUDC-101 --K 10 --num_trials 20 --run_name 210803_drug-baseline-models
python3 /code/tcrp/baselines/baseline_DRUG.py --tissue breast --drug CUDC-101 --K 10 --num_trials 20 --run_name 210803_drug-baseline-models --fewshot_data_path /results/output/
python3 /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue breast --drug XMD11-85h --K 10 --num_trials 20 --run_name 210803_drug-baseline-models
python3 /code/tcrp/baselines/baseline_DRUG.py --tissue breast --drug XMD11-85h --K 10 --num_trials 20 --run_name 210803_drug-baseline-models --fewshot_data_path /results/output/
