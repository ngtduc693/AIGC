#!/usr/bin/env bash

if [ ! -d "./models/CosyVoice2-0.5B" ]; then
  echo "Downloading CosyVoice"
  git lfs install
  git clone https://www.modelscope.cn/studios/iic/CosyVoice2-0.5B ./models/CosyVoice2-0.5B
  echo "Download complete"
else
  echo "CosyVoice already exists"
fi