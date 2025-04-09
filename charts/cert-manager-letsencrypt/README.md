

# cert-manager-letsencrypt
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/cert-manager-letsencrypt)](https://artifacthub.io/packages/helm/radar-base/cert-manager-letsencrypt)

![Version: 0.2.1](https://img.shields.io/badge/Version-0.2.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0](https://img.shields.io/badge/AppVersion-1.0-informational?style=flat-square)

A Helm chart for a cert-manager ClusterIssuer for letsencrypt. Requires the cert-manager release to be activated.

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/cert-manager-letsencrypt>

## Prerequisites
* Kubernetes 1.28+
* Kubectl 1.28+
* Helm 3.1.0+

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://radar-base.github.io/radar-helm-charts | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| nameOverride | string | `"letsencrypt-prod"` | Name of the cluster issuer |
| fullnameOverride | string | `"letsencrypt-prod"` | Full name of the cluster issuer |
| namespaceOverride | string | `"cert-manager"` | String to fully override common.names.namespace |
| maintainerEmail | string | `"me@example.com"` | Email address of cluster maintainer |
| httpIssuer.enabled | bool | `true` | Enable the letsencrypt HTTP issuer |
| httpIssuer.environment | string | `"production"` | Environment to use. Either staging or production |
| httpIssuer.privateSecretRef | string | `"letsencrypt-prod"` | Secret to store letsencrypt certificate data in |
| httpIssuer.ingressMatchMethod | string | `"class"` | How to match ingress that's supposed to be used. Can be class, ingressClassName, name |
| httpIssuer.ingressMatchValue | string | `"nginx"` | Ingress class/name to use |
