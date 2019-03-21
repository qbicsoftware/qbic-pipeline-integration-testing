#!/bin/bash
#Please stage data beforehand using datastager.sh
RELEASE=$1

##Run No1 of the integration test samples
nextflow run nf-core/rnaseq -profile cfc -r ${RELEASE} --genome 'GRCh37' --reads '' 

##Run No2 of the integration test samples