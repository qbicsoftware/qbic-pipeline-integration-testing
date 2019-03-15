# qbic-pipeline-integration-testing
A repository to hold the code used for pipeline integration testing for nf-core/rnaseq and scilifelab/Sarek at QBIC.


## Current concept of integration tests

0.) Creation of workspaces automatically that are deleted in the end.
1.) Staging of data using qPostman to our internal storage at CFC.
2.) Running the analysis and reporting back results (e.g. multiqc table, e.g. count tables, simple VCF files)
3.) Sending the reports via Fex? 
4.) Tearing down workspace(s).
5.) Success