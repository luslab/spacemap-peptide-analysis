#!/usr/bin/env bash

#SBATCH --ntasks 1
#SBATCH --cpus-per-task 1
#SBATCH --mem 4G
#SBATCH --time 10:00

python classify_domains.py
