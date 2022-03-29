#!/bin/bash
python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue PDTC --drug Gefitinib --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
# python /code/tcrp/baselines/baseline_DRUG.py --tissue PDTC --drug Gefitinib --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data
python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue PDTC --drug SN-38 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
# python /code/tcrp/baselines/baseline_DRUG.py --tissue PDTC --drug SN-38 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data
python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue PDTC --drug HG-5-88-01 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
# python /code/tcrp/baselines/baseline_DRUG.py --tissue PDTC --drug HG-5-88-01 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data
python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue PDTC --drug IPA-3 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
# python /code/tcrp/baselines/baseline_DRUG.py --tissue PDTC --drug IPA-3 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data
