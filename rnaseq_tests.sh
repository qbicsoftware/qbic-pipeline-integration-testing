#!/bin/bash
#@author: Alexander Peltzer
#Please stage data beforehand using datastager.sh
module purge 
module load qbic/qpostman/0.3.0
module load devel/singularity/3.4.2
module load devel/java_jdk/1.8.0u121
nextflow pull nf-core/rnaseq #to get newest versions of workflow releases loaded on cfc

# Only argument, is which release should be tested (e.g. '1.3' or 'dev')
RELEASE=$1

##Run No1 of the integration test samples
nextflow run nf-core/rnaseq -profile cfc -r ${RELEASE} --genome 'GRCm38' --reads 'rnaseq/mouse/*.fastq.gz' --singleEnd --outdir "results/rnaseq/mouse"

##Run No2 of the integration test samples
nextflow run nf-core/rnaseq -profile cfc -r ${RELEASE} --genome 'GRCh37' --reads 'rnaseq/human/*R{1,2}*fastq.gz' --outdir "results/rnaseq/human"
