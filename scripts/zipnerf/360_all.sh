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
DATA_DIR=$1
CHECKPOINT_DIR=$2
SCENA=$3

./scripts/zipnerf/360_train.sh "$DATA_DIR" "$CHECKPOINT_DIR" "$SCENA"
./scripts/zipnerf/360_eval.sh "$DATA_DIR" "$CHECKPOINT_DIR" "$SCENA"
./scripts/zipnerf/360_render.sh "$DATA_DIR" "$CHECKPOINT_DIR" "$SCENA"
python scripts/zipnerf/generate_tables_360.py 
