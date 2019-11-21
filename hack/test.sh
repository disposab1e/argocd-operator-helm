#!/bin/bash
set -eux -o pipefail

kubectl apply -f guides/kubernetes/olm/namespace.yaml

kubectl apply -f guides/kubernetes/olm/catalog-source.yaml
kubectl wait pod -n olm -l olm.catalogSource=argocd-catalog --for=condition=Ready --timeout=30s

kubectl apply -f guides/kubernetes/olm/operator-group.yaml
kubectl apply -f guides/kubernetes/olm/subscription.yaml

sleep 10

kubectl wait pod -n argocd -l name=argocd-operator-helm --for=condition=Ready --timeout=30s
kubectl rollout status -w deployment/argocd-operator-helm -n argocd


kubectl delete -f guides/kubernetes/olm/subscription.yaml
kubectl delete csv argocd-operator-helm.v0.0.2 -n argocd
kubectl delete crd argocds.argoproj.io
kubectl delete -f guides/kubernetes/olm/catalog-source.yaml
kubectl delete -f guides/kubernetes/olm/operator-group.yaml
kubectl delete -f guides/kubernetes/olm/namespace.yaml


kubectl apply -f guides/kubernetes/manual/namespace.yaml
kubectl apply -f guides/kubernetes/manual/service_account.yaml
kubectl apply -f guides/kubernetes/manual/role.yaml
kubectl apply -f guides/kubernetes/manual/role_binding.yaml
kubectl apply -f guides/kubernetes/manual/crd.yaml
kubectl apply -f guides/kubernetes/manual/deployment.yaml

kubectl wait pod -n argocd -l name=argocd-operator-helm --for=condition=Ready --timeout=30s
kubectl rollout status -w deployment/argocd-operator-helm -n argocd


kubectl delete -f guides/kubernetes/manual/deployment.yaml
kubectl delete -f guides/kubernetes/manual/crd.yaml
kubectl delete -f guides/kubernetes/manual/role_binding.yaml
kubectl delete -f guides/kubernetes/manual/role.yaml
kubectl delete -f guides/kubernetes/manual/service_account.yaml
kubectl delete -f guides/kubernetes/manual/namespace.yaml

