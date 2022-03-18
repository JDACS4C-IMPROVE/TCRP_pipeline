#!/bin/bash
python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue breast --drug KU-55933 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
python /code/tcrp/baselines/baseline_DRUG.py --tissue breast --drug KU-55933 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data
python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue breast --drug BMS-536924 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
python /code/tcrp/baselines/baseline_DRUG.py --tissue breast --drug BMS-536924 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data
python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue breast --drug Obatoclax_Mesylate --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
python /code/tcrp/baselines/baseline_DRUG.py --tissue breast --drug Obatoclax_Mesylate --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data
python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue breast --drug QL-XI-92 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
python /code/tcrp/baselines/baseline_DRUG.py --tissue breast --drug QL-XI-92 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data
