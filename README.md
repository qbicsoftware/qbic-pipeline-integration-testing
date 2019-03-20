# qbic-pipeline-integration-testing
A repository to hold the code used for pipeline integration testing for nf-core/rnaseq and scilifelab/Sarek at QBIC.

## Current concept of integration tests

0.) Creation of workspaces automatically that are deleted in the end.

1.) Staging of data using qPostman to our internal storage at CFC.

2.) Running the analysis and reporting back results (e.g. multiqc table, e.g. count tables, simple VCF files)

3.) Sending the reports via Fex?

4.) Tearing down workspace(s).

# Dataset description
## RNAseq Testcases
### RNAseq Dataset I
- Project code in qPortal: QMSHS
- 1 Patient, QMSHS067BV tumor, QMSHS069BD normal
- Paired End Data

### RNAseq Dataset II
- Project code in qPortal: QPB05
- 3 Mouse Samples, QPB05013A4 / QPB05015AK / QPB05014AC
- Single End Data

## Sarek Testcases
### Whole Exome Sequencing Project
- Project code in qPortal: QMSHS
- 1 Patient, QMSHS032B4 for tumor, QMSHS034BK for normal)
- Paired End Data

### Whole Genome Sequencing Project
- Project code in qPortal: QM
- 1 Patient, QXXWG265AL
- Paired End Data