import os
import pandas as pd
import jsonlines
from tqdm import tqdm
import pyarrow as pa

# input_dir='/home/lfsm/.cache/huggingface/hub/datasets--laion--strategic_game_chess/snapshots/2895b6e29b40eaa88d5eb603d29aafc90058b740'
input_dir='/mnt/nfs/Users/lfsm/SlimPajama-6B/parquet/datasets--DKYoon--SlimPajama-6B/snapshots/b5f90f419b7489cdba26fdbc8c022fcb5562f968/data'
# out_dir = '/mnt/nfs/Users/lfsm/chess/jsonl'
out_dir = '/mnt/nfs/Users/lfsm/SlimPajama-6B/jsonl'

for input_path in os.listdir(input_dir):
    name = os.path.basename(input_path)
    jsonl_file = os.path.join(out_dir,name).replace('parquet','jsonl')
    input_path = os.path.join(input_dir,input_path)
    df = pd.read_parquet(input_path)
    with jsonlines.open(jsonl_file, 'w') as writer:
        for index, row in tqdm(df.iterrows()):
            json_obj = {'text':row['text']}
            writer.write(json_obj)


# for input_path in os.listdir(input_dir):
#     name = os.path.basename(input_path)
#     jsonl_file = os.path.join(out_dir,name).replace('parquet','jsonl')
#     input_path = os.path.join(input_dir,input_path)
#     df = pd.read_parquet(input_path)

#     with jsonlines.open(jsonl_file, 'w') as writer:
#         for index, row in tqdm(df.iterrows()):
#             text=f"Termination: {row['Termination']}, result:{row['Result']}"
#             for move in row['Moves']:
#                 text += ' '+str(move)
#             json_obj = {'text':text}
#             writer.write(json_obj)


