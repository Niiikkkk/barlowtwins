#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --gres=gpu:4
#SBATCH --job-name=barlowtwins
#SBATCH --mail-user=s319439@studenti.polito.it
#SBATCH --mail-type=END
#SBATCH --partition=cuda
#SBATCH --output=/home/nberardo/barlowtwins/train.log
#SBATCH --error=/home/nberardo/barlowtwins/train.err
###### 1 Load the module

module load nvidia/cudasdk
module load intel/python/3

# 2 Activate the virtual environment

source /home/nberardo/myenv/bin/activate

# 3 Run the python script

python evaluate.py /home/eaiello/ImageNet/ /home/nberardo/barlowtwins/checkpoint/resnet50.pth --lr-classifier 0.3
#python main.py --batch-size 256 --epochs 100 /home/eaiello/ImageNet/