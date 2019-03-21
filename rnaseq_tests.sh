#!/bin/bash
#Please stage data beforehand using datastager.sh
RELEASE=$1

##Run No1 of the integration test samples
nextflow run nf-core/rnaseq -profile cfc -r ${RELEASE} --genome 'GRCm38' --reads 'rnaseq/mouse/*.fastq.gz' --singleEnd

##Run No2 of the integration test samples
nextflow run nf-core/rnaseq -profile cfc -r ${RELEASE} --genome 'GRCh37' --reads 'rnaseq/human/*R{1,2}*fastq.gz'