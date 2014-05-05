#!/bin/bash 
#PBS -j oe 
#PBS -N Malloc
#PBS -q gpu_nodes

echo "Running on: " 
cat ${PBS_NODEFILE} 

echo 
echo "Program Output begins: " 
cd ${PBS_O_WORKDIR} 

# Call CUDA Malloc Program
# aprun ./cuda_malloc <size of malloc> <number of mallocs>
time aprun ./cuda_malloc 4 1000000

