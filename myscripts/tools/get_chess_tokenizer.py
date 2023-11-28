from transformers import AutoTokenizer

def add_chess_tokens(tokenizer):
    """add all possable moves of chess game"""
    positions=[]
    for i in {'a','b','c','d','e','f','g','h'}:
        for j in {1,2,3,4,5,6,7,8}:
            positions.append(i+str(j))
    for pos_i in positions:
        for pos_j in positions:
            if pos_i != pos_j:
                chess_token=pos_i+pos_j
                chess_token_q=pos_i+pos_j+'q' # piece upgrade to queen
                tokenizer.add_tokens(chess_token) 
                tokenizer.add_tokens(chess_token_q) 

name = "HFChessLlamaTokenizer"
tokenizer = AutoTokenizer.from_pretrained('meta-llama/Llama-2-7b-hf',add_eos_token=True, use_fast=True)
tokenizer.add_special_tokens({"pad_token":"<pad>"})
add_chess_tokens(tokenizer)

import os
from huggingface_hub import HfApi
api = HfApi()
folder='/home/lfsm/models/gamemaestro'
for f_name in os.listdir(folder):
    api.upload_file(
        path_or_fileobj=os.path.join(folder,name),
        path_in_repo=f_name,
        repo_id="lfsm/game_maestro",
        repo_type="model",
    )