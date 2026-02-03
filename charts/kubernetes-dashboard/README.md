




# kubernetes-dashboard
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/kubernetes-dashboard)](https://artifacthub.io/packages/helm/radar-base/kubernetes-dashboard)


![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 7.3.2](https://img.shields.io/badge/AppVersion-7.3.2-informational?style=flat-square) 

A Helm chart for Kubernetes Dashboard. This chart is an overlay for the official kubernetes-dashboard chart with custom resource limits configured for RADAR-K8s environments.

**Homepage:** <https://github.com/kubernetes/dashboard>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Mani Thumu | <mani.thumu@kcl.ac.uk> |  |
| Yatharth Ranjan | <yatharth.ranjan@kcl.ac.uk> |  |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/kubernetes-dashboard>
* <https://github.com/kubernetes/dashboard>

## Prerequisites
* Kubernetes 1.28+
* Kubectl 1.28+
* Helm 3.1.0+

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://kubernetes.github.io/dashboard/ | kubernetes-dashboard | 7.3.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| kubernetes-dashboard.auth.containers.resources.requests.cpu | string | `"10m"` |  |
| kubernetes-dashboard.auth.containers.resources.requests.memory | string | `"64Mi"` |  |
| kubernetes-dashboard.auth.containers.resources.limits.cpu | string | `"100m"` |  |
| kubernetes-dashboard.auth.containers.resources.limits.memory | string | `"256Mi"` |  |
| kubernetes-dashboard.api.containers.resources.requests.cpu | string | `"10m"` |  |
| kubernetes-dashboard.api.containers.resources.requests.memory | string | `"64Mi"` |  |
| kubernetes-dashboard.api.containers.resources.limits.cpu | string | `"100m"` |  |
| kubernetes-dashboard.api.containers.resources.limits.memory | string | `"256Mi"` |  |
| kubernetes-dashboard.web.containers.resources.requests.cpu | string | `"10m"` |  |
| kubernetes-dashboard.web.containers.resources.requests.memory | string | `"64Mi"` |  |
| kubernetes-dashboard.web.containers.resources.limits.cpu | string | `"100m"` |  |
| kubernetes-dashboard.web.containers.resources.limits.memory | string | `"256Mi"` |  |
| kubernetes-dashboard.metricsScraper.enabled | bool | `true` |  |
| kubernetes-dashboard.metricsScraper.containers.resources.requests.cpu | string | `"10m"` |  |
| kubernetes-dashboard.metricsScraper.containers.resources.requests.memory | string | `"64Mi"` |  |
| kubernetes-dashboard.metricsScraper.containers.resources.limits.cpu | string | `"100m"` |  |
| kubernetes-dashboard.metricsScraper.containers.resources.limits.memory | string | `"256Mi"` |  |
| kubernetes-dashboard.kong.enabled | bool | `true` |  |
| kubernetes-dashboard.kong.env.dns_order | string | `"LAST,A,CNAME,AAAA,SRV"` |  |
| kubernetes-dashboard.kong.env.plugins | string | `"off"` |  |
| kubernetes-dashboard.kong.env.nginx_worker_processes | int | `1` |  |
| kubernetes-dashboard.kong.ingressController.enabled | bool | `false` |  |
| kubernetes-dashboard.kong.dblessConfig.configMap | string | `"kong-dbless-config"` |  |
| kubernetes-dashboard.kong.proxy.type | string | `"ClusterIP"` |  |
| kubernetes-dashboard.kong.proxy.http.enabled | bool | `false` |  |
| kubernetes-dashboard.kong.deploymentAnnotations | object | `{}` |  |
| kubernetes-dashboard.kong.resources.requests.cpu | string | `"100m"` |  |
| kubernetes-dashboard.kong.resources.requests.memory | string | `"181Mi"` |  |
| kubernetes-dashboard.kong.resources.limits.cpu | string | `"200m"` |  |
| kubernetes-dashboard.kong.resources.limits.memory | string | `"256Mi"` |  |
| kubernetes-dashboard.metrics-server.enabled | bool | `false` |  |
| kubernetes-dashboard.cert-manager.enabled | bool | `false` |  |
| kubernetes-dashboard.nginx.enabled | bool | `false` |  |
| kubernetes-dashboard.app.security.securityContext.runAsNonRoot | bool | `true` |  |
| kubernetes-dashboard.app.security.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| kubernetes-dashboard.app.security.containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| kubernetes-dashboard.app.security.containerSecurityContext.readOnlyRootFilesystem | bool | `true` |  |
| kubernetes-dashboard.app.security.containerSecurityContext.runAsUser | int | `1001` |  |
| kubernetes-dashboard.app.security.containerSecurityContext.runAsGroup | int | `2001` |  |
| kubernetes-dashboard.app.security.containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
