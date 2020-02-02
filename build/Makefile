VERSION = 0.0.4
NAME = argocd-operator-helm

REGISTRY = quay.io/disposab1e

BUNDLE_MANIFEST_BASE_DIR = ../deploy/olm-catalog/
BUNDLE_DIR = bundle
BUNDLE_BUILD_BASE_DIR = _output/bundle
GUIDES_BUILD_BASE_DIR = _output/guides
QUICKSTARTS_BUILD_BASE_DIR = _output/quickstarts
GUIDES_BASE_DIR = ../guides
QUICKSTARTS_BASE_DIR = ../quickstarts

clean:
	rm -rf _output

olm-deploy:
	curl -sL https://github.com/operator-framework/operator-lifecycle-manager/releases/download/0.13.0/install.sh | bash -s 0.13.0


argocd-deploy-ocp-oauth:
	oc apply -f ./../examples/ocp-oauth.yaml

argocd-deploy-ocp:
	oc apply -f ./../examples/ocp.yaml

argocd-deploy-k8s:
	oc apply -f ./../examples/k8s.yaml

argocd-deploy-k8s-lb:
	oc apply -f ./../examples/k8s-lb.yaml

argocd-undeploy:
	oc delete ArgoCD argocd -n argocd

helm-templates:
	helm template --values ./../helm-charts/argo-cd/values.yaml  ./../helm-charts/argo-cd/
	helm template --values ./../guides/ocp3/examples/ocp-oauth.yaml ./../helm-charts/argo-cd 

docs:
	cd ../docs && make html && open ../docs/build/html/index.html


release-all: release-guides release-quickstarts operator-build-release bundle-build-ocp-release bundle-build-k8s-release

release-guides: generate-guides
	rm -rf ${GUIDES_BASE_DIR}
	cp -r ${GUIDES_BUILD_BASE_DIR} ${GUIDES_BASE_DIR}

release-quickstarts: generate-quickstarts
	rm -rf ${QUICKSTARTS_BASE_DIR}
	cp -r ${QUICKSTARTS_BUILD_BASE_DIR} ${QUICKSTARTS_BASE_DIR}

generate-all: generate-guides generate-quickstarts

generate-guides: generate-guide-ocp3-manual generate-guide-ocp3-olm generate-guide-ocp4-manual generate-guide-ocp4-olm generate-guide-k8s-manual generate-guide-k8s-olm

generate-quickstarts: generate-quickstart-ocp3 generate-quickstart-ocp4 generate-quickstart-k8s

generate-quickstart-ocp3: generate-guide-ocp3-olm
	rm -rf ${QUICKSTARTS_BUILD_BASE_DIR}/ocp3
	mkdir -p ${QUICKSTARTS_BUILD_BASE_DIR}/ocp3
	cat ${GUIDES_BUILD_BASE_DIR}/ocp3/olm/namespace.yaml > ${QUICKSTARTS_BUILD_BASE_DIR}/ocp3/operator.yaml
	echo "---" >> ${QUICKSTARTS_BUILD_BASE_DIR}/ocp3/operator.yaml
	cat ${GUIDES_BUILD_BASE_DIR}/ocp3/olm/operator-group.yaml >> ${QUICKSTARTS_BUILD_BASE_DIR}/ocp3/operator.yaml
	echo "---" >> ${QUICKSTARTS_BUILD_BASE_DIR}/ocp3/operator.yaml
	cat ${GUIDES_BUILD_BASE_DIR}/ocp3/olm/role-binding.yaml >> ${QUICKSTARTS_BUILD_BASE_DIR}/ocp3/operator.yaml
	echo "---" >> ${QUICKSTARTS_BUILD_BASE_DIR}/ocp3/operator.yaml
	cat ${GUIDES_BUILD_BASE_DIR}/ocp3/olm//catalog-source.yaml >> ${QUICKSTARTS_BUILD_BASE_DIR}/ocp3/operator.yaml
	echo "---" >> ${QUICKSTARTS_BUILD_BASE_DIR}/ocp3/operator.yaml
	cat ${GUIDES_BUILD_BASE_DIR}/ocp3/olm//subscription.yaml >> ${QUICKSTARTS_BUILD_BASE_DIR}/ocp3/operator.yaml
	cp ./../examples/ocp-oauth.yaml ${QUICKSTARTS_BUILD_BASE_DIR}/ocp3/argocd.yaml

