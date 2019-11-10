#!/bin/sh

minikube profile argoproj

minikube start -p argoproj \
    --vm-driver=hyperkit \
    --memory=16384 \
    --kubernetes-version=v1.14.1 \
    --bootstrapper=kubeadm \
    --extra-config=kubelet.authentication-token-webhook=true \
    --extra-config=kubelet.authorization-mode=Webhook \
    --extra-config=scheduler.address=0.0.0.0 \
    --extra-config=controller-manager.address=0.0.0.0

minikube addons disable metrics-server
minikube addons enable registry
minikube addons enable dashboard
