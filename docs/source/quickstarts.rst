***********
Quickstarts
***********

.. Note:: 
   You have to be in the :guilabel:`cluster-admin` ClusterRole to install the operator and Argo CD.


Prerequisites
=============

.. image:: https://img.shields.io/badge/ocp-3.11-red.svg
   :target: https://www.openshift.com/products/container-platform
   :alt: OpenShift Container Platform
.. image:: https://img.shields.io/badge/okd-3.11-red.svg
   :target: https://github.com/openshift/origin
   :alt: Origin Community Distribution of Kubernetes
.. image:: https://img.shields.io/badge/ocp-4.2-red.svg
   :target: https://www.openshift.com/products/container-platform
   :alt: OpenShift Container Platform
.. image:: https://img.shields.io/badge/kubernetes-1.14-blue.svg
   :target: https://kubernetes.io/
   :alt: Kubernetes
.. image:: https://img.shields.io/badge/olm-0.13.0-blue.svg
   :target: https://github.com/operator-framework/operator-lifecycle-manager
   :alt: Operator Lifecycle Manager


You have an up and running `OpenShift Container Platform`_ or 
`Kubernetes`_ cluster with `Operator Lifecycle Manager`_ installed.

.. _Operator Lifecycle Manager: https://github.com/operator-framework/operator-lifecycle-manager
.. _OpenShift Container Platform: https://www.openshift.com/
.. _Kubernetes: https://kubernetes.io/

Install Operator and Argo CD
============================

Install the operator and Argo CD in a new ``argocd`` namespace. 

.. Note:: This operator shares all `configuration values`_ from the Argo CD Helm Chart.



OpenShift 4
-----------


.. code-block:: bash

    # Operator

    oc apply -f  \
    https://raw.githubusercontent.com/disposab1e/argocd-operator-helm/release-0.0.4/quickstarts/ocp4/operator.yaml

.. code-block:: bash

    # Argo CD with OpenShift OAuth Integration

    oc apply -f  \
    https://raw.githubusercontent.com/disposab1e/argocd-operator-helm/release-0.0.4/quickstarts/ocp4/argocd.yaml

.. Note:: You must have an existing `developer`, `kubeadmin` or `admin` User for OAuth quickstart. If not change this file to fit your needs. 

OpenShift 3
-----------


.. code-block:: bash

    # Operator

    oc apply -f  \
    https://raw.githubusercontent.com/disposab1e/argocd-operator-helm/release-0.0.4/quickstarts/ocp3/operator.yaml

.. code-block:: bash

    # Argo CD with OpenShift OAuth Integration

    oc apply -f  \
    https://raw.githubusercontent.com/disposab1e/argocd-operator-helm/release-0.0.4/quickstarts/ocp3/argocd.yaml

.. Note:: You must have an existing `developer`, `kubeadmin` or `admin` User for OAuth quickstart. If not change this file to fit your needs. 


Kubernetes
----------

.. code-block:: bash

    # Operator

    kubectl apply -f \
    https://raw.githubusercontent.com/disposab1e/argocd-operator-helm/release-0.0.4/quickstarts/k8s/operator.yaml


.. code-block:: bash

    # Argo CD

    kubectl apply -f \
    https://raw.githubusercontent.com/disposab1e/argocd-operator-helm/release-0.0.4/quickstarts/k8s/argocd.yaml


.. include:: _static/urls.txt
