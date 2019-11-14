**********
Quickstart
**********

.. Note:: 
   You have to be in the :guilabel:`cluster-admin` ClusterRole to install the operator and Argo CD.


Prerequisites
=============

.. image:: https://img.shields.io/badge/ocp-4.2-red.svg
   :target: https://www.openshift.com/products/container-platform
   :alt: OpenShift Container Platform
.. image:: https://img.shields.io/badge/kubernetes-1.14-blue.svg
   :target: https://kubernetes.io/
   :alt: Kubernetes
.. image:: https://img.shields.io/badge/olm-0.12.0-blue.svg
   :target: https://github.com/operator-framework/operator-lifecycle-manager
   :alt: Operator Lifecycle Manager


You have an up and running `OpenShift Container Platform`_ cluster or 
`Kubernetes`_ cluster with `Operator Lifecycle Manager`_ installed.

.. _Operator Lifecycle Manager: https://github.com/operator-framework/operator-lifecycle-manager
.. _OpenShift Container Platform: https://www.openshift.com/
.. _Kubernetes: https://kubernetes.io/

Install Operator and Argo CD
============================

Install the operator and Argo CD in a new ``argocd`` namespace. 

.. Note:: This operator shares all `configuration values`_ from the Argo CD Helm Chart.

.. _configuration values: https://github.com/disposab1e/argocd-operator-helm/blob/release-0.0.2/helm-charts/argo-cd/README.md


OpenShift
---------


.. code-block:: bash

    # Operator

    oc apply -f  \
    https://raw.githubusercontent.com/disposab1e/argocd-operator-helm/release-0.0.2/quickstart/openshift/quickstart.yaml

.. code-block:: bash

    # Argo CD with defaults

    oc apply -f  \
    https://raw.githubusercontent.com/disposab1e/argocd-operator-helm/release-0.0.2/quickstart/openshift/argocd.yaml


Kubernetes
----------

.. code-block:: bash

    # Operator

    kubectl apply -f \
    https://raw.githubusercontent.com/disposab1e/argocd-operator-helm/release-0.0.2/quickstart/kubernetes/quickstart.yaml


.. code-block:: bash

    # Argo CD with defaults

    kubectl apply -f \
    https://raw.githubusercontent.com/disposab1e/argocd-operator-helm/release-0.0.2/quickstart/kubernetes/argocd.yaml

