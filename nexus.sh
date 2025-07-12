#!/bin/bash
set -e

sudo apt update
sudo apt install -y git-lfs libgl1-mesa-glx
git lfs install
git submodule update --init --recursive

curl -LsSf https://astral.sh/uv/install.sh | sh

pip install uv
uv venv --python 3.11.11
source .venv/bin/activate

uv pip install setuptools pip
uv sync --all-packages

chmod +x ./scripts/*.sh

./scripts/download_MiniCPM-o_2.6-int4.sh
./scripts/download_musetalk_weights.sh
ln -s $(pwd)/models/musetalk/s3fd-619a316812/* ~/.cache/torch/hub/checkpoints/
./scripts/download_liteavatar_weights.sh
./scripts/download_cosyvoice.sh

uv pip install auto-gptq
uv pip uninstall -y mmcv
uv pip install mmcv==2.2.0 -f https://download.openmmlab.com/mmcv/dist/cu121/torch2.4/index.html

CONFIG=config/nexus_chat_with_local_minicpm_cosyvoice_musetalk.yaml
./scripts/pre_config_install.sh --config "$CONFIG"
uv run install.py --uv --config "$CONFIG"
./scripts/post_config_install.sh --config "$CONFIG"

echo "Nexus setup complete. Demo will run."
uv run src/demo.py --config "$CONFIG"
