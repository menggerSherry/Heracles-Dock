#!/bin/bash
#SBATCH --job-name=mxy
#SBATCH --partition=a100
#SBATCH -n 1
#SBATCH -c 25
#SBATCH -w g02
#SBATCH --ntasks-per-node=1
#SBATCH --gres=gpu:1
#SBATCH --output=./log/log_process%j.out
#SBATCH --error=./log/log_process%j.err


# export LD_LIBRARY_PATH=/share/home/mengxiangyu/light_dock/lib:$LD_LIBRARY_PATH

# nvidia-smi
# module load gcc-9.5.0-gcc-4.8.5-wybfp4j
# module load cuda/11.6
# export CUDA_VISIBLE_DEVICES=1
ncu --set full -f -o kernel_l2compress ./compress