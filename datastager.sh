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
qpostman-0.3.0 -f ../../rnaseq-testsets/rnaseq-dataset1.txt -u iiipe01
cd ../..
mkdir -p rnaseq/mouse/
cd rnaseq/mouse/
qpostman-0.3.0 -f ../../rnaseq-testsets/rnaseq-dataset2.txt -u iiipe01
cd ../..
mkdir -p sarek/wes/
cd sarek/wes
qpostman-0.3.0 -f ../../sarek-testsets/wes-dataset.txt 
cd ../.. 
mkdir -p sarek/wgs/
cd sarek/wgs
qpostman-0.3.0 -f ../../sarek-testsets/wgs-dataset.txt 

