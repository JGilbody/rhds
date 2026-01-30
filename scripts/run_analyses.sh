#!/bin/bash

set -e

set -a
source config.env # nolint
set +a

Rscript $scripts/1_extract_data.R "$datadir" "$resultsdir"
Rscript $scripts/2_clean_clinical_data.R "$datadir" "$resultsdir"
Rscript $scripts/3_predict-proteins.R "$datadir" "$resultsdir"
Rscript $scripts/4_analysis.R "$datadir" "$resultsdir"
