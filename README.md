[![Argo CD](https://img.shields.io/badge/argocd-1.6.1-green.svg)](https://github.com/argoproj/argo-cd/releases/tag/v1.6.1)
[![Latest Release](https://img.shields.io/badge/latest%20release-0.0.7-yellow.svg)](https://github.com/disposab1e/argocd-operator-helm/releases/tag/0.0.7)
[![Documentation Status](https://readthedocs.org/projects/argocd-operator-helm/badge/?version=latest)](https://argocd-operator-helm.readthedocs.io/en/latest/?badge=latest)
[![Travis-CI](https://travis-ci.org/disposab1e/argocd-operator-helm.svg?branch=release-0.0.7)](https://travis-ci.org/disposab1e/argocd-operator-helm)
[![Github Workflows](https://github.com/disposab1e/argocd-operator-helm/workflows/continuous-integration/badge.svg?branch=release-0.0.7)](https://github.com/disposab1e/argocd-operator-helm/actions?query=workflow%3Acontinuous-integration)

# Argo CD Operator (Helm)

This **community maintained** Argo CD Operator is based on the **community maintained** [Argo CD Helm Chart](https://github.com/argoproj/argo-helm/tree/master/charts/argo-cd) and currently installs the non-HA version of Argo CD in OpenShift Container Platform and Kubernetes.

## About Argo CD

[Argo CD](https://argoproj.github.io/argo-cd/) is a declarative, GitOps continuous delivery tool for Kubernetes.

## Operator Features

* Easy configuration and installation
* OpenShift OAuth integration on all supported OpenShift platforms

Shares all [configuration values](https://github.com/disposab1e/argocd-operator-helm/blob/release-0.0.7/helm-charts/argo-cd/README.md) from the Argo CD Helm Chart.

## Get started

Quickstart with [OperatorHub's](https://argocd-operator-helm.readthedocs.io/en/latest/operatorhub.html) or try our comprehensive guides to install this opertor and [Argo CD](https://argoproj.github.io/argo-cd/) in [OpenShift 3](https://argocd-operator-helm.readthedocs.io/en/latest/ocp/ocp3.html), [OpenShift 4](https://argocd-operator-helm.readthedocs.io/en/latest/ocp/ocp4.html), [Minishift](https://argocd-operator-helm.readthedocs.io/en/latest/ocp/ocp3.html), [ContainerReady Containers](https://argocd-operator-helm.readthedocs.io/en/latest/ocp/ocp4.html), [Google Cloud Platform](https://argocd-operator-helm.readthedocs.io/en/latest/k8s/gcp.html) or [Minikube](https://argocd-operator-helm.readthedocs.io/en/latest/k8s/minikube.html).

## Tested Platforms

* OpenShift Container Platform 3.11
* Origin Community Distribution 3.11
* Minishift v1.34.2
* OpenShift Container Platform ≥ 4.2
* ContainerReady Containers 1.10.0-4.4.3
* Google Cloud Platform (Kubernetes ≥ 1.14)
* Minikube v1.10.1 (Kubernetes ≥ 1.14)

These are the platforms we currently test the operator with. Other platforms should work fine too!

## CI/CD Environment

We use [Travis CI](https://travis-ci.org/github/disposab1e/argocd-operator-helm) and [Github Workflows](https://github.com/disposab1e/argocd-operator-helm/actions?query=workflow%3Acontinuous-integration) for continuous integration and deployment. Following table shows the tested combinations after pushing to an release or master branch. To verify some pull requests we only use Github Workflows.

| Service | Kubernetes | OpenShift | OLM | Minikube | Minishift | Ubuntu |
| --- | :-: | :-: | :-: | :-: | :-: | :-: |
| Travis CI | 1.11.0 | 3.11.0 | 0.13.0 | | v1.3.2 |  18.04 |
| | 1.11.0 | 3.11.0 | 0.14.1 | | v1.3.2 | 18.04 |
|  | 1.14.0 | | 0.13.0 | v1.9.2 | | 18.04 |
| | 1.16.3 | | 0.14.1 | v1.9.2 | | 18.04 |
| | 1.17.0 | | 0.14.1 | v1.9.2 | | 18.04 |
| | 1.18.0 | | 0.14.1 | v1.9.2 | | 18.04 |
| Github Workflows | 1.14.0 | | 0.13.0 | v1.10.1 | | 18.04 |
| | 1.16.3 | | 0.14.1 | v1.10.1 | | 18.04 |
| | 1.17.0 | | 0.14.1 | v1.10.1 | | 18.04 |
| | 1.18.0 | | 0.14.1 | v1.10.1 | | 18.04 |

Both services have less than 8GB memory available in their Ubuntu VM's, so it's not possible to use Container Ready Containers. Nevertheless we test the operator with the latest version of Container Ready Containers on Mac OS Catalina in a fully automated process.

We love CI/CD so we additionally test with [CircleCI](https://circleci.com/gh/disposab1e/argocd-operator-helm/tree/circle-ci). Because build time is limited we only test with CircleCI Ubuntu 16.04 Vm's when we merge a release branch to the circle-ci branch.

All of these services are pretty cool! Thx for supporting the open source community!

## License

Argo CD Operator (Helm) is released under the [Apache 2.0](http://www.apache.org/licenses/LICENSE-2.0.html) license. 
See the [LICENSE](https://github.com/disposab1e/argocd-operator-helm/blob/master/LICENSE) file for details.
