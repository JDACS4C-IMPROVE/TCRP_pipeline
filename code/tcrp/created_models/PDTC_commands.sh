!/bin/bash
set -v 
python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue PDTC --drug 681640 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
python /code/tcrp/baselines/baseline_DRUG.py --tissue PDTC --drug 681640 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data

python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue PDTC --drug Axitinib --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
python /code/tcrp/baselines/baseline_DRUG.py --tissue PDTC --drug Axitinib --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data

python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue PDTC --drug AZ628 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
python /code/tcrp/baselines/baseline_DRUG.py --tissue PDTC --drug AZ628 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data

python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue PDTC --drug AZD7762 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
python /code/tcrp/baselines/baseline_DRUG.py --tissue PDTC --drug AZD7762 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data

python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue PDTC --drug Bosutinib --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
python /code/tcrp/baselines/baseline_DRUG.py --tissue PDTC --drug Bosutinib --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data

python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
python /code/tcrp/baselines/baseline_DRUG.py --tissue PDTC --drug Camptothecin --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data

python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue PDTC --drug CHIR-99021 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
python /code/tcrp/baselines/baseline_DRUG.py --tissue PDTC --drug CHIR-99021 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data

python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue PDTC --drug Embelin --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
python /code/tcrp/baselines/baseline_DRUG.py --tissue PDTC --drug Embelin --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data

python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue PDTC --drug Gefitinib --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
python /code/tcrp/baselines/baseline_DRUG.py --tissue PDTC --drug Gefitinib --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data

python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue PDTC --drug JQ1 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
python /code/tcrp/baselines/baseline_DRUG.py --tissue PDTC --drug JQ1 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data

python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue PDTC --drug KU-55933 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
python /code/tcrp/baselines/baseline_DRUG.py --tissue PDTC --drug KU-55933 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data

python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue PDTC --drug MK-2206 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
python /code/tcrp/baselines/baseline_DRUG.py --tissue PDTC --drug MK-2206 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data

python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue PDTC --drug RO-3306 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
python /code/tcrp/baselines/baseline_DRUG.py --tissue PDTC --drug RO-3306 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data

python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue PDTC --drug RO-3306 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
python /code/tcrp/baselines/baseline_DRUG.py --tissue PDTC --drug RO-3306 --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data

python /root/capsule/code/tcrp/pipelines/generate_fewshot_samples.py --tissue PDTC --drug Sorafenib --K 10 --num_trials 10 --run_name 210803_drug-baseline-models
python /code/tcrp/baselines/baseline_DRUG.py --tissue PDTC --drug Sorafenib --K 10 --num_trials 10 --run_name 210803_drug-baseline-models --fewshot_data_path /data/fewshot_data
