# kubernetes-dashboard

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 7.3.2](https://img.shields.io/badge/AppVersion-7.3.2-informational?style=flat-square)

A Helm chart for Kubernetes Dashboard. This chart is an overlay for the official kubernetes-dashboard chart with custom resource limits configured for RADAR-K8s environments.

**Homepage:** <https://github.com/kubernetes/dashboard>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Mani Thumu | <mani.thumu@kcl.ac.uk> | <https://www.kcl.ac.uk> |
| Yatharth Ranjan | <yatharth.ranjan@kcl.ac.uk> | <https://www.kcl.ac.uk/people/yatharth-ranjan> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/kubernetes-dashboard>
* <https://github.com/kubernetes/dashboard>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://kubernetes.github.io/dashboard/ | kubernetes-dashboard | 7.3.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| kubernetes-dashboard.auth.containers.resources.requests.cpu | string | `"10m"` | CPU request for auth container. Actual usage: ~1m |
| kubernetes-dashboard.auth.containers.resources.requests.memory | string | `"64Mi"` | Memory request for auth container. Actual usage: ~7Mi |
| kubernetes-dashboard.auth.containers.resources.limits.cpu | string | `"100m"` | CPU limit for auth container |
| kubernetes-dashboard.auth.containers.resources.limits.memory | string | `"256Mi"` | Memory limit for auth container |
| kubernetes-dashboard.api.containers.resources.requests.cpu | string | `"10m"` | CPU request for API container. Actual usage: ~1m |
| kubernetes-dashboard.api.containers.resources.requests.memory | string | `"64Mi"` | Memory request for API container. Actual usage: ~10Mi |
| kubernetes-dashboard.api.containers.resources.limits.cpu | string | `"100m"` | CPU limit for API container |
| kubernetes-dashboard.api.containers.resources.limits.memory | string | `"256Mi"` | Memory limit for API container |
| kubernetes-dashboard.web.containers.resources.requests.cpu | string | `"10m"` | CPU request for web container. Actual usage: ~1m |
| kubernetes-dashboard.web.containers.resources.requests.memory | string | `"64Mi"` | Memory request for web container. Actual usage: ~7Mi |
| kubernetes-dashboard.web.containers.resources.limits.cpu | string | `"100m"` | CPU limit for web container |
| kubernetes-dashboard.web.containers.resources.limits.memory | string | `"256Mi"` | Memory limit for web container |
| kubernetes-dashboard.metricsScraper.enabled | bool | `true` | Enable metrics scraper |
| kubernetes-dashboard.metricsScraper.containers.resources.requests.cpu | string | `"10m"` | CPU request for metrics scraper. Actual usage: ~1m |
| kubernetes-dashboard.metricsScraper.containers.resources.requests.memory | string | `"64Mi"` | Memory request for metrics scraper. Actual usage: ~14Mi |
| kubernetes-dashboard.metricsScraper.containers.resources.limits.cpu | string | `"100m"` | CPU limit for metrics scraper |
| kubernetes-dashboard.metricsScraper.containers.resources.limits.memory | string | `"256Mi"` | Memory limit for metrics scraper |
| kubernetes-dashboard.kong.enabled | bool | `true` | Enable Kong gateway |
| kubernetes-dashboard.kong.resources.requests.cpu | string | `"50m"` | CPU request for Kong. Actual usage: ~2m |
| kubernetes-dashboard.kong.resources.requests.memory | string | `"181Mi"` | Memory request for Kong. Actual usage: ~133Mi |
| kubernetes-dashboard.kong.resources.limits.cpu | string | `"100m"` | CPU limit for Kong |
| kubernetes-dashboard.kong.resources.limits.memory | string | `"256Mi"` | Memory limit for Kong |
| kubernetes-dashboard.metrics-server.enabled | bool | `false` | Disable metrics-server (use cluster-wide instance) |
| kubernetes-dashboard.cert-manager.enabled | bool | `false` | Disable cert-manager (use cluster-wide instance) |
| kubernetes-dashboard.nginx.enabled | bool | `false` | Disable nginx ingress (use cluster-wide instance) |

## Installation

### Prerequisites

- Kubernetes 1.21+
- Helm 3.0+

### Install Chart
```bash
# Add the repository (if not already added)
helm repo add radar https://radar-base.github.io/radar-helm-charts/
helm repo update

# Install the chart
helm upgrade --install kubernetes-dashboard radar/kubernetes-dashboard \
  -n kubernetes-dashboard \
  --create-namespace
```

### Upgrade Existing Installation
```bash
# Upgrade with custom values
helm upgrade --install kubernetes-dashboard ./kubernetes-dashboard \
  -f ./kubernetes-dashboard/values.yaml \
  -n kubernetes-dashboard
```

## Resource Allocation Summary

Based on actual usage monitoring (Jan 2026):

| Component | Actual Usage | Requests | Limits | Headroom |
|-----------|--------------|----------|--------|----------|
| auth | 1m CPU, 7Mi mem | 10m, 64Mi | 100m, 256Mi | 10x / 9x |
| api | 1m CPU, 10Mi mem | 10m, 64Mi | 100m, 256Mi | 10x / 6x |
| web | 1m CPU, 7Mi mem | 10m, 64Mi | 100m, 256Mi | 10x / 9x |
| metrics-scraper | 1m CPU, 14Mi mem | 10m, 64Mi | 100m, 256Mi | 10x / 4.5x |
| kong | 2m CPU, 133Mi mem | 50m, 181Mi | 100m, 256Mi | 25x / 1.4x |
| **Total** | **6m, 171Mi** | **90m, 437Mi** | **500m, 1280Mi** | **Good** |

The configuration provides appropriate headroom while being conservative with cluster resources.

## Uninstall
```bash
helm uninstall kubernetes-dashboard -n kubernetes-dashboard
```
