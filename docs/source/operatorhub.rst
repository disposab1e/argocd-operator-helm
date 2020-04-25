***********
OperatorHub
***********

.. include:: _static/common_clusteradmin.txt

Prerequisites
=============

.. image:: https://img.shields.io/badge/okd-3.11-red.svg
   :target: https://github.com/openshift/origin
   :alt: Origin Community Distribution of Kubernetes
.. image:: https://img.shields.io/badge/ocp-3.11-red.svg
   :target: https://www.openshift.com/products/container-platform
   :alt: OpenShift Container Platform
.. image:: https://img.shields.io/badge/ocp-≥%204.2-red.svg
   :target: https://www.openshift.com/products/container-platform
   :alt: OpenShift Container Platform
.. image:: https://img.shields.io/badge/kubernetes-≥%201.11-blue.svg
   :target: https://kubernetes.io/
   :alt: Kubernetes
.. image:: https://img.shields.io/badge/olm-≥%200.13.0-blue.svg
   :target: https://github.com/operator-framework/operator-lifecycle-manager
   :alt: Operator Lifecycle Manager


You have an up and running `OpenShift Container Platform`_ or 
`Kubernetes`_ cluster with `Operator Lifecycle Manager`_ installed.

.. _Operator Lifecycle Manager: https://github.com/operator-framework/operator-lifecycle-manager
.. _OpenShift Container Platform: https://www.openshift.com/
.. _Kubernetes: https://kubernetes.io/


Community Operators
===================

Argo CD Operator (Helm) is published to both OperatorHub's for Kubernetes and OpenShift. 

Kubernetes
----------

Visit OperatorHub.io_ and install the the operator as described after pressing the blue :guilabel:`Install` button. 
When the operator is up and running install Argo CD with the provided Custom Resource Definition under 
:guilabel:`View YAML Example`, choose one of these k8s `examples`_ or create your own customization with 
`configuration values`_ that fit your needs.

.. _OperatorHub.io: https://operatorhub.io/operator/argocd-operator-helm


OpenShift 4
-----------

In `OpenShift 4` navigate to :guilabel:`Administrator - Operators - OperatorHub` and install Argo CD Operator (Helm).
When the operator is up and running install Argo CD with the provided Custom Resource Definition under 
:guilabel:`Create Instance`, choose one of these ocp `examples`_ or create your own customization with 
`configuration values`_ that fit your needs.

Custom Operators
================

It's also possible to install the operator via one of our provided custom catalogs for Kubernetes and OpenShift.
Please visit the :guilabel:`Guides` sections :guilabel:`Operator Installation - Operator Lifecycle Manager` of this documentation 
for your platform with more information about this installation methods.


.. include:: _static/urls.txt
