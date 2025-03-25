

# radar-kratos
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-kratos)](https://artifacthub.io/packages/helm/radar-base/radar-kratos)

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.1.0](https://img.shields.io/badge/AppVersion-v1.1.0-informational?style=flat-square)

A ORY Kratos Helm chart for RADAR-base. ORY Kratos is a cloud native Identity and User Management system.

## Ory Kratos

This chart deploys Ory Kratos that via a dependency to this chart. Configuration to the Ory Kratos chart is passed via the `kratos:` key in the values.yaml file.
Consult the [documentation](https://artifacthub.io/packages/helm/ory/kratos) of the Ory Kratos chart for more information on how to configure this service.

## Prerequisites
* Kubernetes 1.28+
* Kubectl 1.28+
* Helm 3.1.0+

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://k8s.ory.sh/helm/charts | kratos | 0.43.1 |
| https://radar-base.github.io/radar-helm-charts | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| kratos | object | check `values.yaml` | Ory Kratos configuration |
| kratos.kratos.automigration | object | `{"enabled":true}` | Enables database migration |
| kratos.kratos.identitySchemas | object | `{"identity.default.schema.json":"{\n  \"$schema\": \"http://json-schema.org/draft-07/schema#\",\n  \"$id\": \"default\",\n  \"title\": \"user\",\n  \"type\": \"object\",\n  \"properties\": {\n    \"traits\": {\n      \"type\": \"object\",\n      \"properties\": {\n        \"email\": {\n          \"type\": \"string\",\n          \"format\": \"email\",\n          \"title\": \"E-Mail\",\n          \"minLength\": 5,\n          \"ory.sh/kratos\": {\n            \"credentials\": {\n              \"password\": {\n                \"identifier\": true\n              },\n              \"totp\": {fff\n                \"account_name\": true\n              }\n            },\n            \"verification\": {\n              \"via\": \"email\"\n            },\n            \"recovery\": {\n              \"via\": \"email\"\n            }\n          }\n        }\n      },\n      \"required\": [ \"email\" ]\n    }\n  },\n  \"additionalProperties\": false\n}\n","identity.user.schema.json":"{\n  \"$schema\": \"http://json-schema.org/draft-07/schema#\",\n  \"$id\": \"user\",\n  \"title\": \"user\",\n  \"type\": \"object\",\n  \"properties\": {\n    \"traits\": {\n      \"type\": \"object\",\n      \"properties\": {\n        \"email\": {\n          \"type\": \"string\",\n          \"format\": \"email\",\n          \"title\": \"E-Mail\",\n          \"minLength\": 5,\n          \"ory.sh/kratos\": {\n            \"credentials\": {\n              \"password\": {\n                \"identifier\": true\n              },\n              \"totp\": {\n                \"account_name\": true\n              }\n            },\n            \"verification\": {\n              \"via\": \"email\"\n            },\n            \"recovery\": {\n              \"via\": \"email\"\n            }\n          }\n        }\n      },\n      \"required\": [ \"email\" ]\n    }\n  },\n  \"additionalProperties\": false\n}\n"}` | You can add multiple identity schemas here. You can pass JSON schema using `--set-file` Helm CLI argument. |
