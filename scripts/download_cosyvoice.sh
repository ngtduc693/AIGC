#!/usr/bin/env bash

if [ ! -d "./models/CosyVoice2-0.5B" ]; then
  echo "Downloading CosyVoice"
  git lfs install
  git clone https://www.modelscope.cn/iic/CosyVoice2-0.5B.git ./models/CosyVoice2-0.5B
  echo "Download complete"
else
  echo "CosyVoice already exists"
fi