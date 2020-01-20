#!/bin/bash

HACK_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source ${HACK_DIR}/env.sh

helm template --values ${HACK_DIR}/../helm-charts/argo-cd/values.yaml  ${HACK_DIR}/../helm-charts/argo-cd/

helm template --values ${HACK_DIR}/../guides/ocp3/examples/cr-openshift-oauth.yaml  ${HACK_DIR}/../helm-charts/argo-cd 