generate-quickstart-ocp4: generate-guide-ocp4-olm
	rm -rf ${QUICKSTARTS_BUILD_BASE_DIR}/ocp4
	mkdir -p ${QUICKSTARTS_BUILD_BASE_DIR}/ocp4
	cat ${GUIDES_BUILD_BASE_DIR}/ocp4/olm/namespace.yaml > ${QUICKSTARTS_BUILD_BASE_DIR}/ocp4/operator.yaml
	echo "---" >> ${QUICKSTARTS_BUILD_BASE_DIR}/ocp4/operator.yaml
	cat ${GUIDES_BUILD_BASE_DIR}/ocp4/olm/operator-group.yaml >> ${QUICKSTARTS_BUILD_BASE_DIR}/ocp4/operator.yaml
	echo "---" >> ${QUICKSTARTS_BUILD_BASE_DIR}/ocp4/operator.yaml
	cat ${GUIDES_BUILD_BASE_DIR}/ocp4/olm//catalog-source.yaml >> ${QUICKSTARTS_BUILD_BASE_DIR}/ocp4/operator.yaml
	echo "---" >> ${QUICKSTARTS_BUILD_BASE_DIR}/ocp4/operator.yaml
	cat ${GUIDES_BUILD_BASE_DIR}/ocp4/olm//subscription.yaml >> ${QUICKSTARTS_BUILD_BASE_DIR}/ocp4/operator.yaml
	cp ./../examples/ocp-oauth.yaml ${QUICKSTARTS_BUILD_BASE_DIR}/ocp4/argocd.yaml

generate-quickstart-k8s: generate-guide-k8s-olm
	rm -rf ${QUICKSTARTS_BUILD_BASE_DIR}/k8s
	mkdir -p ${QUICKSTARTS_BUILD_BASE_DIR}/k8s
	cat ${GUIDES_BUILD_BASE_DIR}/k8s/olm/namespace.yaml > ${QUICKSTARTS_BUILD_BASE_DIR}/k8s/operator.yaml
	echo "---" >> ${QUICKSTARTS_BUILD_BASE_DIR}/k8s/operator.yaml
	cat ${GUIDES_BUILD_BASE_DIR}/k8s/olm/operator-group.yaml >> ${QUICKSTARTS_BUILD_BASE_DIR}/k8s/operator.yaml
	echo "---" >> ${QUICKSTARTS_BUILD_BASE_DIR}/k8s/operator.yaml
	cat ${GUIDES_BUILD_BASE_DIR}/k8s/olm//catalog-source.yaml >> ${QUICKSTARTS_BUILD_BASE_DIR}/k8s/operator.yaml
	echo "---" >> ${QUICKSTARTS_BUILD_BASE_DIR}/k8s/operator.yaml
	cat ${GUIDES_BUILD_BASE_DIR}/k8s/olm//subscription.yaml >> ${QUICKSTARTS_BUILD_BASE_DIR}/k8s/operator.yaml
	cp ./../examples/k8s.yaml ${QUICKSTARTS_BUILD_BASE_DIR}/k8s/argocd.yaml

generate-guide-ocp3-manual:
	rm -rf ${GUIDES_BUILD_BASE_DIR}/ocp3/manual
	mkdir -p ${GUIDES_BUILD_BASE_DIR}/ocp3/manual
	cp ../deploy/common/namespace.yaml ${GUIDES_BUILD_BASE_DIR}/ocp3/manual
	cp ../deploy/common/service-account.yaml ${GUIDES_BUILD_BASE_DIR}/ocp3/manual
	cp ../deploy/common/role.yaml ${GUIDES_BUILD_BASE_DIR}/ocp3/manual
	cp ../deploy/common/role-binding.yaml ${GUIDES_BUILD_BASE_DIR}/ocp3/manual
	cp ../deploy/common/deployment.yaml ${GUIDES_BUILD_BASE_DIR}/ocp3/manual
	cp ../deploy/crds/argoproj.io_argocds_crd.yaml ${GUIDES_BUILD_BASE_DIR}/ocp3/manual/crd.yaml
	echo "---" >> ${GUIDES_BUILD_BASE_DIR}/ocp3/manual/role-binding.yaml
	cat ../deploy/ocp3/role-binding.yaml >> ${GUIDES_BUILD_BASE_DIR}/ocp3/manual/role-binding.yaml
	sed 's/-dev//g' ../deploy/common/deployment.yaml > ${GUIDES_BUILD_BASE_DIR}/ocp3/manual/deployment.yaml

