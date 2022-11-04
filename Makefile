EXTERNAL_CHARTS = $(shell grep -P "^update-\S+:$$" Makefile | cut -d: -f1)
#EXTERNAL_CHARTS = $(shell find external -mindepth 1 -maxdepth 1 -type d | sed 's/external\//update-/')

gen:
	@echo "Generate chart docs"
	@helm-docs -s file --template-files=charts/_templates.gotmpl --template-files=DOCS.md.gotmpl --template-files=README.md.gotmpl

deps: $(EXTERNAL_CHARTS)
	@echo "Update chart dependencies"

update-cert-manager:
	@rm -rf external/$(patsubst update-%,%,$@)
	@helm repo add $(patsubst update-%,%,$@) https://charts.jetstack.io
	@helm pull -d external --untar $(patsubst update-%,%,$@)/$(patsubst update-%,%,$@)

update-common: repo-bitnami
	@rm -rf external/$(patsubst update-%,%,$@)
	@helm pull -d external --untar bitnami/$(patsubst update-%,%,$@)

update-elasticsearch:
	@rm -rf external/$(patsubst update-%,%,$@)
	@helm repo add $(patsubst update-%,%,$@) https://helm.elastic.co
	@helm pull -d external --untar $(patsubst update-%,%,$@)/$(patsubst update-%,%,$@)

update-fluent-bit:
	@rm -rf external/$(patsubst update-%,%,$@)
	@helm repo add $(patsubst update-%,%,$@) https://fluent.github.io/helm-charts
	@helm pull -d external --untar $(patsubst update-%,%,$@)/$(patsubst update-%,%,$@)

update-grafana:
	@rm -rf external/$(patsubst update-%,%,$@)
	@helm repo add $(patsubst update-%,%,$@) https://grafana.github.io/helm-charts
	@helm pull -d external --untar $(patsubst update-%,%,$@)/$(patsubst update-%,%,$@)

update-graylog:
	@rm -rf external/$(patsubst update-%,%,$@)
	@helm repo add $(patsubst update-%,%,$@) https://charts.kong-z.com
	@helm pull -d external --untar $(patsubst update-%,%,$@)/$(patsubst update-%,%,$@)

update-ingress-nginx:
	@rm -rf external/$(patsubst update-%,%,$@)
	@helm repo add $(patsubst update-%,%,$@) https://kubernetes.github.io/ingress-nginx
	@helm pull -d external --untar $(patsubst update-%,%,$@)/$(patsubst update-%,%,$@)

update-minio: repo-bitnami
	@rm -rf external/$(patsubst update-%,%,$@)
	@helm pull -d external --untar bitnami/$(patsubst update-%,%,$@)

update-mongodb: repo-bitnami
	@rm -rf external/$(patsubst update-%,%,$@)
	@helm pull -d external --untar bitnami/$(patsubst update-%,%,$@)

update-postgresql: repo-bitnami
	@rm -rf external/$(patsubst update-%,%,$@)
	@helm pull -d external --untar bitnami/$(patsubst update-%,%,$@)

update-redis: repo-bitnami
	@rm -rf external/$(patsubst update-%,%,$@)
	@helm pull -d external --untar bitnami/$(patsubst update-%,%,$@)

update-velero:
	@rm -rf external/$(patsubst update-%,%,$@)
	@helm repo add $(patsubst update-%,%,$@) https://vmware-tanzu.github.io/helm-charts
	@helm pull -d external --untar $(patsubst update-%,%,$@)/$(patsubst update-%,%,$@)

repo-bitnami:
	@helm repo add bitnami https://charts.bitnami.com/bitnami
