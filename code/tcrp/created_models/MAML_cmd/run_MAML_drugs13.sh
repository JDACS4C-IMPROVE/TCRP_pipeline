#!/bin/bash
#SBATCH --job-name drugs13
#SBATCH --output=/results/210803_drug-baseline-models/slurm-logs/drugs13.%j
#SBATCH --cpus-per-task=4
#SBATCH --mem=64G
#SBATCH --partition=nrnb-gpu
#SBATCH --account=nrnb-gpu
#SBATCH --gres=gpu:1

/usr/bin/bash /results/210803_drug-baseline-models/MAML_cmd/subcommands/subcommands_MAML_drugs13.sh
