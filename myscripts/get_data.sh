#!/bin/bash

folder='/mnt/nfs/Users/lfsm/chess/jsonl'
cp -r $folder $HINADORI_LOCAL_SCRATCH
files=$(find $HINADORI_LOCAL_SCRATCH/jsonl -type f -printf "%p,")
files=${files%,}  # Remove the trailing comma
python tools/preprocess_data.py \
            --input $files \
            --output-prefix /mnt/nfs/Users/lfsm/chess/chess \
            --dataset-impl mmap \
            --tokenizer-type HFChessLlamaTokenizer \
            --vocab-file /mnt/nfs/Users/tn/llama2/tokenizer.model \
            --append-eod \
            --workers 64 

folder='/mnt/nfs/Users/lfsm/SlimPajama-6B/jsonl'
cp -r $folder $HINADORI_LOCAL_SCRATCH
files=$(find $HINADORI_LOCAL_SCRATCH/jsonl -type f -printf "%p,")
files=${files%,}  # Remove the trailing comma
python tools/preprocess_data.py \
            --input $files \
            --output-prefix /mnt/nfs/Users/lfsm/SlimPajama-6B/slp_6b \
            --dataset-impl mmap \
            --tokenizer-type HFChessLlamaTokenizer \
            --vocab-file /mnt/nfs/Users/tn/llama2/tokenizer.model \
            --append-eod \
            --workers 64 \
