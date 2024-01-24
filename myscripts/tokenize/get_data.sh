#!/bin/bash

folder='/mnt/nfs/Users/lfsm/chess/mix_template_jsonl'
# cp -r $folder $HINADORI_LOCAL_SCRATCH
# files=$(find $HINADORI_LOCAL_SCRATCH/jsonl -type f -printf "%p,")
files=$(find $folder -type f -printf "%p,")
files=${files%,}  # Remove the trailing comma
python /home/lfsm/code/gpt-neox/tools/datasets/preprocess_data.py \
            --input $files \
            --output-prefix /mnt/nfs/Users/lfsm/game_master/mix_template_chess \
            --dataset-impl mmap \
            --tokenizer-type HFTokenizer \
            --vocab-file lfsm/game_maestro \
            --append-eod \
            --workers 64 

# folder='/mnt/nfs/Users/lfsm/SlimPajama-6B/jsonl'
# # cp -r $folder $HINADORI_LOCAL_SCRATCH
# # files=$(find $HINADORI_LOCAL_SCRATCH/jsonl -type f -printf "%p,")
# files=$(find $folder -type f -printf "%p,")
# files=${files%,}  # Remove the trailing comma
# python /home/lfsm/gpt-neox/tools/datasets/preprocess_data.py \
#             --input $files \
#             --output-prefix /mnt/nfs/Users/lfsm/SlimPajama-6B/slp_6b \
#             --dataset-impl mmap \
#             --tokenizer-type HFTokenizer \
#             --vocab-file lfsm/game_maestro \
#             --append-eod \
#             --workers 64 \


