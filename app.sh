#!/bin/bash

/opt/Intel/bin/spark-submit-with-zoo.sh --master local[2] --num-executors 2 --executor-cores 8 --driver-memory 40g --executor-memory 40g /mnt/logic.py
