***********************
Argo CD Operator (Helm)
***********************

.. image:: https://img.shields.io/badge/argocd-1.5.2-green.svg
   :target: https://github.com/argoproj/argo-cd/releases/tag/v1.5.2
   :alt: Argo CD
.. image:: https://img.shields.io/badge/ocp-3.11-red.svg
   :target: https://www.openshift.com/products/container-platform
   :alt: OpenShift Container Platform
.. image:: https://img.shields.io/badge/ocp-≥%204.2-red.svg
   :target: https://www.openshift.com/products/container-platform
   :alt: OpenShift Container Platform
.. image:: https://img.shields.io/badge/kubernetes-≥%201.11-blue.svg
   :target: https://kubernetes.io/
   :alt: Kubernetes
.. image:: https://readthedocs.org/projects/argocd-operator-helm/badge/?version=latest
   :target: https://argocd-operator-helm.readthedocs.io/en/latest/?badge=latest
   :alt: Documentation Status
.. image:: https://circleci.com/gh/disposab1e/argocd-operator-helm/tree/master.svg?style=svg
   :target: https://circleci.com/gh/disposab1e/argocd-operator-helm/tree/master
   :alt: Build with CircleCI
.. image:: https://img.shields.io/badge/latest%20release-0.0.5-yellow.svg
   :target: https://github.com/disposab1e/argocd-operator-helm/releases/tag/0.0.5
   :alt: Latest Release

The `Argo CD Operator (Helm)`_ is based on the `Argo CD Helm Chart`_ 
and currently installs the non-HA version of Argo CD in 
`OpenShift Container Platform`_ and `Kubernetes`_.

.. _OpenShift Container Platform: https://www.openshift.com/
.. _Kubernetes: https://kubernetes.io/



.. Note::
    **Argo CD Operator (Helm)** and the **Argo CD Helm Chart** are **community maintained** projects!


About Argo CD
==============

`Argo CD`_ is a declarative, GitOps continuous delivery tool for Kubernetes.

Tested Platforms
================

- OpenShift Container Platform 3.11
- Origin Community Distribution 3.11
- Minishift v1.34.2
- OpenShift Container Platform ≥ 4.2
- ContainerReady Containers 1.9.0-4.3.10
- Google Cloud Platform (Kubernetes ≥ 1.14)
- Minikube v1.9.2 (Kubernetes ≥ 1.14)

These are the platforms we currently test the operator with. Other platforms should work fine too!


Operator Features
=================

- Easy configuration and installation

.. Note:: Shares all `configuration values`_ from the Argo CD Helm Chart.

.. Attention::
   Supports OpenShift OAuth integration on all supported OpenShift platforms.


Get started
===========

Quickstart with `OperatorHub's`_ or try our comprehensive guides to install this 
operator and `Argo CD`_ in `OpenShift 3`_, `OpenShift 4`_, `Minishift`_, `ContainerReady Containers`_, `Google Cloud Platform`_ or `Minikube`_.

.. _Argo CD Helm Chart: https://github.com/argoproj/argo-helm/tree/master/charts/argo-cd
.. _Argo CD Operator (Helm): https://github.com/disposab1e/argocd-operator-helm
.. _Argo CD: https://argoproj.github.io/argo-cd/
.. _OperatorHub's: operatorhub.html
.. _OpenShift 3: ocp/ocp3.html
.. _OpenShift 4: ocp/ocp4.html
.. _Minishift: ocp/ocp3.html
.. _ContainerReady Containers: ocp/ocp4.html
.. _Google Cloud Platform: k8s/gcp.html
.. _Minikube: k8s/minikube.html

Why an Operator and not just a Helm Chart?
==========================================
- No need to install Helm
- Kubernetes native application
- Integrated in Operator Lifecycle Manager and Operatorhub's
- User friendly Web Console

**Make it easier for the Kubernetes and OpenShift Community to install and use Argo CD!**

License
=======
Argo CD Operator (Helm) is released under the `Apache 2.0`_ license. 
See the `LICENSE`_ file for details.

.. _Apache 2.0: http://www.apache.org/licenses/LICENSE-2.0.html
.. _LICENSE: https://github.com/disposab1e/argocd-operator-helm/blob/master/LICENSE

.. include:: _static/urls.txt
