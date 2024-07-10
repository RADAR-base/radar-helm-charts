EXTERNAL_CHARTS = $(shell grep -P "^update-\S+:$$" Makefile | cut -d: -f1)
#EXTERNAL_CHARTS = $(shell find external -mindepth 1 -maxdepth 1 -type d | sed 's/external\//update-/')

gen:
	@echo "Generate chart docs"
	@helm-docs -s file --template-files=charts/_templates.gotmpl --template-files=DOCS.md.gotmpl --template-files=README.md.gotmpl

deps: $(EXTERNAL_CHARTS)
	@echo "Updated chart dependencies"

update-cert-manager:
	@echo "Updating cert-manager"
	@rm -rf external/$(patsubst update-%,%,$@)
	@helm repo add $(patsubst update-%,%,$@) https://charts.jetstack.io
	@helm pull -d external --untar $(patsubst update-%,%,$@)/$(patsubst update-%,%,$@)
	@echo ""

update-common:
	@echo "Updating common"
	@helm repo add bitnami https://charts.bitnami.com/bitnami
	@rm -rf external/$(patsubst update-%,%,$@)
	@helm pull -d external --untar bitnami/$(patsubst update-%,%,$@)
	@echo ""

update-elasticsearch:
	@echo "Updating elasticsearch"
	@rm -rf external/$(patsubst update-%,%,$@)
	@helm repo add $(patsubst update-%,%,$@) https://helm.elastic.co
	@helm pull -d external --untar $(patsubst update-%,%,$@)/$(patsubst update-%,%,$@)
	@echo ""

update-fluent-bit:
	@echo "Updating fluent-bit"
	@rm -rf external/$(patsubst update-%,%,$@)
	@helm repo add $(patsubst update-%,%,$@) https://fluent.github.io/helm-charts
	@helm pull -d external --untar $(patsubst update-%,%,$@)/$(patsubst update-%,%,$@)
	@echo ""

update-grafana:
	@echo "Updating grafana"
	@rm -rf external/$(patsubst update-%,%,$@)
	@helm repo add $(patsubst update-%,%,$@) https://grafana.github.io/helm-charts
	@helm pull -d external --untar $(patsubst update-%,%,$@)/$(patsubst update-%,%,$@)
	@echo ""

update-graylog:
	@echo "Updating graylog"
	@rm -rf external/$(patsubst update-%,%,$@)
	@helm repo add $(patsubst update-%,%,$@) https://charts.kong-z.com
	@helm pull -d external --untar $(patsubst update-%,%,$@)/$(patsubst update-%,%,$@)
	@echo ""

update-ingress-nginx:
	@echo "Updating ingress-nginx"
	@rm -rf external/$(patsubst update-%,%,$@)
	@helm repo add $(patsubst update-%,%,$@) https://kubernetes.github.io/ingress-nginx
	@helm pull -d external --untar $(patsubst update-%,%,$@)/$(patsubst update-%,%,$@)
	@echo ""

update-minio:
	@echo "Updating minio"
	@helm repo add bitnami https://charts.bitnami.com/bitnami
	@rm -rf external/$(patsubst update-%,%,$@)
	@helm pull -d external --untar bitnami/$(patsubst update-%,%,$@)
	@echo ""

update-mongodb:
	@echo "Updating mongodb"
	@helm repo add bitnami https://charts.bitnami.com/bitnami
	@rm -rf external/$(patsubst update-%,%,$@)
	@helm pull -d external --untar bitnami/$(patsubst update-%,%,$@)
	@echo ""

update-postgresql:
	@echo "Updating postgresql"
	@helm repo add bitnami https://charts.bitnami.com/bitnami
	@rm -rf external/$(patsubst update-%,%,$@)
	@helm pull -d external --untar bitnami/$(patsubst update-%,%,$@)
	@echo ""

update-redis:
	@echo "Updating redis"
	@helm repo add bitnami https://charts.bitnami.com/bitnami
	@rm -rf external/$(patsubst update-%,%,$@)
	@helm pull -d external --untar bitnami/$(patsubst update-%,%,$@)
	@echo ""

update-velero:
	@echo "Updating velero"
	@helm repo add bitnami https://charts.bitnami.com/bitnami
	@rm -rf external/$(patsubst update-%,%,$@)
	@helm repo add $(patsubst update-%,%,$@) https://vmware-tanzu.github.io/helm-charts
	@helm pull -d external --untar $(patsubst update-%,%,$@)/$(patsubst update-%,%,$@)
	@echo ""
