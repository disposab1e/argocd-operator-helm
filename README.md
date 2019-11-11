![OpenShift Container Platform](https://img.shields.io/badge/ocp-4.2-red.svg)
![Kubernetes](https://img.shields.io/badge/kubernetes-1.14-blue.svg)
![Argo CD](https://img.shields.io/badge/argocd-1.2.4-green.svg)
![License](https://img.shields.io/badge/license-Apache%202.0-blue.svg)
![Documentation Status](https://readthedocs.org/projects/argocd-operator-helm/badge/?version=latest)
![Latest Release](https://img.shields.io/badge/latest%20release-0.0.1-yellow.svg)


# Argo CD Operator (Helm)

This **community maintained** Argo CD Operator is based on the **community maintained** [Argo CD Helm Chart](https://github.com/argoproj/argo-helm/tree/master/charts/argo-cd) and currently installs the non-HA version of Argo CD in OpenShift Container Platform and Kubernetes.

## About Argo CD

[Argo CD](https://argoproj.github.io) is a declarative, GitOps continuous delivery tool for Kubernetes.


## Operator Features

* Basic Installation to a single Namespace
* Configure through Custom Resource


## Get started

[Quickstart](https://argocd-operator-helm.readthedocs.io/en/latest/quickstart.html) or try our comprehensive guides to install this opertor and [Argo CD](https://argoproj.github.io) in [ContainerReady Containers](https://argocd-operator-helm.readthedocs.io/en/latest/openshift/crc.html), [Google Cloud Platform](https://argocd-operator-helm.readthedocs.io/en/latest/kubernetes/gcp.html) or [Minikube](https://argocd-operator-helm.readthedocs.io/en/latest/kubernetes/minikube.html).


## Why an Operator and not just a Helm Chart?

* No need to install Helm or Tiller
* Kubernetes native application
* Integrated in Operator Lifecycle Manager and Marketplace
* User friendly OpenShift Web Console

**Make it easier for the Kubernetes and OpenShift Community to install and use Argo CD!**

## License

Argo CD Operator (Helm) is released under the [Apache 2.0](http://www.apache.org/licenses/LICENSE-2.0.html) license. 
See the [LICENSE](https://github.com/disposab1e/argocd-operator-helm/blob/master/LICENSE) file for details.
