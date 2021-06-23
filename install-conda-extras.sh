#!/bin/env bash
set -e

# Start the env and add channels
source $MINICONDA_PATH/bin/activate
conda install -y astropy=4.1 fitsio
conda install -y -c conda-forge esutil
