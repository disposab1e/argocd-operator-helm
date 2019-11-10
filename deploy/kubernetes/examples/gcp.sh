#!/bin/sh

gcloud beta container --project "argoproj" clusters create "argoproj" \
--zone "europe-west3-a" \
--no-enable-basic-auth \
--cluster-version "1.14.7-gke.14" \
--machine-type "n1-standard-2" \
--image-type "COS" \
--disk-type "pd-standard" \
--disk-size "100" \
--metadata disable-legacy-endpoints=true \
--scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" \
--preemptible \
--num-nodes "1" \
--enable-stackdriver-kubernetes \
--enable-ip-alias \
--network "projects/argoproj/global/networks/default" \
--subnetwork "projects/argoproj/regions/europe-west3/subnetworks/default" \
--default-max-pods-per-node "110" \
--addons HorizontalPodAutoscaling,HttpLoadBalancing \
--enable-autoupgrade \
--enable-autorepair \
--no-shielded-integrity-monitoring
