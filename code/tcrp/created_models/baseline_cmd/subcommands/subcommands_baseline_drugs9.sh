#!/bin/bash
set -v 
python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue breast --drug TW_37 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
python /code/tcrp/baselines/baseline_DRUG.py --tissue breast --drug TW_37 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data
