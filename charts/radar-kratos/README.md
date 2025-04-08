

# kratos
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/kratos)](https://artifacthub.io/packages/helm/radar-base/kratos)

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v2.2.0](https://img.shields.io/badge/AppVersion-v2.2.0-informational?style=flat-square)

A ORY Kratos Helm chart for RADAR-base. ORY Kratos is a cloud native Identity and User Management system.

**Homepage:** <https://radar-base.org>

## ORY Kratos

This chart deploys [ORY Kratos](https://www.ory.sh/kratos/) via a dependency to this chart. Configuration to the ORY Kratos chart is passed via the `Kratos:` key in the values.yaml file.
Consult the [documentation](https://artifacthub.io/packages/helm/ory/kratos) of the Ory Kratos chart for additional information on how to configure this service if needed.

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-kratos>

## Prerequisites
* Kubernetes 1.28+
* Kubectl 1.28+
* Helm 3.1.0+

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../external/kratos | kratos | 0.52.1 |
| https://radar-base.github.io/radar-helm-charts | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| kratos | object | check `values.yaml` | Ory Kratos configuration |
| kratos.server_name | string | `"localhost"` | Hostname for the Kratos service |
| kratos.advertised_protocol | string | `"https"` | Protocol for the Kratos service (allowed values: http, https) |
| kratos.kratos.automigration | object | `{"enabled":true}` | Enables database migration |
| kratos.kratos.identitySchemas | object | `{"identity.default.schema.json":"{\n  \"$schema\": \"http://json-schema.org/draft-07/schema#\",\n  \"$id\": \"default\",\n  \"title\": \"user\",\n  \"type\": \"object\",\n  \"properties\": {\n    \"traits\": {\n      \"type\": \"object\",\n      \"properties\": {\n        \"email\": {\n          \"type\": \"string\",\n          \"format\": \"email\",\n          \"title\": \"E-Mail\",\n          \"minLength\": 5,\n          \"ory.sh/kratos\": {\n            \"credentials\": {\n              \"password\": {\n                \"identifier\": true\n              },\n              \"totp\": {\n                \"account_name\": true\n              }\n            },\n            \"verification\": {\n              \"via\": \"email\"\n            },\n            \"recovery\": {\n              \"via\": \"email\"\n            }\n          }\n        }\n      },\n      \"required\": [ \"email\" ]\n    }\n  },\n  \"additionalProperties\": false\n}\n","identity.user.schema.json":"{\n  \"$schema\": \"http://json-schema.org/draft-07/schema#\",\n  \"$id\": \"user\",\n  \"title\": \"user\",\n  \"type\": \"object\",\n  \"properties\": {\n    \"traits\": {\n      \"type\": \"object\",\n      \"properties\": {\n        \"email\": {\n          \"type\": \"string\",\n          \"format\": \"email\",\n          \"title\": \"E-Mail\",\n          \"minLength\": 5,\n          \"ory.sh/kratos\": {\n            \"credentials\": {\n              \"password\": {\n                \"identifier\": true\n              },\n              \"totp\": {\n                \"account_name\": true\n              }\n            },\n            \"verification\": {\n              \"via\": \"email\"\n            },\n            \"recovery\": {\n              \"via\": \"email\"\n            }\n          }\n        }\n      },\n      \"required\": [ \"email\" ]\n    }\n  },\n  \"additionalProperties\": false\n}\n"}` | You can add multiple identity schemas here. You can pass JSON schema using `--set-file` Helm CLI argument. |
