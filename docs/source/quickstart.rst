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
.. image:: https://img.shields.io/badge/olm-0.12.0-blue
   :target: https://github.com/operator-framework/operator-lifecycle-manager
   :alt: Operator Lifecycle Manager
.. image:: https://img.shields.io/badge/om-latest-blue
   :target: https://github.com/operator-framework/operator-marketplace
   :alt: Operator Marketplace


You have an up and running `OpenShift Container Platform`_ cluster or 
`Kubernetes`_ cluster with `Operator Lifecycle Manager`_ 
and `Operator Marketplace`_ installed.

.. _Operator Lifecycle Manager: https://github.com/operator-framework/operator-lifecycle-manager
.. _Operator Marketplace: https://github.com/operator-framework/operator-marketplace
.. _OpenShift Container Platform: https://www.openshift.com/
.. _Kubernetes: https://kubernetes.io/

Install Operator and Argo CD
============================

OpenShift
---------

Install the operator and Argo CD in a new ``argocd`` namespace. 

.. code-block:: bash

    # Operator

    oc apply -f  \
    https://raw.githubusercontent.com/disposab1e/argocd-operator-helm/master/deploy/openshift/quickstart/quickstart.yaml

.. code-block:: bash

    # Argo CD with defaults

    oc apply -f  \
    https://raw.githubusercontent.com/disposab1e/argocd-operator-helm/master/deploy/openshift/quickstart/argocd.yaml

This operator shares all `configuration values`_ from the Argo CD Helm Chart.

Kubernetes
----------

Install the operator in the ``marketplace`` and Argo CD in a new ``argocd`` namespace. 

.. code-block:: bash

    # Operator

    kubectl apply -f \
    https://raw.githubusercontent.com/disposab1e/argocd-operator-helm/master/deploy/kubernetes/quickstart/quickstart.yaml

.. code-block:: bash

    # Namespace Patch

    kubectl patch csv argocd-operator-helm.v0.0.1 -n marketplace --type=merge \
    -p "$(curl https://raw.githubusercontent.com/disposab1e/argocd-operator-helm/master/deploy/kubernetes/quickstart/patch.yaml)"



.. code-block:: bash

    # Argo CD with defaults

    kubectl apply -f \
    https://raw.githubusercontent.com/disposab1e/argocd-operator-helm/master/deploy/kubernetes/quickstart/argocd.yaml

This operator shares all `configuration values`_ from the Argo CD Helm Chart.

.. _configuration values: https://github.com/disposab1e/argocd-operator-helm/blob/master/helm-charts/argo-cd/README.md