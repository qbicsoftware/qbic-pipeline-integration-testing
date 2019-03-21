#!/bin/bash
# This is a one-time runner required for setting up the data for the analysis tests. 
###Load required modules 
module purge 
module load qbic/qpostman/0.3.0
module load qbic/singularity_slurm/3.0.3
module load devel/java_jdk/1.8.0u121

###Stage Data now
mkdir -p rnaseq/human/
cd rnaseq/human/
qpostman-0.3.0 -f rnaseq-dataset1.txt -u iiipe01
cd ../..
mkdir -p rnaseq/mouse/
cd rnaseq/mouse/
qpostman-0.3.0 -f rnaseq-dataset2.txt -u iiipe01
cd ../..
mkdir sarek/wes/
cd sarek/wes
qpostman-0.3.0 -f wes-dataset.txt 
cd ../.. 

