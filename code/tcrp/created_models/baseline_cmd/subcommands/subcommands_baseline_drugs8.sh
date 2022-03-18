#!/bin/bash
python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue breast --drug Embelin --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
python /code/tcrp/baselines/baseline_DRUG.py --tissue breast --drug Embelin --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data
python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue breast --drug Vismodegib --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
python /code/tcrp/baselines/baseline_DRUG.py --tissue breast --drug Vismodegib --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data
python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue breast --drug Tubastatin_A --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
python /code/tcrp/baselines/baseline_DRUG.py --tissue breast --drug Tubastatin_A --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data
python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue breast --drug NVP-BHG712 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
python /code/tcrp/baselines/baseline_DRUG.py --tissue breast --drug NVP-BHG712 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data
