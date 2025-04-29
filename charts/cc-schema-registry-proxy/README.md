

# cc-schema-registry-proxy
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/cc-schema-registry-proxy)](https://artifacthub.io/packages/helm/radar-base/cc-schema-registry-proxy)

![Version: 0.4.2](https://img.shields.io/badge/Version-0.4.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0](https://img.shields.io/badge/AppVersion-1.0-informational?style=flat-square)

A Helm chart for Confluent Cloud schema registry proxy. This proxy service is used when RADAR-base platform is used with Confluent Cloud based schema registry. It forwards requests to schema registry with an additional basic authentication header with Confluent Cloud schema registry credentials. This service will be enabled if `cc.enabled = true`.

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/cc-schema-registry-proxy>

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
| replicaCount | int | `1` | Number of cc-schema-registry-proxy replicas to deploy |
| service.type | string | `"ExternalName"` | Kubernetes Service type, |
| service.externalName | string | `"schema-registry-domain"` | Domain name used for pointing to actual schema registry instance |
| service.port | int | `443` | Port number to connect to Confluent platform |
| disable_tls | bool | `false` | Reconfigure Ingress to not force TLS |
| ingress.enabled | bool | `true` | Enable ingress controller resource |
| ingress.annotations | object | check values.yaml | Annotations that define default ingress class, certificate issuer |
| ingress.path | string | `"/schema/?(.*)"` | Path within the url structure |
| ingress.pathType | string | `"ImplementationSpecific"` | Ingress Path type |
| ingress.ingressClassName | string | `"nginx"` | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+) |
| ingress.hosts | list | `["localhost"]` | Hosts to accept requests from |
| ingress.tls.secretName | string | `"radar-base-tls"` | TLS Secret Name |
| cc.schemaRegistryApiKey | string | `"srApiKey"` | Confluent cloud schema registry API key |
| cc.schemaRegistryApiSecret | string | `"srApiSecret"` | Confluent cloud schema registry API secret |
