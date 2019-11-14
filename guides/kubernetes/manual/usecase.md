# Kubernetes

## UseCase: Local without Catalog Source from quay.io

* Create Namespace 'argocd'
* Create ServiceAccount in namespace 'argocd'
* Create ClusterRole
* Create ClusterRoleBinding
* Create Custom Resource Definiton
* Create operator Deployment in namespace 'argocd'


## Notice

* cluster: ClusterRole, ClusterRoleBinding, CustomResourceDefinition
* argocd: SericeAccoount, Operator, Argo CD


## Install

```bash
kubectl apply -f deploy/kubernetes/local/namespace.yaml
kubectl apply -f deploy/kubernetes/local/service_account.yaml
kubectl apply -f deploy/kubernetes/local/role.yaml
kubectl apply -f deploy/kubernetes/local/role_binding.yaml
kubectl apply -f deploy/kubernetes/local/crd.yaml
kubectl apply -f deploy/kubernetes/local/deployment.yaml
```

## Uninstall

```bash
kubectl delete -f deploy/kubernetes/local/deployment.yaml
kubectl delete -f deploy/kubernetes/local/crd.yaml
kubectl delete -f deploy/kubernetes/local/role_binding.yaml
kubectl delete -f deploy/kubernetes/local/role.yaml
kubectl delete -f deploy/kubernetes/local/service_account.yaml
kubectl delete -f deploy/kubernetes/local/namespace.yaml
```
