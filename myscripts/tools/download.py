from huggingface_hub import hf_hub_download,snapshot_download

# for i in range(8,10):
#     hf_hub_download(
#         repo_id="laion/strategic_game_chess", filename=f"chess_game_000{i}.parquet",
#         repo_type="dataset"
#     )

snapshot_download(
        repo_id="DKYoon/SlimPajama-6B",
        repo_type="dataset",
        cache_dir='/mnt/nfs/Users/lfsm/SlimPajama-6B/parquet'
    )

# /mnt/nfs/Users/lfsm/SlimPajama-6B