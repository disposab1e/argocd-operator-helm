***********************
Argo CD Operator (Helm)
***********************

.. image:: https://img.shields.io/badge/ocp-4.2-red.svg
   :target: https://www.openshift.com/products/container-platform
   :alt: OpenShift Container Platform
.. image:: https://img.shields.io/badge/kubernetes-1.14-blue.svg
   :target: https://kubernetes.io/
   :alt: Kubernetes
.. image:: https://img.shields.io/badge/argocd-1.2.4-green.svg
   :target: https://github.com/argoproj/argo-cd/releases/tag/v1.2.4
   :alt: Argo CD
.. image:: https://img.shields.io/badge/license-Apache%202.0-blue.svg
   :target: http://www.apache.org/licenses/LICENSE-2.0.html
   :alt: License
.. image:: https://readthedocs.org/projects/argocd-operator-helm/badge/?version=latest
   :target: https://argocd-operator-helm.readthedocs.io/en/latest/?badge=latest
   :alt: Documentation Status
.. image:: https://img.shields.io/badge/latest%20release-0.0.1-yellow.svg
   :target: https://github.com/disposab1e/argocd-operator-helm
   :alt: Latest Release


The `Argo CD Operator (Helm)`_ is based on the stable `Argo CD Helm Chart`_ 
and currently installs the non-HA version of Argo CD in 
`OpenShift Container Platform`_ and `Kubernetes`_.

.. _OpenShift Container Platform: https://www.openshift.com/
.. _Kubernetes: https://kubernetes.io/



.. Note::
    **Argo CD Operator (Helm)** and the **Argo CD Helm Chart** are **community maintained** projects!


About Argo CD
==============

`Argo CD`_ is a declarative, GitOps continuous delivery tool for Kubernetes.

Operator Features
=================

- Basic Installation to a single Namespace
- Configure through Custom Resource

Get started
===========

`Quickstart`_ or try our comprehensive guides to install this 
opertor and `Argo CD`_ in `ContainerReady Containers`_, `Google Cloud Platform`_ or `Minikube`_.

.. _Argo CD Helm Chart: https://github.com/argoproj/argo-helm/tree/master/charts/argo-cd
.. _Argo CD Operator (Helm): https://github.com/disposab1e/argocd-operator-helm
.. _Argo CD: https://argoproj.github.io/
.. _Quickstart: quickstart.html
.. _ContainerReady Containers: openshift/crc.html
.. _Google Cloud Platform: kubernetes/gcp.html
.. _Minikube: kubernetes/minikube.html

Why an Operator and not just a Helm Chart?
==========================================
- No need to install Helm or Tiller
- Kubernetes native application
- Integrated in Operator Lifecycle Manager and Marketplace
- User friendly OpenShift Web Console

**Make it easier for the Kubernetes and OpenShift Community to install and use Argo CD!**

License
=======
Argo CD Operator (Helm) is released under the `Apache 2.0`_ license. 
See the `LICENSE`_ file for details.

.. _Apache 2.0: http://www.apache.org/licenses/LICENSE-2.0.html
.. _LICENSE: https://github.com/disposab1e/argocd-operator-helm/blob/release-0.0.1/LICENSE

