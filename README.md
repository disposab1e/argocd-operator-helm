[![Argo CD](https://img.shields.io/badge/argocd-1.5.2-green.svg)](https://github.com/argoproj/argo-cd/releases/tag/v1.4.2)
[![Latest Release](https://img.shields.io/badge/latest%20release-0.0.5-yellow.svg)](https://github.com/disposab1e/argocd-operator-helm/releases/tag/0.0.5)
[![Documentation Status](https://readthedocs.org/projects/argocd-operator-helm/badge/?version=latest)](https://argocd-operator-helm.readthedocs.io/en/latest/?badge=latest)
[![Travis-CI](https://travis-ci.org/disposab1e/argocd-operator-helm.svg?branch=release-0.0.5)](https://travis-ci.org/disposab1e/argocd-operator-helm)
[![Github Workflows](https://github.com/disposab1e/argocd-operator-helm/workflows/continuous-integration/badge.svg?branch=release-0.0.5)](https://github.com/disposab1e/argocd-operator-helm/actions?query=workflow%3Acontinuous-integration)

# Argo CD Operator (Helm)

This **community maintained** Argo CD Operator is based on the **community maintained** [Argo CD Helm Chart](https://github.com/argoproj/argo-helm/tree/master/charts/argo-cd) and currently installs the non-HA version of Argo CD in OpenShift Container Platform and Kubernetes.

## About Argo CD

[Argo CD](https://argoproj.github.io/argo-cd/) is a declarative, GitOps continuous delivery tool for Kubernetes.

## Tested Platforms

* OpenShift Container Platform 3.11
* Origin Community Distribution 3.11
* Minishift v1.34.2
* OpenShift Container Platform ≥ 4.2
* ContainerReady Containers 1.9.0-4.3.10
* Google Cloud Platform (Kubernetes ≥ 1.14)
* Minikube v1.9.2 (Kubernetes ≥ 1.14)

These are the platforms we currently test the operator with. Other platforms should work fine too!

## Operator Features

* Easy configuration and installation
* OpenShift OAuth integration on all supported OpenShift platforms

Shares all [configuration values](https://github.com/disposab1e/argocd-operator-helm/blob/release-0.0.4/helm-charts/argo-cd/README.md) from the Argo CD Helm Chart.


## Get started

Quickstart with [OperatorHub's](https://argocd-operator-helm.readthedocs.io/en/latest/operatorhub.html) or try our comprehensive guides to install this opertor and [Argo CD](https://argoproj.github.io/argo-cd/) in [OpenShift 3](https://argocd-operator-helm.readthedocs.io/en/latest/ocp/ocp3.html), [OpenShift 4](https://argocd-operator-helm.readthedocs.io/en/latest/ocp/ocp4.html), [Minishift](https://argocd-operator-helm.readthedocs.io/en/latest/ocp/ocp3.html), [ContainerReady Containers](https://argocd-operator-helm.readthedocs.io/en/latest/ocp/ocp4.html), [Google Cloud Platform](https://argocd-operator-helm.readthedocs.io/en/latest/k8s/gcp.html) or [Minikube](https://argocd-operator-helm.readthedocs.io/en/latest/k8s/minikube.html).

## Why an Operator and not just a Helm Chart?

* No need to install Helm
* Kubernetes native application
* Integrated in Operator Lifecycle Manager and Operatorhub's
* User friendly Web Console

**Make it easier for the Kubernetes and OpenShift Community to install and use Argo CD!**

## License

Argo CD Operator (Helm) is released under the [Apache 2.0](http://www.apache.org/licenses/LICENSE-2.0.html) license. 
See the [LICENSE](https://github.com/disposab1e/argocd-operator-helm/blob/master/LICENSE) file for details.
