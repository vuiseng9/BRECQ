#!/usr/bin/env bash

WORKDIR=/PATH/TO/BRECQ
DATADIR=/PATH/TO/IMAGENET
RUN_LABEL="mobilenetv2_w2_0.1"
export CUDA_VISIBLE_DEVICES=1

RUN_DIR=${WORKDIR}/runs/${RUN_LABEL}
mkdir -p ${RUN_DIR}

cd ${WORKDIR}

nohup python main_imagenet.py \
    --data_path ${DATADIR} \
    --arch mobilenetv2 \
    --n_bits_w 2 \
    --channel_wise \
    --weight 0.1 2>&1 | tee ${RUN_DIR}/brecq.${RUN_LABEL}.log &