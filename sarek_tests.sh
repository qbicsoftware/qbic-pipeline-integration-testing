#!/bin/bash
#@author: Alexander Peltzer
#Please stage data beforehand using datastager.sh
module purge 
module load qbic/qpostman/0.3.0
module load qbic/singularity_slurm/3.0.3
module load devel/java_jdk/1.8.0u121
nextflow pull scilifelab/Sarek #to get newest versions of workflow releases loaded on cfc

# Only argument, is which release should be tested (e.g. '1.3' or 'dev')
RELEASE=$1

##Run No1 of the integration test samples
#Run Mapping first
nextflow run scilifelab/Sarek/main.nf -profile cfc -r ${RELEASE} --genome 'GRCh37' --sample 'sarek-testsets/wes_input.tsv' --outdir "results/sarek/wes"

#Run VC on germline data next
nextflow run scilifelab/Sarek/germlineVC.nf -profile cfc -r ${RELEASE} --genome 'GRCh37' --sample 'results/sarek/wes/Preprocessing/Recalibrated/recalibrated.tsv' --tools 'HaplotypeCaller,strelka,manta' --targetBED 'sarek-testsets/testcap.bed' --outdir "results/sarek/wes"

#Run VC on somatic data next
nextflow run scilifelab/Sarek/somaticVC.nf -profile cfc -r ${RELEASE} --genome 'GRCh37' --sample 'results/sarek/wes/Preprocessing/Recalibrated/recalibrated.tsv'  --tools manta,strelka,ascat,mutect2 --targetBED 'sarek-testsets/testcap.bed'

#Annotate this stuff
nextflow run scilifelab/Sarek/annotate.nf -profile cfc -r ${RELEASE} --genome 'GRCh37' --annotateTools 'HaplotypeCaller,strelka,manta' --tools 'VEP,snpEff' --outdir "results/sarek/wes"

#Run MultiQC on the stuff
nextflow run scilifelab/Sarek/runMultiQC.nf -profile cfc -r ${RELEASE} --outdir "results/sarek/wes"


