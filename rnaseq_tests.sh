#!/bin/bash
#Please stage data beforehand using datastager.sh
nextflow pull nf-core/rnaseq #to get newest versions of workflow releases loaded on cfc

RELEASE=$1

##Run No1 of the integration test samples
nextflow run nf-core/rnaseq -profile cfc -r ${RELEASE} --genome 'GRCm38' --reads 'rnaseq/mouse/*.fastq.gz' --singleEnd

##Run No2 of the integration test samples
nextflow run nf-core/rnaseq -profile cfc -r ${RELEASE} --genome 'GRCh37' --reads 'rnaseq/human/*R{1,2}*fastq.gz'