#!/bin/bash
#SBATCH --job-name drugs11
#SBATCH --output=/code/tcrp/created_models/baseline-slurm-logs/drugs11.%j
#SBATCH --cpus-per-task=16
#SBATCH --mem=64G
#SBATCH --partition=nrnb-compute
/code/tcrp/created_models/baseline_cmd/subcommands/subcommands_baseline_drugs11.sh
