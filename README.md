[![Argo CD](https://img.shields.io/badge/argocd-1.4.0-green.svg)](https://github.com/argoproj/argo-cd/releases/tag/v1.4.0)
[![OpenShift Container Platform](https://img.shields.io/badge/ocp-3.11-red.svg)](https://www.openshift.com/products/container-platform)
[![OpenShift Container Platform](https://img.shields.io/badge/ocp-4.2-red.svg)](https://www.openshift.com/products/container-platform)
[![Kubernetes](https://img.shields.io/badge/kubernetes-1.14-blue.svg)](https://kubernetes.io/)
[![License](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0.html)
[![Documentation Status](https://readthedocs.org/projects/argocd-operator-helm/badge/?version=latest)](https://argocd-operator-helm.readthedocs.io/en/latest/?badge=latest)
[![CircleCI](https://circleci.com/gh/disposab1e/argocd-operator-helm/tree/master.svg?style=svg)](https://circleci.com/gh/disposab1e/argocd-operator-helm/tree/master)
[![Latest Release](https://img.shields.io/badge/latest%20release-0.0.3-yellow.svg)](https://github.com/disposab1e/argocd-operator-helm/releases/tag/0.0.3)


# Argo CD Operator (Helm)

This **community maintained** Argo CD Operator is based on the **community maintained** [Argo CD Helm 3 Chart](https://github.com/argoproj/argo-helm/tree/master/charts/argo-cd) and currently installs the non-HA version of Argo CD in OpenShift Container Platform and Kubernetes.

## About Argo CD

[Argo CD](https://argoproj.github.io/argo-cd/) is a declarative, GitOps continuous delivery tool for Kubernetes.

## Supported Platforms

* OpenShift Container Platform 3.11
* Origin Community Distribution 3.11
* Minishift
* OpenShift Container Platform 4.2
* ContainerReady Containers
* Kubernetes 1.14/1.16
* Google Cloud Platform (Kubernetes 1.14/1.16)
* Minikube (Kubernetes 1.16)

This operator supports OpenShift OAuth integration on all supported OpenShift platforms. These are the platforms we currently test the operator with. Other platforms should work fine too!

## Operator Features

* Basic Installation to a single Namespace

## Get started

[Quickstart](https://argocd-operator-helm.readthedocs.io/en/latest/quickstart.html) or try our comprehensive guides to install this opertor and [Argo CD](https://argoproj.github.io/argo-cd/) in [OpenShift 3](https://argocd-operator-helm.readthedocs.io/en/latest/openshift/ocp3.html), [OpenShift 4](https://argocd-operator-helm.readthedocs.io/en/latest/openshift/ocp4.html), [Minishift](https://argocd-operator-helm.readthedocs.io/en/latest/openshift/ocp3.html), [ContainerReady Containers](https://argocd-operator-helm.readthedocs.io/en/latest/openshift/ocp4.html), [Google Cloud Platform](https://argocd-operator-helm.readthedocs.io/en/latest/kubernetes/gcp.html) or [Minikube](https://argocd-operator-helm.readthedocs.io/en/latest/kubernetes/minikube.html).

## Why an Operator and not just a Helm Chart?

* No need to install Helm
* Kubernetes native application
* Integrated in Operator Lifecycle Manager and Marketplace
* User friendly OpenShift Web Console

**Make it easier for the Kubernetes and OpenShift Community to install and use Argo CD!**

## License

Argo CD Operator (Helm) is released under the [Apache 2.0](http://www.apache.org/licenses/LICENSE-2.0.html) license. 
See the [LICENSE](https://github.com/disposab1e/argocd-operator-helm/blob/master/LICENSE) file for details.
