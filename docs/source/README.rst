***********************
Argo CD Operator (Helm)
***********************

.. image:: https://img.shields.io/badge/argocd-1.4-green.svg
   :target: https://github.com/argoproj/argo-cd/releases/
   :alt: Argo CD
.. image:: https://img.shields.io/badge/ocp-3.11-red.svg
   :target: https://www.openshift.com/products/container-platform
   :alt: OpenShift Container Platform
.. image:: https://img.shields.io/badge/ocp-4.2-red.svg
   :target: https://www.openshift.com/products/container-platform
   :alt: OpenShift Container Platform
.. image:: https://img.shields.io/badge/kubernetes-1.14-blue.svg
   :target: https://kubernetes.io/
   :alt: Kubernetes
.. image:: https://readthedocs.org/projects/argocd-operator-helm/badge/?version=0.0.3
   :target: https://argocd-operator-helm.readthedocs.io/en/0.0.3/?badge=0.0.3
   :alt: Documentation Status
.. image:: https://circleci.com/gh/disposab1e/argocd-operator-helm/tree/release-0.0.3.svg?style=svg
   :target: https://circleci.com/gh/disposab1e/argocd-operator-helm/tree/release-0.0.3
   :alt: Build with CircleCI
.. image:: https://img.shields.io/badge/latest%20release-0.0.3-yellow.svg
   :target: https://github.com/disposab1e/argocd-operator-helm/releases/tag/0.0.3
   :alt: Latest Release

The `Argo CD Operator (Helm)`_ is based on the `Argo CD Helm 3 Chart`_ 
and currently installs the non-HA version of Argo CD in 
`OpenShift Container Platform`_ and `Kubernetes`_.

.. _OpenShift Container Platform: https://www.openshift.com/
.. _Kubernetes: https://kubernetes.io/



.. Note::
    **Argo CD Operator (Helm)** and the **Argo CD Helm 3 Chart** are **community maintained** projects!


About Argo CD
==============

`Argo CD`_ is a declarative, GitOps continuous delivery tool for Kubernetes.

Supported Platforms
===================

- OpenShift Container Platform 3.11
- Origin Community Distribution 3.11
- Minishift
- OpenShift Container Platform 4.2
- ContainerReady Containers
- Kubernetes 1.14/1.16
- Google Cloud Platform (Kubernetes 1.14/1.16)
- Minikube (Kubernetes 1.16)


.. Attention::
   This operator supports OpenShift OAuth integration on all supported OpenShift platforms.

.. Note::
    These are the platforms we currently test the operator with. Other platforms should work fine too!


Operator Features
=================

- Basic Installation

.. Note:: This operator shares all `configuration values`_ from the Argo CD Helm 3 Chart.

.. _configuration values: https://github.com/disposab1e/argocd-operator-helm/blob/release-0.0.3/helm-charts/argo-cd/README.md


Get started
===========

`Quickstart`_ or try our comprehensive guides to install this 
opertor and `Argo CD`_ in `OpenShift 3`_, `OpenShift 4`_, `Minishift`_, `ContainerReady Containers`_, `Google Cloud Platform`_ or `Minikube`_.

.. _Argo CD Helm 3 Chart: https://github.com/argoproj/argo-helm/tree/master/charts/argo-cd
.. _Argo CD Operator (Helm): https://github.com/disposab1e/argocd-operator-helm
.. _Argo CD: https://argoproj.github.io/argo-cd/
.. _Quickstart: quickstart.html
.. _OpenShift 3: openshift/ocp3.html
.. _OpenShift 4: openshift/ocp4.html
.. _Minishift: openshift/ocp3.html
.. _ContainerReady Containers: openshift/ocp4.html
.. _Google Cloud Platform: kubernetes/gcp.html
.. _Minikube: kubernetes/minikube.html

Why an Operator and not just a Helm Chart?
==========================================
- No need to install Helm
- Kubernetes native application
- Integrated in Operator Lifecycle Manager and Marketplace
- User friendly OpenShift Web Console

**Make it easier for the Kubernetes and OpenShift Community to install and use Argo CD!**

License
=======
Argo CD Operator (Helm) is released under the `Apache 2.0`_ license. 
See the `LICENSE`_ file for details.

.. _Apache 2.0: http://www.apache.org/licenses/LICENSE-2.0.html
.. _LICENSE: https://github.com/disposab1e/argocd-operator-helm/blob/release-0.0.3/LICENSE

