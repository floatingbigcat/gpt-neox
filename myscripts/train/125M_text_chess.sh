#!/bin/bash
#YBATCH -r a100_8
#SBATCH -N 1
#SBATCH -o /home/lfsm/gpt-neox/myouts/textchess%j.out
#SBATCH --time=72:00:00
#SBATCH -J textchess 
#SBATCH --error /home/lfsm/gpt-neox/myouts/textchess%j.err

module load cuda/12.2
# cp /mnt/nfs/Users/lfsm/game_master/ $HINADORI_LOCAL_SCRATCH
# cp /mnt/nfs/Users/lfsm/SlimPajama-6B/ $HINADORI_LOCAL_SCRATCH

python ./deepy.py train.py -d myconfigs 125M.yml textchess_setup.yml

