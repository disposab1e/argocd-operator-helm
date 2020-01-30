********
Minikube
********

A installation guide for Operator Lifecycle Manager, 
Argo CD Operator (Helm), Argo CD, 
Argo CD CLI and the Guestbook Example in Minikube.

.. include:: ../_static/kubernetes_clusteradmin.txt



Prerequisites
=============

.. image:: https://img.shields.io/badge/minikube-v1.6.2-blue.svg
   :target: https://github.com/kubernetes/minikube
   :alt: minikube
.. image:: https://img.shields.io/badge/kubernetes-1.16-blue.svg
   :target: https://v1-16.docs.kubernetes.io/
   :alt: Kubernetes
.. image:: https://img.shields.io/badge/olm-0.13.0-blue.svg
   :target: https://github.com/operator-framework/operator-lifecycle-manager
   :alt: Operator Lifecycle Manager

.. include:: ../_static/kubernetes_olm.txt


.. include:: ../_static/kubernetes_operator_installation.txt

.. include:: ../_static/kubernetes_operator_olm_installation.txt


.. image:: https://img.shields.io/badge/Screenshot-Console-red.svg
   :target: ../_static/minikube_02.png
   :alt: Screenshot


.. include:: ../_static/kubernetes_operator_manual_installation.txt



Argo CD Installation
=====================

Install Argo CD server components and Argo CD command line interface.

Argo CD
-------

.. Note:: This operator shares all `configuration values`_ from the Argo CD Helm Chart.


.. image:: https://img.shields.io/badge/git%20clone-https%3A%2F%2Fgithub.com%2Fdisposab1e%2Fargocd--operator--helm.git-9cf.svg
   :target: https://github.com/disposab1e/argocd-operator-helm
   :alt: git clone

.. code-block:: bash
   
    kubectl apply -f examples/minikube.yaml

.. include:: ../_static/kubernetes_argocd_installation.txt


Argo CD Ingress
---------------

For simplicity we use port forwarding.

.. code-block:: bash
   
    kubectl port-forward svc/argocd-server -n argocd 9001:443

.. image:: https://img.shields.io/badge/Browser-http%3A%2F%2Flocalhost%3A9001-orange.svg
   :target: http://localhost:9001
   :alt: Point your Browser to

.. image:: ../_static/common_argocd_login.png


Argo CD CLI
-----------

Argo CD provides a command line interface. 
To be in sync with your Argo CD version you can download it directly from 
the Argo CD installation.


Download CLI
""""""""""""

.. code-block:: bash
   
    curl --insecure https://localhost:9001/download/argocd-linux-amd64 -o argocd  


.. include:: ../_static/kubernetes_change_default_password.txt


Login Argo CD
"""""""""""""

.. code-block:: bash
   
    argocd login --insecure --username admin --password Password1! localhost:9001


.. include:: ../_static/common_guestbook_example.txt

.. include:: ../_static/kubernetes_cleanup.txt

.. include:: ../_static/urls.txt
