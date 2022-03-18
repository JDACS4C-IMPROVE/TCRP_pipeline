#!/bin/bash
python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue breast --drug AZD7762 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
python /code/tcrp/baselines/baseline_DRUG.py --tissue breast --drug AZD7762 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data
python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue breast --drug AT-7519 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
python /code/tcrp/baselines/baseline_DRUG.py --tissue breast --drug AT-7519 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data
python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue breast --drug NPK76-II-72-1 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
python /code/tcrp/baselines/baseline_DRUG.py --tissue breast --drug NPK76-II-72-1 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data
