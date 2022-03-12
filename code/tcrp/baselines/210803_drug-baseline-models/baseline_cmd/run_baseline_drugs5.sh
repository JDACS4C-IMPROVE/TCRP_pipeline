#!/bin/bash
#SBATCH --job-name drugs5
#SBATCH --output=/code/tcrp/baselines/210803_drug-baseline-models/baseline-slurm-logs/drugs5.%j
#SBATCH --cpus-per-task=16
#SBATCH --mem=64G
#SBATCH --partition=nrnb-compute
/usr/bin/bash /code/tcrp/baselines/210803_drug-baseline-models/baseline_cmd/subcommands/subcommands_baseline_drugs5.sh
