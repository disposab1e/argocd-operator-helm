#!/bin/bash

HACK_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source ${HACK_DIR}/env.sh

cd ${HACK_DIR}/../docs && make html && open ../docs/build/html/index.html
