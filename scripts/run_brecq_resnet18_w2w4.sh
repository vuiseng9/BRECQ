#!/usr/bin/env bash

WORKDIR=/PATH/TO/BRECQ
DATADIR=/PATH/TO/IMAGENET
RUN_LABEL="resnet18_w2w4"
export CUDA_VISIBLE_DEVICES=0

RUN_DIR=${WORKDIR}/runs/${RUN_LABEL}
mkdir -p ${RUN_DIR}
cd ${WORKDIR}

nohup python main_imagenet.py \
    --data_path ${DATADIR} \
    --arch resnet18 \
    --n_bits_w 2 \
    --n_bits_a 4 \
    --act_quant \
    --test_before_calibration 2>&1 | tee ${RUN_DIR}/brecq.${RUN_LABEL}.log &