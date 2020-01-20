***********
OpenShift 3
***********

A installation guide for Argo CD Operator (Helm), Argo CD, 
Argo CD CLI and the Guestbook Example in OpenShift 3.11 (OCP_, OKD_, Minishift_).

.. _OCP: https://www.openshift.com/products/container-platform
.. _OKD: https://github.com/openshift/origin
.. _Minishift: https://github.com/MiniShift/minishift


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
.. image:: https://img.shields.io/badge/minishift-1.34-red.svg
   :target: https://github.com/MiniShift/minishift
   :alt: Minishift
.. image:: https://img.shields.io/badge/olm-0.13.0-red.svg
   :target: https://github.com/operator-framework/operator-lifecycle-manager
   :alt: Operator Lifecycle Manager

As usual you need to have access to an up and running OpenShift 3.11 cluster. 

.. include:: ../_static/ocp_olm.txt

Operator Installation
=====================

It’s possible to install the operator using the Operator Lifecycle Manager or manually.

Operator Lifecycle Manager
--------------------------

This installation method installs the operator using an `OLM Catalog`_.

.. _OLM Catalog: https://quay.io/repository/disposab1e/argocd-operator-helm-registry

.. image:: https://img.shields.io/badge/git%20clone-https%3A%2F%2Fgithub.com%2Fdisposab1e%2Fargocd--operator--helm.git-9cf.svg
   :target: https://github.com/disposab1e/argocd-operator-helm
   :alt: git clone

.. code-block:: bash

    oc apply -f guides/ocp3/olm/namespace.yaml
    oc apply -f guides/ocp3/olm/catalog-source.yaml
    oc apply -f guides/ocp3/olm/operator-group.yaml
    oc apply -f guides/ocp3/olm/subscription.yaml
    oc apply -f guides/ocp3/olm/role_binding.yaml

    oc rollout status -w deployment/argocd-operator-helm -n argocd

Manual
------

You can install the operator from local sources without having to install an OLM Catalog.

.. Note:: No channel subscription and automatic operator updates available with this method. 

.. image:: https://img.shields.io/badge/git%20clone-https%3A%2F%2Fgithub.com%2Fdisposab1e%2Fargocd--operator--helm.git-9cf.svg
   :target: https://github.com/disposab1e/argocd-operator-helm
   :alt: git clone

.. code-block:: bash

    oc apply -f guides/ocp3/manual/namespace.yaml
    oc apply -f guides/ocp3/manual/service_account.yaml
    oc apply -f guides/ocp3/manual/role.yaml
    oc apply -f guides/ocp3/manual/role_binding.yaml
    oc apply -f guides/ocp3/manual/crd.yaml
    oc apply -f guides/ocp3/manual/deployment.yaml

    oc rollout status -w deployment/argocd-operator-helm -n argocd

Argo CD Installation
=====================

Install Argo CD server components and Argo CD command line interface.

Argo CD
-------

Install Argo CD with OpenShift OAuth integration (recommended) 
or with the Default Authentication provider.

.. Note:: This operator shares all `configuration values`_ from the Argo CD Helm Chart.

.. _configuration values: https://github.com/disposab1e/argocd-operator-helm/blob/release-0.0.3/helm-charts/argo-cd/README.md


OpenShift OAuth
"""""""""""""""

.. image:: https://img.shields.io/badge/git%20clone-https%3A%2F%2Fgithub.com%2Fdisposab1e%2Fargocd--operator--helm.git-9cf.svg
   :target: https://github.com/disposab1e/argocd-operator-helm
   :alt: git clone

.. code-block:: bash
   
    oc apply -f guides/ocp3/examples/openshift-oauth.yaml

    oc get ArgoCDs argocd -n argocd

    oc rollout status -w deployment/argocd-application-controller -n argocd
    oc rollout status -w deployment/argocd-dex-server -n argocd
    oc rollout status -w deployment/argocd-redis -n argocd
    oc rollout status -w deployment/argocd-repo-server -n argocd
    oc rollout status -w deployment/argocd-server -n argocd


Default Authentication
""""""""""""""""""""""

.. code-block:: bash
   
    oc apply -f guides/ocp3/examples/openshift-default-auth.yaml

    oc get ArgoCDs argocd -n argocd

    oc rollout status -w deployment/argocd-application-controller -n argocd
    oc rollout status -w deployment/argocd-dex-server -n argocd
    oc rollout status -w deployment/argocd-redis -n argocd
    oc rollout status -w deployment/argocd-repo-server -n argocd
    oc rollout status -w deployment/argocd-server -n argocd


Argo CD Route
-------------

Argo CD web frontend is immediately accessible through an SSL passthrough route.

.. image:: ../_static/ocp3_route.png

.. image:: https://img.shields.io/badge/Browser-https%3A%2F%2Fargocd--server--argocd.192.168.64.94.nip.io%2F-9cf
   :target: https://argocd-server-argocd.192.168.64.94.nip.io
   :alt: Point your Browser to

.. image:: ../_static/common_argocd_login_oauth.png


Argo CD CLI
-----------

Argo CD provides a command line interface. 
To be in sync with your Argo CD version you can download it directly from 
the Argo CD installation.


Download CLI
""""""""""""

.. code-block:: bash
   
    curl --insecure https://argocd-server-argocd.192.168.64.94.nip.io/download/argocd-linux-amd64 -o argocd  


Change default password
"""""""""""""""""""""""

Following example changes the default password to ``Password1!``

.. code-block:: bash
   
    oc -n argocd patch secret argocd-secret \
    -p '{"stringData": {
        "admin.password": "$2a$10$hDj12Tw9xVmvybSahN1Y0.f9DZixxN8oybyA32Uy/eqWklFU4Mo8O",
        "admin.passwordMtime": "'$(date +%FT%T%Z)'"
    }}'


Login Argo CD
"""""""""""""

.. code-block:: bash
   
    argocd login --insecure --username admin --password Password1! argocd-server-argocd.apps-crc.testing

.. include:: ../_static/common_guestbook_example.txt


Cleanup
=======

`Ants`_ are very clean species too!

.. _Ants: https://en.wikipedia.org/wiki/Ant


Guestbook Example
-----------------

.. code-block:: bash

    argocd app delete guestbook


Argo CD installation
--------------------

The uninstallation process will remove the Argo CD installation (CR) but NOT the CRD's. You have to remove them manually:

.. code-block:: bash
    
    oc delete ArgoCD argocd -n argocd

    oc delete crd appprojects.argoproj.io
    oc delete crd applications.argoproj.io
    oc delete crd workflowtemplates.argoproj.io
    oc delete crd workflows.argoproj.io



Operator Marketplace installation
---------------------------------

.. code-block:: bash

    oc delete -f guides/ocp3/olm/role_binding.yaml
    oc delete -f guides/ocp3/olm/subscription.yaml
    oc delete csv argocd-operator-helm.v0.0.3 -n argocd
    oc delete crd argocds.argoproj.io
    oc delete -f guides/ocp3/olm/catalog-source.yaml
    oc delete -f guides/ocp3/olm/operator-group.yaml
    oc delete -f guides/ocp3/olm/namespace.yaml


Manual installation
-------------------

.. code-block:: bash

    oc delete -f guides/ocp3/manual/deployment.yaml
    oc delete -f guides/ocp3/manual/crd.yaml
    oc delete -f guides/ocp3/manual/role_binding.yaml
    oc delete -f guides/ocp3/manual/role.yaml
    oc delete -f guides/ocp3/manual/service_account.yaml
    oc delete -f guides/ocp3/manual/namespace.yaml

