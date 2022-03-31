# March 31st 2022 
# Reproducibility instructions:
This code has been used in a reproducibility challenge. This code can be used to generate an end to end pipeline for baseline performance and few-shot learning corresponding to the paper "Few-shot learning creates predictive models of drug response that translate from high-throughput screens to individual patients".

Note: The TCRP data repsitory must be visited first.

The steps that can be taken using this respository to fully reproduce documented results are the following: 

## Before Starting 
Install all the dependencies specified the requirements.txt file or use the Docker file (must have GPU available) 
paths pointing to data-files in the following scripts must be edited to reflect absolute paths
- `code/pipelines/generate_fewshot_samples.py`
- `code/baselines/baseline_DRUG.py`
- `code/model/MAML_DRUG.py`
- `code/pipelines/prepare_complete_run.py`
## Quick Start:
- make a "results" directory in this repository
- generate baseline and MAMl performances in predicting drug response in PDTC cells by executing the bash script /code/run
- this script will run the scripts PDTC_commands.sh and MAML_commands.sh respectively. 
- move the output directroy, `merged_performances`, to the "data" directory 
- run the file /code/tcrp/model_comparisons/1-gather-baselines-and-fewshot.ipynb to get the comparison figures.
## End to End
- make a "results" directory in this repository
- copy the `data/merged` folder from [TCRP_data](https://github.com/emilyso-99/TCRP_data) to this repository, under the "data" directory 
- run the file `/code/tcrp/pipelines/prepare_complete_run.py` with run_mode (line 31) set to "baseline". (you may have to change paths to the code and data folder throughout the code)
- run the file `/code/tcrp/pipelines/prepare_complete_run.py` with run_mode (line 31) set to "tcrp". (you may have to change paths to the code and data folder throughout the code)
- run the "run" file. Performance results will be saved to your results directory, fewshot data will be saved to your data directory. 
- run the file /code/tcrp/model_comparisons/1-gather-baselines-and-fewshot.ipynb to get the comparison figures.
----------------
# Original Code 

# tcrp-reproduce
Refactored TCRP codebase with improved organization and additional code for data transformation and model selection. The original codebase can be accessed [here](https://github.com/idekerlab/TCRP). For high level questions regarding TCRP, check out the [TCRP FAQ](https://github.com/shfong/tcrp-reproduce/blob/public/tcrp-faq.md). 

## Instructions for a complete run
End-to-end run is quite completely glued together yet and will require a little bit of manual work. 

### Gathering data

This part of the pipeline is not automated yet. The raw data will need to be downloaded from DepMap, and the transformed data are generated in with a jupyter notebook `tcrp/data_preparation/process_sanger_drug_cell_line.ipynb`. This notebook will generate a series of pickled files and numpy compressed files that the following steps will be dependent on. 

### TCRP complete run

The code should all be contained in `prepare_complete_run.py`. This script will create a directory that contains all of commands to sweep through all hyperpameter for all of the specific drugs. The drugs analyzed correspond to the pickle files in `data/cell_line_lists`. Code to generate the pickled files still need to be included in this repository. Feel free to edit the `run_name` variable to change the run name. 

After the code is generated, the slurm submission scrips are created in `output/{RUN NAME}/MAML_cmd`. To submit all of the slurm scripts you can run the following: 
```ls run_MAML_drugs*.sh | awk '{k = "sbatch "$0""; system(k); print(k)}'```

### Baseline run

Edit `prepare_complete_run.py`. Change `run_mode` variable to `baseline` to run `generate_baseline_jobs.py`. In addition, point to the correct `fewshot_data_path`. This is a directory that was created in the tcrp complete run. It's simply the fewshot training and testing dataset that was used in the complete run.


## Parsing results
The results are all embedded as logs in `output/{RUN NAME}/run-logs/{DRUG}/{TISSUE}`. The log will specify the selected epoch for that hyperparameter and the correspond test performance. Additional code will be needed to gather the best performance to select the final performance for task.
