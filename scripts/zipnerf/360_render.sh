# Copyright 2023 The Google Research Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#!/bin/bash
# Script for rendering the 360 dataset.

export CUDA_VISIBLE_DEVICES=0

#DATA_DIR=/mnt/c/Users/mwara/PycharmProjects/camp_zipnerf/data/360
#CHECKPOINT_DIR=~/tmp/zipnerf/360
#DATA_DIR=./data/360
#CHECKPOINT_DIR=/zipnerf/tmp/360
DATA_DIR=$1
CHECKPOINT_DIR=$2
SCENA=$3

for SCENE in "$SCENA"
do
  python -m camp_zipnerf.render \
    --gin_configs=configs/zipnerf/360.gin \
    --gin_bindings="Config.data_dir = '${DATA_DIR}/${SCENE}'" \
    --gin_bindings="Config.checkpoint_dir = '${CHECKPOINT_DIR}/${SCENE}'" \
    --gin_bindings="Config.render_dir = '${CHECKPOINT_DIR}/${SCENE}/render/'" \
    --gin_bindings="Config.render_path = True" \
    --gin_bindings="Config.render_path_frames = 480" \
    --gin_bindings="Config.render_video_fps = 60"
done