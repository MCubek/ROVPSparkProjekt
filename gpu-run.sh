#!/bin/bash
# Copyright (c) 2022, NVIDIA CORPORATION. All rights reserved.
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

# change to your spark folder
SPARK_HOME=${SPARK_HOME:-/home/mcubek/cuspatial/spark-3.1.1-bin-hadoop3.2}

# change this path to your root path for the dataset
DATA_PATH=${DATA_PATH:-/home/mcubek/cuspatial/cuspatial_data}
# Copy the polygons and points data into the root path or change the root path to where they are
SHAPE_FILE_DIR=$DATA_PATH/polygons
SHAPE_FILE_NAME="polygons"
DATA_IN_PATH=$DATA_PATH/points
DATA_OUT_PATH=$DATA_PATH/output
PYTHON_FILE_PATH=${PYTHON_FILE_PATH:-./spatial_join.py}

rm -rf $DATA_OUT_PATH

# the path to keep the jars of spark-rapids & spark-cuspatial
JARS=${SPARK_CUSPATIAL_DIR:-$ROOT_PATH/jars}

JARS_PATH=${JARS_PATH:-$JARS/rapids-4-spark_2.12-22.06.0.jar,$JARS/spark-cuspatial-22.06.0-SNAPSHOT.jar}

$SPARK_HOME/bin/spark-submit --master spark://$HOSTNAME:7077 \
--name "Gpu Spatial Join UDF" \
--executor-memory 20G \
--executor-cores 10 \
--conf spark.task.cpus=1 \
--conf spark.sql.adaptive.enabled=false \
--conf spark.plugins=com.nvidia.spark.SQLPlugin \
--conf spark.rapids.sql.explain=all \
--conf spark.executor.resource.gpu.amount=1 \
--conf spark.cuspatial.sql.udf.shapeFileName="$SHAPE_FILE_NAME.shp" \
--conf spark.driver.extraLibraryPath=$LD_LIBRARY_PATH \
--conf spark.executor.extraLibraryPath=$LD_LIBRARY_PATH \
--jars $JARS_PATH \
--files $SHAPE_FILE_DIR/$SHAPE_FILE_NAME.shp,$SHAPE_FILE_DIR/$SHAPE_FILE_NAME.shx \
$PYTHON_FILE_PATH $DATA_IN_PATH $DATA_OUT_PATH