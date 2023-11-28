#!/bin/bash


module load cuda/12.2

python ./deepy.py train.py -d myconfigs 125M.yml chess_setup.yml
