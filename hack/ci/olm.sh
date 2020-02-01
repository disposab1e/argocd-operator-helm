#!/bin/bash
set -eux -o pipefail

kubectl apply -f \
https://github.com/operator-framework/operator-lifecycle-manager/releases/download/0.13.0/crds.yaml

kubectl apply -f \
https://github.com/operator-framework/operator-lifecycle-manager/releases/download/0.13.0/olm.yaml

kubectl rollout status -w deployment/olm-operator -n olm
kubectl rollout status -w deployment/catalog-operator -n olm
kubectl rollout status -w deployment/packageserver -n olm

