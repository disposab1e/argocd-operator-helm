********************
CodeReady Containers 
********************

A installation guide for Argo CD Operator (Helm), Argo CD, 
Argo CD CLI and the Guestbook Example in CodeReady Containers.

.. Note:: 
   You have to be in the :guilabel:`cluster-admin` ClusterRole to install the operator and Argo CD.


Prerequisites
=============

.. image:: https://img.shields.io/badge/crc-1.1.0-red.svg
   :target: https://github.com/code-ready/crc
   :alt: CodeReady Containers
.. image:: https://img.shields.io/badge/ocp-4.2-red.svg
   :target: https://www.openshift.com/products/container-platform
   :alt: OpenShift Container Platform


OpenShift
---------

As usual you need to have access to an up and running `OpenShift`_ cluster. 
If you have not yet installed a cluster, here is an example_ that we use.

.. _OpenShift: https://github.com/code-ready/crc
.. _example: https://github.com/disposab1e/argocd-operator-helm/blob/release-0.0.1/deploy/openshift/examples/crc.sh

It's recommended to open the OpenShift Console to follow the screenshots in this guide.

.. code-block:: bash

    crc console


Operator Installation
=====================

It's possible to install the operator via the `Marketplace`_ with our 
custom `catalog source`_ or from `Local`_ resources. 
The most convenient and best possible integration within the 
`Operator Lifecycle Manager`_ 
is the `Marketplace`_ method. Anyway, both methods are possible.

.. _Operator Lifecycle Manager: https://github.com/operator-framework/operator-lifecycle-manager


Marketplace
-----------

The marketplace installation method installs a `catalog source`_ 
with all `available operator packages`_.

.. _catalog source: https://quay.io/application/disposab1e/argocd-operators-helm
.. _available operator packages: https://quay.io/application/disposab1e/argocd-operators-helm?tab=releases

.. code-block:: bash
   
    git clone https://github.com/disposab1e/argocd-operator-helm.git

    oc apply -f deploy/openshift/marketplace/namespace.yaml
    oc apply -f deploy/openshift/marketplace/operator-source.yaml
    oc apply -f deploy/openshift/marketplace/operator-group.yaml
    oc apply -f deploy/openshift/marketplace/subscription.yaml
    
    oc rollout status -w deployment/argocd-operators-helm -n openshift-marketplace
    oc rollout status -w deployment/argocd-operator-helm -n argocd


.. image:: https://img.shields.io/badge/Screenshot-Console-red
   :target: ../_static/crc_01.png
   :alt: Screenshot
.. image:: https://img.shields.io/badge/Screenshot-Console-red
   :target: ../_static/crc_02.png
   :alt: Screenshot
.. image:: https://img.shields.io/badge/Screenshot-Console-red
   :target: ../_static/crc_03.png
   :alt: Screenshot


Local
-----

You can install the operator from local sources without having to install a catalog source.

.. Caution:: No channel subscription and automatic operator updates available with this method. 

.. code-block:: bash

    git clone https://github.com/disposab1e/argocd-operator-helm.git

    oc apply -f deploy/openshift/local/namespace.yaml
    oc apply -f deploy/openshift/local/service_account.yaml
    oc apply -f deploy/openshift/local/role.yaml
    oc apply -f deploy/openshift/local/role_binding.yaml
    oc apply -f deploy/openshift/local/crd.yaml
    oc apply -f deploy/openshift/local/deployment.yaml

    oc rollout status -w deployment/argocd-operator-helm -n argocd

.. image:: https://img.shields.io/badge/Screenshot-Console-red
   :target: ../_static/crc_04.png
   :alt: Screenshot

Argo CD Installation
=====================

Install Argo CD server components and Argo CD command line interface.

Argo CD
-------

Install Argo CD from the `Command Line`_ (quick) or through the 
Web Console with a nice `Web UI`_. This operator shares all `configuration values`_ from the Argo CD Helm Chart.

.. _configuration values: https://github.com/disposab1e/argocd-operator-helm/blob/release-0.0.1/helm-charts/argo-cd/README.md


Command Line
""""""""""""

.. code-block:: bash
   
    git clone https://github.com/disposab1e/argocd-operator-helm.git

    oc apply -f deploy/openshift/examples/crc.yaml

    oc get ArgoCDs argocd -n argocd

    oc rollout status -w deployment/argocd-application-controller -n argocd
    oc rollout status -w deployment/argocd-dex-server -n argocd
    oc rollout status -w deployment/argocd-redis -n argocd
    oc rollout status -w deployment/argocd-repo-server -n argocd
    oc rollout status -w deployment/argocd-server -n argocd

.. image:: https://img.shields.io/badge/Screenshot-Console-red
   :target: ../_static/crc_05.png
   :alt: Screenshot

Web UI
""""""

.. image:: ../_static/crc_argocd_install_webui_04.png
.. image:: ../_static/crc_argocd_install_webui_05.png
.. image:: ../_static/crc_argocd_install_webui_06.png
.. image:: ../_static/crc_argocd_install_webui_07.png

.. image:: https://img.shields.io/badge/Screenshot-Console-red
   :target: ../_static/crc_05.png
   :alt: Screenshot

Argo CD Route
-------------

Argo CD web frontend is immediately accessible through an SSL passthrough route.

.. image:: https://img.shields.io/badge/Browser-https%3A%2F%2Fargocd--server--argocd.apps--crc.testing%2F-9cf
   :target: https://argocd-server-argocd.apps-crc.testing
   :alt: Point your Browser to

.. image:: ../_static/crc_06.png

.. image:: ../_static/common_argocd_login.png


To access this route also form the `Argo CD CLI`_ you have to 
manually add this route to your ``/etc/hosts`` file.


.. code-block:: bash
   
    sudo vi /etc/hosts

    # End of section
    # Added by Docker Desktop
    # To allow the same kube context to work on the host and the container:
    127.0.0.1 kubernetes.docker.internal
    192.168.64.73 api.crc.testing oauth-openshift.apps-crc.testing argocd-server-argocd.apps-crc.testing




Argo CD CLI
-----------

Argo CD provides a command line interface. 
To be in sync with your Argo CD version you can download it directly from 
the Argo CD installation.


Download CLI
""""""""""""

.. code-block:: bash
   
    curl --insecure https://argocd-server-argocd.apps-crc.testing/download/argocd-linux-amd64 -o argocd  


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



Operator Marketplace installation
---------------------------------

.. code-block:: bash

    oc delete csv argocd-operator-helm.v0.0.1 -n argocd
    oc delete -f deploy/openshift/marketplace/subscription.yaml
    oc delete -f deploy/openshift/marketplace/operator-source.yaml
    oc delete -f deploy/openshift/marketplace/operator-group.yaml
    oc delete -f deploy/openshift/marketplace/namespace.yaml


Operator Local installation
---------------------------

.. code-block:: bash

    oc delete -f deploy/openshift/local/deployment.yaml
    oc delete -f deploy/openshift/local/crd.yaml
    oc delete -f deploy/openshift/local/role_binding.yaml
    oc delete -f deploy/openshift/local/role.yaml
    oc delete -f deploy/openshift/local/service_account.yaml
    oc delete -f deploy/openshift/local/namespace.yaml

