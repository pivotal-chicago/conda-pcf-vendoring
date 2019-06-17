#!/usr/bin/env bash
set -e

docker run -v $(pwd):/myapp -w /myapp continuumio/miniconda ./vendor-dependencies.sh
cf push
