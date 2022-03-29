#!/bin/bash
set -v 
python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue PDTC --drug GSK269962A --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
# python /code/tcrp/baselines/baseline_DRUG.py --tissue PDTC --drug GSK269962A --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data
python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue PDTC --drug QL-XI-92 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
# python /code/tcrp/baselines/baseline_DRUG.py --tissue PDTC --drug QL-XI-92 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data
python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue PDTC --drug KIN001-270 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
# python /code/tcrp/baselines/baseline_DRUG.py --tissue PDTC --drug KIN001-270 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data
python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue PDTC --drug Vismodegib --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
# python /code/tcrp/baselines/baseline_DRUG.py --tissue PDTC --drug Vismodegib --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data
python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue PDTC --drug QL-VIII-58 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
# python /code/tcrp/baselines/baseline_DRUG.py --tissue PDTC --drug QL-VIII-58 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data
