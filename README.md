[![Argo CD](https://img.shields.io/badge/argocd-1.4.2-green.svg)](https://github.com/argoproj/argo-cd/releases/tag/v1.4.2)
[![OpenShift Container Platform](https://img.shields.io/badge/ocp-3.11-red.svg)](https://www.openshift.com/products/container-platform)
[![OpenShift Container Platform](https://img.shields.io/badge/ocp-4.2-red.svg)](https://www.openshift.com/products/container-platform)
[![Kubernetes](https://img.shields.io/badge/kubernetes-1.14-blue.svg)](https://kubernetes.io/)
[![License](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0.html)
[![Documentation Status](https://readthedocs.org/projects/argocd-operator-helm/badge/?version=latest)](https://argocd-operator-helm.readthedocs.io/en/latest/?badge=latest)
[![CircleCI](https://circleci.com/gh/disposab1e/argocd-operator-helm/tree/circle-ci.svg?style=svg)](https://circleci.com/gh/disposab1e/argocd-operator-helm/tree/circle-ci)
[![Build passing](https://travis-ci.org/disposab1e/argocd-operator-helm.svg?branch=travis-ci)](https://travis-ci.org/disposab1e/argocd-operator-helm)
[![Latest Release](https://img.shields.io/badge/latest%20release-0.0.4-yellow.svg)](https://github.com/disposab1e/argocd-operator-helm/releases/tag/0.0.4)

# Argo CD Operator (Helm)

This **community maintained** Argo CD Operator is based on the **community maintained** [Argo CD Helm Chart](https://github.com/argoproj/argo-helm/tree/master/charts/argo-cd) and currently installs the non-HA version of Argo CD in OpenShift Container Platform and Kubernetes.

## About Argo CD

[Argo CD](https://argoproj.github.io/argo-cd/) is a declarative, GitOps continuous delivery tool for Kubernetes.

## Tested Platforms

* OpenShift Container Platform 3.11
* Origin Community Distribution 3.11
* Minishift v1.34.2
* OpenShift Container Platform 4.2/4.3
* ContainerReady Containers 1.4.0-4.2.13
* Google Cloud Platform (Kubernetes >1.14)
* Minikube v1.6.2 (Kubernetes >1.14)
* These are the platforms we currently test the operator with. Other platforms should work fine too!

This operator supports OpenShift OAuth integration on all supported OpenShift platforms.

## Operator Features

* Easy configuration and installation
* OpenShift OAuth integration

This operator shares all [configuration values](https://github.com/disposab1e/argocd-operator-helm/blob/release-0.0.4/helm-charts/argo-cd/README.md) from the Argo CD Helm Chart.

## Get started

[Quickstart](https://argocd-operator-helm.readthedocs.io/en/latest/quickstarts.html) or try our comprehensive guides to install this opertor and [Argo CD](https://argoproj.github.io/argo-cd/) in [OpenShift 3](https://argocd-operator-helm.readthedocs.io/en/latest/ocp/ocp3.html), [OpenShift 4](https://argocd-operator-helm.readthedocs.io/en/latest/ocp/ocp4.html), [Minishift](https://argocd-operator-helm.readthedocs.io/en/latest/ocp/ocp3.html), [ContainerReady Containers](https://argocd-operator-helm.readthedocs.io/en/latest/ocp/ocp4.html), [Google Cloud Platform](https://argocd-operator-helm.readthedocs.io/en/latest/k8s/gcp.html) or [Minikube](https://argocd-operator-helm.readthedocs.io/en/latest/k8s/minikube.html).

## Why an Operator and not just a Helm Chart?

* No need to install Helm
* Kubernetes native application
* Integrated in Operator Lifecycle Manager and Operatorhub's
* User friendly Web Console

**Make it easier for the Kubernetes and OpenShift Community to install and use Argo CD!**

## License

Argo CD Operator (Helm) is released under the [Apache 2.0](http://www.apache.org/licenses/LICENSE-2.0.html) license. 
See the [LICENSE](https://github.com/disposab1e/argocd-operator-helm/blob/master/LICENSE) file for details.
