#!/usr/bin/env bash

if [ ! -d "./models/cosyvoice-v1" ]; then
  echo "Downloading CosyVoice"
  git lfs install
  git clone https://www.modelscope.cn/studios/iic/CosyVoice2-0.5B ./models/cosyvoice-v1
  echo "Download complete"
else
  echo "CosyVoice already exists"
fi