generate-guide-ocp3-olm:
	rm -rf ${GUIDES_BUILD_BASE_DIR}/ocp3/olm
	mkdir -p ${GUIDES_BUILD_BASE_DIR}/ocp3/olm
	cp ../deploy/common/namespace.yaml ${GUIDES_BUILD_BASE_DIR}/ocp3/olm
	cp ../deploy/common/operator-group.yaml ${GUIDES_BUILD_BASE_DIR}/ocp3/olm
	cp ../deploy/ocp3/role-binding.yaml ${GUIDES_BUILD_BASE_DIR}/ocp3/olm
	cp ../deploy/ocp3/catalog-source.yaml ${GUIDES_BUILD_BASE_DIR}/ocp3/olm
	cp ../deploy/ocp3/subscription.yaml ${GUIDES_BUILD_BASE_DIR}/ocp3/olm
	sed 's/-dev//g' ../deploy/ocp3/catalog-source.yaml > ${GUIDES_BUILD_BASE_DIR}/ocp3/manual/catalog-source.yaml

generate-guide-ocp4-manual:
	rm -rf ${GUIDES_BUILD_BASE_DIR}/ocp4/manual
	mkdir -p ${GUIDES_BUILD_BASE_DIR}/ocp4/manual
	cp ../deploy/common/namespace.yaml ${GUIDES_BUILD_BASE_DIR}/ocp4/manual
	cp ../deploy/common/service-account.yaml ${GUIDES_BUILD_BASE_DIR}/ocp4/manual
	cp ../deploy/common/role.yaml ${GUIDES_BUILD_BASE_DIR}/ocp4/manual
	cp ../deploy/common/role-binding.yaml ${GUIDES_BUILD_BASE_DIR}/ocp4/manual
	cp ../deploy/common/deployment.yaml ${GUIDES_BUILD_BASE_DIR}/ocp4/manual
	cp ../deploy/crds/argoproj.io_argocds_crd.yaml ${GUIDES_BUILD_BASE_DIR}/ocp4/manual/crd.yaml
	sed 's/-dev//g' ../deploy/common/deployment.yaml > ${GUIDES_BUILD_BASE_DIR}/ocp4/manual/deployment.yaml

generate-guide-ocp4-olm:
	rm -rf ${GUIDES_BUILD_BASE_DIR}/ocp4/olm
	mkdir -p ${GUIDES_BUILD_BASE_DIR}/ocp4/olm
	cp ../deploy/common/namespace.yaml ${GUIDES_BUILD_BASE_DIR}/ocp4/olm
	cp ../deploy/common/operator-group.yaml ${GUIDES_BUILD_BASE_DIR}/ocp4/olm
	cp ../deploy/ocp4/catalog-source.yaml ${GUIDES_BUILD_BASE_DIR}/ocp4/olm
	cp ../deploy/ocp4/subscription.yaml ${GUIDES_BUILD_BASE_DIR}/ocp4/olm
	sed 's/-dev//g' ../deploy/ocp4/catalog-source.yaml > ${GUIDES_BUILD_BASE_DIR}/ocp4/olm/catalog-source.yaml

