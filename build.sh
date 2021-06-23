#!/bin/env bash
set -e

export MINICONDA_PATH=/opt/miniconda3
export TAG=empty
./install-conda-base.sh
./install-conda-extras.sh
