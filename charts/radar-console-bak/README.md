

# radar-console
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-console)](https://artifacthub.io/packages/helm/radar-base/radar-console)

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.1](https://img.shields.io/badge/AppVersion-0.0.1-informational?style=flat-square)

RADAR-base console web application.

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-console>
* <https://github.com/RADAR-base/radar-console>

## Prerequisites
* Kubernetes 1.28+
* Kubectl 1.28+
* Helm 3.1.0+

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.companyinfo.dev | helmet | 0.14.0 |
| https://radar-base.github.io/radar-helm-charts | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| serverName | string | `"localhost"` |  |
| image.registry | string | `"ghcr.io"` |  |
| image.repository | string | `"peymanm/management-portal"` |  |
| image.tag | string | `"unified-ui-0.0.68"` |  |
| livenessProbe.httpGet.path | string | `"/"` |  |
| livenessProbe.httpGet.port | int | `8080` |  |
| livenessProbe.initialDelaySeconds | int | `180` |  |
| livenessProbe.timeoutSeconds | int | `1` |  |
| livenessProbe.periodSeconds | int | `12` |  |
| livenessProbe.failureThreshold | int | `5` |  |
| readinessProbe.httpGet.path | string | `"/"` |  |
| readinessProbe.httpGet.port | int | `8080` |  |
| readinessProbe.initialDelaySeconds | int | `45` |  |
| readinessProbe.timeoutSeconds | int | `1` |  |
| readinessProbe.periodSeconds | int | `5` |  |
| readinessProbe.failureThreshold | int | `3` |  |
| envVars | list | `[]` |  |
| ports[0].name | string | `"http"` |  |
| ports[0].containerPort | int | `8080` |  |
| ports[0].protocol | string | `"TCP"` |  |
| configMap.mounted | bool | `true` |  |
| configMap.mountPath | string | `"/app/config"` |  |
| configMap.data."frontend-config.json" | object | `{}` |  |
| ingress.enabled | bool | `true` |  |
| ingress.hostname | string | `"{{ .Values.serverName }}"` |  |
| ingress.path | string | `"/"` |  |
| ingress.ingressClassName | string | `"nginx"` |  |
| ingress.tls | bool | `true` |  |
| ingress.existingSecret | string | `"radar-base-tls"` |  |
| service.ports[0].name | string | `"http"` |  |
| service.ports[0].port | int | `8080` |  |
| service.ports[0].targetPort | int | `8080` |  |
| networkpolicy.policyTypes[0] | string | `"Ingress"` |  |
| networkpolicy.policyTypes[1] | string | `"Egress"` |  |
| networkpolicy.ingress[0].from[0].namespaceSelector.matchLabels."kubernetes.io/metadata.name" | string | `"{{ .Release.Namespace }}"` |  |
| networkpolicy.ingress[0].from[0].podSelector.matchLabels."app.kubernetes.io/name" | string | `"ingress-nginx"` |  |
| networkpolicy.egress[0].to[0].namespaceSelector.matchLabels."kubernetes.io/metadata.name" | string | `"kube-system"` |  |
| networkpolicy.egress[0].to[0].podSelector.matchLabels.k8s-app | string | `"kube-dns"` |  |
| networkpolicy.egress[0].ports[0].port | int | `53` |  |
| networkpolicy.egress[0].ports[0].protocol | string | `"UDP"` |  |
| networkpolicy.egress[0].ports[1].port | int | `53` |  |
| networkpolicy.egress[0].ports[1].protocol | string | `"TCP"` |  |
