#!/bin/bash
python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue breast --drug JQ1 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
python /code/tcrp/baselines/baseline_DRUG.py --tissue breast --drug JQ1 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data
python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue breast --drug OSI-930 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
python /code/tcrp/baselines/baseline_DRUG.py --tissue breast --drug OSI-930 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data
python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue breast --drug ZG-10 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
python /code/tcrp/baselines/baseline_DRUG.py --tissue breast --drug ZG-10 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data
