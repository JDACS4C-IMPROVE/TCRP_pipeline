#!/bin/bash
set -v 
python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue PDTC --drug KU-55933 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
# python /code/tcrp/baselines/baseline_DRUG.py --tissue PDTC --drug KU-55933 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data
python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue PDTC --drug BMS-536924 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
# python /code/tcrp/baselines/baseline_DRUG.py --tissue PDTC --drug BMS-536924 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data
python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue PDTC --drug JW-7-24-1 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
# python /code/tcrp/baselines/baseline_DRUG.py --tissue PDTC --drug JW-7-24-1 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data
python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue PDTC --drug QL-XII-61 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
# python /code/tcrp/baselines/baseline_DRUG.py --tissue PDTC --drug QL-XII-61 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data