generate-guide-k8s-manual:
	rm -rf ${GUIDES_BUILD_BASE_DIR}/k8s/manual
	mkdir -p ${GUIDES_BUILD_BASE_DIR}/k8s/manual
	cp ../deploy/common/namespace.yaml ${GUIDES_BUILD_BASE_DIR}/k8s/manual
	cp ../deploy/common/service-account.yaml ${GUIDES_BUILD_BASE_DIR}/k8s/manual
	cp ../deploy/common/role.yaml ${GUIDES_BUILD_BASE_DIR}/k8s/manual
	cp ../deploy/common/role-binding.yaml ${GUIDES_BUILD_BASE_DIR}/k8s/manual
	cp ../deploy/common/deployment.yaml ${GUIDES_BUILD_BASE_DIR}/k8s/manual
	cp ../deploy/crds/argoproj.io_argocds_crd.yaml ${GUIDES_BUILD_BASE_DIR}/k8s/manual/crd.yaml
	sed 's/-dev//g' ../deploy/common/deployment.yaml > ${GUIDES_BUILD_BASE_DIR}/k8s/manual/deployment.yaml

generate-guide-k8s-olm:
	rm -rf ${GUIDES_BUILD_BASE_DIR}/k8s/olm
	mkdir -p ${GUIDES_BUILD_BASE_DIR}/k8s/olm
	cp ../deploy/common/namespace.yaml ${GUIDES_BUILD_BASE_DIR}/k8s/olm
	cp ../deploy/common/operator-group.yaml ${GUIDES_BUILD_BASE_DIR}/k8s/olm
	cp ../deploy/k8s/catalog-source.yaml ${GUIDES_BUILD_BASE_DIR}/k8s/olm
	cp ../deploy/k8s/subscription.yaml ${GUIDES_BUILD_BASE_DIR}/k8s/olm
	sed 's/-dev//g' ../deploy/k8s/catalog-source.yaml > ${GUIDES_BUILD_BASE_DIR}/k8s/olm/catalog-source.yaml

operator-build-dev:
	export GO111MODULE=on
	cd ../ && operator-sdk build ${REGISTRY}/${NAME}-dev:v${VERSION}
	
operator-push-dev:
	docker push ${REGISTRY}/${NAME}-dev:v${VERSION}

operator-build-release:
	export GO111MODULE=on
	cd ../ && operator-sdk build ${REGISTRY}/${NAME}:v${VERSION}
	
bundle-verifbuild-ocp-release:
	operator-courier --verbose verify ${BUNDLE_MANIFEST_BASE_DIR}/ocp/${NAME}

