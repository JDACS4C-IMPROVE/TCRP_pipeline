# March 31st 2022 
Adopted from original repository [tcrp-reproduce](https://github.com/shfong/tcrp-reproduce.git)
# Reproducibility instructions:
This code has been used in a reproducibility challenge. This code can be used to generate an end to end pipeline for baseline performance and few-shot learning corresponding to the paper "Few-shot learning creates predictive models of drug response that translate from high-throughput screens to individual patients". The workflow provided is to specifically reproduce, as best as possible, results for Challenge 2 of the paper: transfer to PDTCs.

Note: The TCRP data repsitory must be visited first.

The steps that can be taken using this respository to fully reproduce documented results are the following: 

## Before Starting 
Install all the dependencies specified the requirements.txt file (must have GPU available) 
paths pointing to data-files in the following scripts must be edited to reflect absolute paths
- `code/pipelines/generate_fewshot_samples.py`
- `code/baselines/baseline_DRUG.py`
- `code/model/MAML_DRUG.py`
- `code/pipelines/prepare_complete_run.py`
## Running the Code
- make a "results" directory in this repository
- copy the `data/merged` folder from [TCRP_data](https://github.com/emilyso-99/TCRP_data) to this repository, under the "data" directory (notebook from TCRP_data must be run to generate merged data) 
- run the file `/code/tcrp/pipelines/prepare_complete_run.py` with run_mode (line 31) set to "baseline". (you may have to change paths to the code and data folder throughout the code)
- run the file `/code/tcrp/pipelines/prepare_complete_run.py` with run_mode (line 31) set to "tcrp". (you may have to change paths to the code and data folder throughout the code)
- commands for baseline runs and MAML runs will be saved in `code/created_models`, in `MAML_cmd` and `baseline_cmd` respectively.
- run the "run" file. Performance results will be saved to your results directory, fewshot data will be saved to your data directory. 
- run the file /code/tcrp/model_comparisons/1-gather-baselines-and-fewshot.ipynb to get the comparison figures.
----------------

