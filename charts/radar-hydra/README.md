

# radar-hydra
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-hydra)](https://artifacthub.io/packages/helm/radar-base/radar-hydra)

![Version: 0.2.2](https://img.shields.io/badge/Version-0.2.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v2.2.0](https://img.shields.io/badge/AppVersion-v2.2.0-informational?style=flat-square)

A ORY Hydra Helm chart for RADAR-base. ORY Hydra is a cloud native Identity and User Management system.

**Homepage:** <https://radar-base.org>

## ORY Hydra

This chart deploys [ORY Hydra](https://www.ory.sh/hydra/) via a dependency to this chart. Configuration to the ORY Hydra chart is passed via the `hydra:` key in the values.yaml file.
Consult the [documentation](https://artifacthub.io/packages/helm/ory/hydra) of the Ory Hydra chart for additional information on how to configure this service if needed.

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-hydra>

## Prerequisites
* Kubernetes 1.28+
* Kubectl 1.28+
* Helm 3.1.0+

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../external/hydra | hydra | 0.53.0 |
| https://radar-base.github.io/radar-helm-charts | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| hydra | object | check `values.yaml` | Ory Hydra configuration |
| hydra.server_name | string | `"localhost"` | Hostname for the Kratos service |
| hydra.advertised_protocol | string | `"https"` | Protocol for the Kratos service (allowed values: http, https) |
| oauth_clients[0].name | string | `"managementportal"` |  |
| oauth_clients[0].redirectUris[0] | string | `"{{ .Values.hydra.advertised_protocol }}://{{ .Values.hydra.server_name }}/managementportal/api/redirect/login"` |  |
| oauth_clients[0].grantTypes[0] | string | `"authorization_code"` |  |
| oauth_clients[0].grantTypes[1] | string | `"refresh_token"` |  |
| oauth_clients[0].responseTypes[0] | string | `"code"` |  |
| oauth_clients[0].responseTypes[1] | string | `"id_token"` |  |
| oauth_clients[0].scope | string | `"SOURCEDATA.CREATE SOURCETYPE.UPDATE SOURCETYPE.DELETE AUTHORITY.UPDATE MEASUREMENT.DELETE PROJECT.READ AUDIT.CREATE USER.DELETE AUTHORITY.DELETE SUBJECT.DELETE MEASUREMENT.UPDATE SOURCEDATA.UPDATE SUBJECT.READ USER.UPDATE SOURCETYPE.CREATE AUTHORITY.READ USER.CREATE SOURCE.CREATE SOURCE.READ SUBJECT.CREATE ROLE.UPDATE ROLE.READ MEASUREMENT.READ PROJECT.UPDATE PROJECT.DELETE ROLE.DELETE SOURCE.DELETE SOURCETYPE.READ ROLE.CREATE SOURCEDATA.DELETE SUBJECT.UPDATE SOURCE.UPDATE PROJECT.CREATE AUDIT.READ MEASUREMENT.CREATE AUDIT.DELETE AUDIT.UPDATE AUTHORITY.CREATE USER.READ SOURCEDATA.READ ORGANIZATION.READ ORGANIZATION.CREATE ORGANIZATION.UPDATE"` |  |
| oauth_clients[0].audience[0] | string | `"res_ManagementPortal"` |  |
| oauth_clients[0].allowed_cors_origins[0] | string | `"http://localhost:3000"` |  |
| oauth_clients[0].skip_consent | bool | `true` |  |
| oauth_clients[0].skip_logout_consent | bool | `false` |  |
