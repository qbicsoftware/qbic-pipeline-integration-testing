#!/bin/bash
#@author: Alexander Peltzer
#Please stage data beforehand using datastager.sh
module purge 
module load qbic/qpostman/0.3.0
module load qbic/singularity_slurm/3.0.3
module load devel/java_jdk/1.8.0u121
nextflow pull nf-core/sarek #to get newest versions of workflow releases loaded on cfc

# Only argument, is which release should be tested (e.g. '1.3' or 'dev')
RELEASE=$1

##Run No1 of the integration test samples (WES data, somatic and germline)
nextflow run nf-core/sarek -profile cfc -r ${RELEASE} --genome GRCh37 --input sarek-testsets/wes_input.tsv --tools HaplotypeCaller,Strelka,manta,ascat,mutect2,controlFreec,VEP,snpEff --targetBED sarek-testsets/testcap.bed --outDir results/sarek/wes -resume
