#!/bin/bash
#YBATCH -r 6000_8
#SBATCH -N 1
#SBATCH -o /home/lfsm/gpt-neox/myouts/textonly%j.out
#SBATCH --time=72:00:00
#SBATCH -J textonly 
#SBATCH --error /home/lfsm/gpt-neox/myouts/textonly%j.err

module load cuda/12.2

python ./deepy.py train.py -d myconfigs 125M.yml textonly_setup.yml

# python ./deepy.py train.py -d myconfigs 19M.yml chess_setup.yml


"""
bs:
"""