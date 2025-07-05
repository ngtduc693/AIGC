#!/bin/bash
set -e

echo "▶ Downloading all minimal models for AI Avatar Chat (MiniCPM + LAM + CosyVoice)"

chmod +x ./scripts/*.sh
./scripts/download_MiniCPM-o_2.6-int4.sh
./scripts/download_cosyvoice_model.sh
./scripts/download_lam_audio2exp.sh
./scripts/download_wav2vec.sh

echo "✅ All models downloaded into ./models"
