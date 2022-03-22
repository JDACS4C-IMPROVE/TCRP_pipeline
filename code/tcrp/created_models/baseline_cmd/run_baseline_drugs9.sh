#!/bin/bash
#SBATCH --job-name drugs9
#SBATCH --output=/code/tcrp/created_models/baseline-slurm-logs/drugs9.%j
#SBATCH --cpus-per-task=16
#SBATCH --mem=64G
#SBATCH --partition=nrnb-compute
/code/tcrp/created_models/baseline_cmd/subcommands/subcommands_baseline_drugs9.sh