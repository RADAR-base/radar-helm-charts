

# cert-manager-letsencrypt

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0](https://img.shields.io/badge/AppVersion-1.0-informational?style=flat-square)

A Helm chart for a cert-manager ClusterIssuer for letsencrypt. Requires the cert-manager release to be activated.

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Keyvan Hedayati | <keyvan@thehyve.nl> | <https://www.thehyve.nl> |
| Joris Borgdorff | <joris@thehyve.nl> | <https://www.thehyve.nl/experts/joris-borgdorff> |
| Nivethika Mahasivam | <nivethika@thehyve.nl> | <https://www.thehyve.nl/experts/nivethika-mahasivam> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/cert-manager-letsencrypt>

## Prerequisites
* Kubernetes 1.17+
* Kubectl 1.17+
* Helm 3.1.0+

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| fullnameOverride | string | `"letsencrypt-prod"` | Full name of the cluster issuer |
| maintainerEmail | string | `"me@example.com"` | Email address of cluster maintainer |
| httpIssuer.enabled | bool | `true` | Enable the letsencrypt HTTP issuer |
| httpIssuer.environment | string | `"production"` | Environment to use. Either staging or production |
| httpIssuer.privateSecretRef | string | `"letsencrypt-prod"` | Secret to store letsencrypt certificate data in |
