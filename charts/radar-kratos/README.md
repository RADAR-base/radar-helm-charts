

# radar-kratos

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.1.0](https://img.shields.io/badge/AppVersion-v1.1.0-informational?style=flat-square)

A ORY Kratos Helm chart for RADAR-base. ORY Kratos is a cloud native Identity and User Management system.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../external/kratos | kratos | 0.43.1 |
| https://radar-base.github.io/radar-helm-charts | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| kratos.ingress.admin.enabled | bool | `true` |  |
| kratos.ingress.admin.className | string | `"nginx"` |  |
| kratos.ingress.admin.annotations."cert-manager.io/cluster-issuer" | string | `"letsencrypt-prod"` |  |
| kratos.ingress.admin.hosts[0].host | string | `"localhost"` |  |
| kratos.ingress.admin.hosts[0].paths[0].path | string | `"/admin/kratos/?(.*)"` |  |
| kratos.ingress.admin.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| kratos.ingress.admin.tls[0].secretName | string | `"radar-base-tls"` |  |
| kratos.ingress.admin.tls[0].hosts[0] | string | `"localhost"` |  |
| kratos.ingress.public.enabled | bool | `true` |  |
| kratos.ingress.public.className | string | `"nginx"` |  |
| kratos.ingress.public.annotations."nginx.ingress.kubernetes.io/rewrite-target" | string | `"/$1"` |  |
| kratos.ingress.public.annotations."cert-manager.io/cluster-issuer" | string | `"letsencrypt-prod"` |  |
| kratos.ingress.public.hosts[0].host | string | `"localhost"` |  |
| kratos.ingress.public.hosts[0].paths[0].path | string | `"/kratos/?(.*)"` |  |
| kratos.ingress.public.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| kratos.ingress.public.tls[0].secretName | string | `"kratos-public-tls"` |  |
| kratos.ingress.public.tls[0].hosts[0] | string | `"localhost"` |  |
| kratos.kratos.automigration | object | `{"enabled":true}` | Enables database migration |
| kratos.kratos.identitySchemas | object | `{"identity.default.schema.json":"{\n  \"$schema\": \"http://json-schema.org/draft-07/schema#\",\n  \"$id\": \"default\",\n  \"title\": \"user\",\n  \"type\": \"object\",\n  \"properties\": {\n    \"traits\": {\n      \"type\": \"object\",\n      \"properties\": {\n        \"email\": {\n          \"type\": \"string\",\n          \"format\": \"email\",\n          \"title\": \"E-Mail\",\n          \"minLength\": 5,\n          \"ory.sh/kratos\": {\n            \"credentials\": {\n              \"password\": {\n                \"identifier\": true\n              },\n              \"totp\": {fff\n                \"account_name\": true\n              }\n            },\n            \"verification\": {\n              \"via\": \"email\"\n            },\n            \"recovery\": {\n              \"via\": \"email\"\n            }\n          }\n        }\n      },\n      \"required\": [ \"email\" ]\n    }\n  },\n  \"additionalProperties\": false\n}\n","identity.user.schema.json":"{\n  \"$schema\": \"http://json-schema.org/draft-07/schema#\",\n  \"$id\": \"user\",\n  \"title\": \"user\",\n  \"type\": \"object\",\n  \"properties\": {\n    \"traits\": {\n      \"type\": \"object\",\n      \"properties\": {\n        \"email\": {\n          \"type\": \"string\",\n          \"format\": \"email\",\n          \"title\": \"E-Mail\",\n          \"minLength\": 5,\n          \"ory.sh/kratos\": {\n            \"credentials\": {\n              \"password\": {\n                \"identifier\": true\n              },\n              \"totp\": {\n                \"account_name\": true\n              }\n            },\n            \"verification\": {\n              \"via\": \"email\"\n            },\n            \"recovery\": {\n              \"via\": \"email\"\n            }\n          }\n        }\n      },\n      \"required\": [ \"email\" ]\n    }\n  },\n  \"additionalProperties\": false\n}\n"}` | You can add multiple identity schemas here. You can pass JSON schema using `--set-file` Helm CLI argument. |
| kratos.kratos.config.dsn | string | `nil` |  |
| kratos.kratos.config.session.lifespan | string | `"24h"` |  |
| kratos.kratos.config.session.cookie.persistent | bool | `false` |  |
| kratos.kratos.config.courier.smtp.from_address | string | `"radar@thehyve.nl"` |  |
| kratos.kratos.config.serve.public.base_url | string | `"https://localhost/kratos/"` |  |
| kratos.kratos.config.serve.public.cors.enabled | bool | `true` |  |
| kratos.kratos.config.serve.public.cors.allowed_origins[0] | string | `"https://localhost/kratos-ui/"` |  |
| kratos.kratos.config.serve.public.cors.allowed_methods[0] | string | `"POST"` |  |
| kratos.kratos.config.serve.public.cors.allowed_methods[1] | string | `"GET"` |  |
| kratos.kratos.config.serve.public.cors.allowed_methods[2] | string | `"PUT"` |  |
| kratos.kratos.config.serve.public.cors.allowed_methods[3] | string | `"PATCH"` |  |
| kratos.kratos.config.serve.public.cors.allowed_methods[4] | string | `"DELETE"` |  |
| kratos.kratos.config.serve.public.cors.allowed_headers[0] | string | `"Authorization"` |  |
| kratos.kratos.config.serve.public.cors.allowed_headers[1] | string | `"Cookie"` |  |
| kratos.kratos.config.serve.public.cors.allowed_headers[2] | string | `"Content-Type"` |  |
| kratos.kratos.config.serve.public.cors.allowed_headers[3] | string | `"Accept"` |  |
| kratos.kratos.config.serve.public.cors.exposed_headers[0] | string | `"Content-Type"` |  |
| kratos.kratos.config.serve.public.cors.exposed_headers[1] | string | `"Set-Cookie"` |  |
| kratos.kratos.config.serve.public.cors.exposed_headers[2] | string | `"Accept"` |  |
| kratos.kratos.config.serve.public.cors.allow_credentials | bool | `true` |  |
| kratos.kratos.config.serve.admin.base_url | string | `"https://localhost/admin/kratos/"` |  |
| kratos.kratos.config.selfservice.default_browser_return_url | string | `"https://localhost/managementportal"` |  |
| kratos.kratos.config.selfservice.allowed_return_urls[0] | string | `"https://localhost/"` |  |
| kratos.kratos.config.selfservice.allowed_return_urls[1] | string | `"http://localhost/"` |  |
| kratos.kratos.config.selfservice.methods.password.config.haveibeenpwned_enabled | bool | `true` |  |
| kratos.kratos.config.selfservice.methods.password.config.max_breaches | int | `0` |  |
| kratos.kratos.config.selfservice.methods.password.config.ignore_network_errors | bool | `false` |  |
| kratos.kratos.config.selfservice.methods.password.config.min_password_length | int | `12` |  |
| kratos.kratos.config.selfservice.methods.password.config.identifier_similarity_check_enabled | bool | `true` |  |
| kratos.kratos.config.selfservice.methods.password.enabled | bool | `true` |  |
| kratos.kratos.config.selfservice.methods.totp.config.issuer | string | `"Radar"` |  |
| kratos.kratos.config.selfservice.methods.totp.enabled | bool | `true` |  |
| kratos.kratos.config.selfservice.methods.link.enabled | bool | `true` |  |
| kratos.kratos.config.selfservice.flows.error.ui_url | string | `"https://localhost/kratos-ui/error"` |  |
| kratos.kratos.config.selfservice.flows.settings.ui_url | string | `"https://localhost/kratos-ui/settings"` |  |
| kratos.kratos.config.selfservice.flows.settings.required_aal | string | `"highest_available"` |  |
| kratos.kratos.config.selfservice.flows.recovery.enabled | bool | `true` |  |
| kratos.kratos.config.selfservice.flows.recovery.ui_url | string | `"https://localhost/kratos-ui/recovery"` |  |
| kratos.kratos.config.selfservice.flows.recovery.use | string | `"link"` |  |
| kratos.kratos.config.selfservice.flows.verification.ui_url | string | `"https://localhost/kratos-ui/verification"` |  |
| kratos.kratos.config.selfservice.flows.verification.enabled | bool | `false` |  |
| kratos.kratos.config.selfservice.flows.verification.use | string | `"link"` |  |
| kratos.kratos.config.selfservice.flows.verification.after.default_browser_return_url | string | `"https://localhost/kratos-ui"` |  |
| kratos.kratos.config.selfservice.flows.logout.after.default_browser_return_url | string | `"https://localhost/kratos-ui/login"` |  |
| kratos.kratos.config.selfservice.flows.login.ui_url | string | `"https://localhost/kratos-ui/login"` |  |
| kratos.kratos.config.selfservice.flows.registration.ui_url | string | `"https://localhost/kratos-ui/registration"` |  |
| kratos.kratos.config.selfservice.flows.registration.after.password.hooks[0].hook | string | `"session"` |  |
| kratos.kratos.config.selfservice.flows.registration.after.oidc.hooks[0].hook | string | `"session"` |  |
| kratos.kratos.config.identity.default_schema_id | string | `"user"` |  |
| kratos.kratos.config.identity.schemas[0].id | string | `"user"` |  |
| kratos.kratos.config.identity.schemas[0].url | string | `"file:///etc/config/identity.user.schema.json"` |  |
| kratos.kratos.config.log.level | string | `"debug"` |  |
| kratos.kratos.config.log.format | string | `"text"` |  |
| kratos.kratos.config.log.leak_sensitive_values | bool | `true` |  |
| kratos.deployment.extraEnv[0].name | string | `"DSN"` |  |
| kratos.deployment.extraEnv[0].valueFrom.secretKeyRef.name | string | `"cn-postgresql-kratos"` |  |
| kratos.deployment.extraEnv[0].valueFrom.secretKeyRef.key | string | `"uri"` |  |
| kratos.statefulSet.extraEnv[0].name | string | `"DSN"` |  |
| kratos.statefulSet.extraEnv[0].valueFrom.secretKeyRef.name | string | `"cn-postgresql-kratos"` |  |
| kratos.statefulSet.extraEnv[0].valueFrom.secretKeyRef.key | string | `"uri"` |  |
| kratos.job.extraEnv[0].name | string | `"DSN"` |  |
| kratos.job.extraEnv[0].valueFrom.secretKeyRef.name | string | `"cn-postgresql-kratos"` |  |
| kratos.job.extraEnv[0].valueFrom.secretKeyRef.key | string | `"uri"` |  |
| kratos.cronjob.cleanup.extraEnv[0].name | string | `"DSN"` |  |
| kratos.cronjob.cleanup.extraEnv[0].valueFrom.secretKeyRef.name | string | `"cn-postgresql-kratos"` |  |
| kratos.cronjob.cleanup.extraEnv[0].valueFrom.secretKeyRef.key | string | `"uri"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