bundle-build-ocp-release:
	operator-courier --verbose verify ${BUNDLE_MANIFEST_BASE_DIR}/ocp/${NAME}
	mkdir -p ${BUNDLE_BUILD_BASE_DIR}/release/ocp
	cp -r ${BUNDLE_DIR}/* ${BUNDLE_BUILD_BASE_DIR}/release/ocp/
	mkdir -p ${BUNDLE_BUILD_BASE_DIR}/release/ocp/manifests
	cp -r ${BUNDLE_MANIFEST_BASE_DIR}/ocp/${NAME} ${BUNDLE_BUILD_BASE_DIR}/release/ocp/manifests/
	sed 's/argocd-operator-helm-dev/argocd-operator-helm/g' ${BUNDLE_BUILD_BASE_DIR}/release/ocp/manifests/${NAME}/0.0.4/argocd-operator-helm.v0.0.4.clusterserviceversion.yaml > ${BUNDLE_BUILD_BASE_DIR}/release/ocp/manifests/${NAME}/0.0.4/_argocd-operator-helm.v0.0.4.clusterserviceversion.yaml
	rm ${BUNDLE_BUILD_BASE_DIR}/release/ocp/manifests/${NAME}/0.0.4/argocd-operator-helm.v0.0.4.clusterserviceversion.yaml
	mv ${BUNDLE_BUILD_BASE_DIR}/release/ocp/manifests/${NAME}/0.0.4/_argocd-operator-helm.v0.0.4.clusterserviceversion.yaml ${BUNDLE_BUILD_BASE_DIR}/release/ocp/manifests/${NAME}/0.0.4/argocd-operator-helm.v0.0.4.clusterserviceversion.yaml
	sed 's/argocd-operator-helm-dev/argocd-operator-helm/g' ${BUNDLE_BUILD_BASE_DIR}/release/ocp/manifests/${NAME}/${VERSION}/argocd-operator-helm.v${VERSION}.clusterserviceversion.yaml > ${BUNDLE_BUILD_BASE_DIR}/release/ocp/manifests/${NAME}/${VERSION}/_argocd-operator-helm.v${VERSION}.clusterserviceversion.yaml
	rm ${BUNDLE_BUILD_BASE_DIR}/release/ocp/manifests/${NAME}/${VERSION}/argocd-operator-helm.v${VERSION}.clusterserviceversion.yaml
	mv ${BUNDLE_BUILD_BASE_DIR}/release/ocp/manifests/${NAME}/${VERSION}/_argocd-operator-helm.v${VERSION}.clusterserviceversion.yaml ${BUNDLE_BUILD_BASE_DIR}/release/ocp/manifests/${NAME}/${VERSION}/argocd-operator-helm.v${VERSION}.clusterserviceversion.yaml
	docker build -t ${REGISTRY}/${NAME}-registry-ocp:${VERSION} ${BUNDLE_BUILD_BASE_DIR}/release/ocp
	cp -r ${BUNDLE_BUILD_BASE_DIR}/release/ocp/manifests/${NAME} ../deploy/operatorhubs/ocp
	rm -rf ${BUNDLE_BUILD_BASE_DIR}/release/ocp

bundle-push-ocp-release:
	docker push ${REGISTRY}/${NAME}-registry-ocp:${VERSION}

bundle-build-ocp-dev:
	operator-courier --verbose verify ${BUNDLE_MANIFEST_BASE_DIR}/ocp/${NAME}
	mkdir -p ${BUNDLE_BUILD_BASE_DIR}-ocp
	cp -r ${BUNDLE_DIR}/* ${BUNDLE_BUILD_BASE_DIR}-ocp/
	mkdir -p ${BUNDLE_BUILD_BASE_DIR}-ocp/manifests
	cp -r ${BUNDLE_MANIFEST_BASE_DIR}/ocp/${NAME} ${BUNDLE_BUILD_BASE_DIR}-ocp/manifests/
	docker build -t ${REGISTRY}/${NAME}-registry-ocp-dev:${VERSION} ${BUNDLE_BUILD_BASE_DIR}-ocp/
	#rm -rf ${BUNDLE_BUILD_BASE_DIR}-ocp

bundle-push-ocp-dev:
	docker push ${REGISTRY}/${NAME}-registry-ocp-dev:${VERSION}

bundle-build-k8s-release:
	operator-courier --verbose verify ${BUNDLE_MANIFEST_BASE_DIR}/k8s/${NAME}
	mkdir -p ${BUNDLE_BUILD_BASE_DIR}/release/k8s
	cp -r ${BUNDLE_DIR}/* ${BUNDLE_BUILD_BASE_DIR}/release/k8s/
	mkdir -p ${BUNDLE_BUILD_BASE_DIR}/release/k8s/manifests
	cp -r ${BUNDLE_MANIFEST_BASE_DIR}/k8s/${NAME} ${BUNDLE_BUILD_BASE_DIR}/release/k8s/manifests/
	sed 's/argocd-operator-helm-dev/argocd-operator-helm/g' ${BUNDLE_BUILD_BASE_DIR}/release/k8s/manifests/${NAME}/0.0.4/argocd-operator-helm.v0.0.4.clusterserviceversion.yaml > ${BUNDLE_BUILD_BASE_DIR}/release/k8s/manifests/${NAME}/0.0.4/_argocd-operator-helm.v0.0.4.clusterserviceversion.yaml
	rm ${BUNDLE_BUILD_BASE_DIR}/release/k8s/manifests/${NAME}/0.0.4/argocd-operator-helm.v0.0.4.clusterserviceversion.yaml
	mv ${BUNDLE_BUILD_BASE_DIR}/release/k8s/manifests/${NAME}/0.0.4/_argocd-operator-helm.v0.0.4.clusterserviceversion.yaml ${BUNDLE_BUILD_BASE_DIR}/release/k8s/manifests/${NAME}/0.0.4/argocd-operator-helm.v0.0.4.clusterserviceversion.yaml
	sed 's/argocd-operator-helm-dev/argocd-operator-helm/g' ${BUNDLE_BUILD_BASE_DIR}/release/k8s/manifests/${NAME}/${VERSION}/argocd-operator-helm.v${VERSION}.clusterserviceversion.yaml > ${BUNDLE_BUILD_BASE_DIR}/release/k8s/manifests/${NAME}/${VERSION}/_argocd-operator-helm.v${VERSION}.clusterserviceversion.yaml
	rm ${BUNDLE_BUILD_BASE_DIR}/release/k8s/manifests/${NAME}/${VERSION}/argocd-operator-helm.v${VERSION}.clusterserviceversion.yaml
	mv ${BUNDLE_BUILD_BASE_DIR}/release/k8s/manifests/${NAME}/${VERSION}/_argocd-operator-helm.v${VERSION}.clusterserviceversion.yaml ${BUNDLE_BUILD_BASE_DIR}/release/k8s/manifests/${NAME}/${VERSION}/argocd-operator-helm.v${VERSION}.clusterserviceversion.yaml
	docker build -t ${REGISTRY}/${NAME}-registry-k8s:${VERSION} ${BUNDLE_BUILD_BASE_DIR}/release/k8s
	cp -r ${BUNDLE_BUILD_BASE_DIR}/release/k8s/manifests/${NAME} ../deploy/operatorhubs/k8s
	rm -rf ${BUNDLE_BUILD_BASE_DIR}/release/k8s

bundle-push-k8s-release:
	docker push ${REGISTRY}/${NAME}-registry-k8s:${VERSION}

bundle-build-k8s-dev:
	operator-courier --verbose verify ${BUNDLE_MANIFEST_BASE_DIR}/k8s/${NAME}
	mkdir -p ${BUNDLE_BUILD_BASE_DIR}-k8s
	cp -r ${BUNDLE_DIR}/* ${BUNDLE_BUILD_BASE_DIR}-k8s/
	mkdir -p ${BUNDLE_BUILD_BASE_DIR}-k8s/manifests
	cp -r ${BUNDLE_MANIFEST_BASE_DIR}/k8s/${NAME} ${BUNDLE_BUILD_BASE_DIR}-k8s/manifests/
	docker build -t ${REGISTRY}/${NAME}-registry-k8s-dev:${VERSION} ${BUNDLE_BUILD_BASE_DIR}-k8s/
	#rm -rf ${BUNDLE_BUILD_BASE_DIR}-k8s

bundle-push-k8s-dev:
	docker push ${REGISTRY}/${NAME}-registry-k8s-dev:${VERSION}


ocp4-deploy-olm-dev:
	oc apply -f ./../deploy/common/namespace.yaml
	oc apply -f ./../deploy/ocp4/catalog-source.yaml
	oc apply -f ./../deploy/common/operator-group.yaml
	oc wait pod -n openshift-marketplace -l olm.catalogSource=argocd-catalog --for=condition=Ready --timeout=60s
	oc apply -f ./../deploy/ocp4/subscription.yaml

ocp4-undeploy-olm-dev:
	oc delete -f ./../deploy/ocp4/subscription.yaml
	oc delete csvs --all -n argocd
	oc delete -f ./../deploy/ocp4/catalog-source.yaml
	oc delete -f ./../deploy/common/operator-group.yaml
	oc delete -f ./../deploy/common/namespace.yaml

ocp4-deploy-manual-dev:
	oc apply -f ./../deploy/common/namespace.yaml
	oc apply -f ./../deploy/common/service-account.yaml
	oc apply -f ./../deploy/common/role.yaml
	oc apply -f ./../deploy/common/role-binding.yaml
	oc apply -f ./../deploy/crds/argoproj.io_argocds_crd.yaml
	oc apply -f ./../deploy/common/deployment.yaml

ocp4-undeploy-manual-dev:
	oc delete -f ./../deploy/common/deployment.yaml
	oc delete -f ./../deploy/crds/argoproj.io_argocds_crd.yaml
	oc delete -f ./../deploy/common/role-binding.yaml
	oc delete -f ./../deploy/common/role.yaml
	oc delete -f ./../deploy/common/service-account.yaml
	oc delete -f ./../deploy/common/namespace.yaml


ocp3-deploy-olm-dev:
	oc apply -f ./../deploy/common/namespace.yaml
	oc apply -f ./../deploy/ocp3/catalog-source.yaml
	oc apply -f ./../deploy/common/operator-group.yaml
	oc apply -f ./../deploy/ocp3/role-binding.yaml
	oc wait pod -n olm -l olm.catalogSource=argocd-catalog --for=condition=Ready --timeout=60s
	oc apply -f ./../deploy/ocp3/subscription.yaml

ocp3-undeploy-olm-dev:
	oc delete -f ./../deploy/ocp3/subscription.yaml
	oc delete csvs --all -n argocd
	oc delete -f ./../deploy/ocp3/catalog-source.yaml
	oc delete -f ./../deploy/ocp3/role-binding.yaml
	oc delete -f ./../deploy/common/operator-group.yaml
	oc delete -f ./../deploy/common/namespace.yaml


ocp3-deploy-manual-dev:
	oc apply -f ./../deploy/common/namespace.yaml
	oc apply -f ./../deploy/common/service-account.yaml
	oc apply -f ./../deploy/common/role.yaml
	oc apply -f ./../deploy/common/role-binding.yaml
	oc apply -f ./../deploy/ocp3/role-binding.yaml
	oc apply -f ./../deploy/crds/argoproj.io_argocds_crd.yaml
	oc apply -f ./../deploy/common/deployment.yaml

ocp3-undeploy-manual-dev:
	oc delete -f ./../deploy/common/deployment.yaml
	oc delete -f ./../deploy/crds/argoproj.io_argocds_crd.yaml
	oc delete -f ./../deploy/ocp3/role-binding.yaml
	oc delete -f ./../deploy/common/role-binding.yaml
	oc delete -f ./../deploy/common/role.yaml
	oc delete -f ./../deploy/common/service-account.yaml
	oc delete -f ./../deploy/common/namespace.yaml

k8s-deploy-olm-dev:
	kubectl apply -f ./../deploy/common/namespace.yaml
	kubectl apply -f ./../deploy/k8s/catalog-source.yaml
	kubectl wait pod -n olm -l olm.catalogSource=argocd-catalog --for=condition=Ready --timeout=90s
	kubectl apply -f ./../deploy/common/operator-group.yaml
	kubectl wait pod -n olm -l olm.catalogSource=argocd-catalog --for=condition=Ready --timeout=60s
	sleep 5
	kubectl apply -f ./../deploy/k8s/subscription.yaml
	kubectl wait pod -n argocd -l name=argocd-operator-helm --for=condition=Ready --timeout=90s
	kubectl rollout status -w deployment/argocd-operator-helm -n argocd


k8s-undeploy-olm-dev:
	kubectl delete -f ./../deploy/k8s/subscription.yaml
	kubectl delete csvs --all -n argocd
	kubectl delete -f ./../deploy/k8s/catalog-source.yaml
	kubectl delete -f ./../deploy/common/operator-group.yaml
	kubectl delete -f ./../deploy/common/namespace.yaml


k8s-deploy-manual-dev:
	kubectl apply -f ./../deploy/common/namespace.yaml
	kubectl apply -f ./../deploy/common/service-account.yaml
	kubectl apply -f ./../deploy/common/role.yaml
	kubectl apply -f ./../deploy/common/role-binding.yaml
	kubectl apply -f ./../deploy/crds/argoproj.io_argocds_crd.yaml
	kubectl apply -f ./../deploy/common/deployment.yaml

k8s-undeploy-manual-dev:
	kubectl delete -f ./../deploy/common/deployment.yaml
	kubectl delete -f ./../deploy/crds/argoproj.io_argocds_crd.yaml
	kubectl delete -f ./../deploy/common/role-binding.yaml
	kubectl delete -f ./../deploy/common/role.yaml
	kubectl delete -f ./../deploy/common/service-account.yaml
	kubectl delete -f ./../deploy/common/namespace.yaml



