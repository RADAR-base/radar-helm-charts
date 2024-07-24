

# radar-appserver
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-appserver)](https://artifacthub.io/packages/helm/radar-base/radar-appserver)

![Version: 0.4.0](https://img.shields.io/badge/Version-0.4.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.4.1](https://img.shields.io/badge/AppVersion-2.4.1-informational?style=flat-square)

A Helm chart for the backend application of RADAR-base Appserver

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Yatharth Ranjan | <yatharth.ranjan@kcl.ac.uk> | <https://www.kcl.ac.uk/people/yatharth-ranjan> |
| Pauline Conde | <pauline.conde@kcl.ac.uk> | <https://www.kcl.ac.uk/people/pauline-conde> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-appserver>
* <https://github.com/RADAR-base/RADAR-Appserver>

## Prerequisites
* Kubernetes 1.22+
* Kubectl 1.22+
* Helm 3.1.0+

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `2` | Number of radar-appserver replicas to deploy |
| image.repository | string | `"radarbase/radar-appserver"` | radar-appserver image repository |
| image.tag | string | `"2.4.1"` | radar-appserver image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| image.pullPolicy | string | `"IfNotPresent"` | radar-appserver image pull policy |
| imagePullSecrets | list | `[]` | Docker registry secret names as an array |
| nameOverride | string | `""` | String to partially override radar-appserver.fullname template with a string (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override radar-appserver.fullname template with a string |
| podSecurityContext | object | `{}` | Configure radar-appserver pods' Security Context |
| securityContext | object | `{}` | Configure radar-appserver containers' Security Context |
| service.type | string | `"ClusterIP"` | Kubernetes Service type |
| service.port | int | `8080` | radar-appserver port |
| disable_tls | bool | `false` | Disable TLS (reconfigures Ingress and sets URLs to use HTTP) |
| ingress.enabled | bool | `true` | Enable ingress controller resource |
| ingress.annotations | object | check values.yaml | Annotations that define default ingress class, certificate issuer and session configuration |
| ingress.path | string | `"/appserver/?(.*)"` | Path within the url structure |
| ingress.pathType | string | `"ImplementationSpecific"` | Ingress path type |
| ingress.ingressClassName | string | `"nginx"` | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+) |
| ingress.hosts | list | `["localhost"]` | Hosts to accept requests from |
| ingress.tls.secretName | string | `"radar-base-tls-appserver"` | TLS Secret Name |
| resources.requests | object | `{"cpu":"100m","memory":"128Mi"}` | CPU/Memory resource requests |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| tolerations | list | `[]` | Toleration labels for pod assignment |
| affinity | object | `{}` | Affinity labels for pod assignment |
| extraEnvVars | list | `[]` | Extra environment variables |
| customLivenessProbe | object | `{}` | Custom livenessProbe that overrides the default one |
| livenessProbe.enabled | bool | `true` | Enable livenessProbe |
| livenessProbe.initialDelaySeconds | int | `20` | Initial delay seconds for livenessProbe |
| livenessProbe.periodSeconds | int | `60` | Period seconds for livenessProbe |
| livenessProbe.timeoutSeconds | int | `5` | Timeout seconds for livenessProbe |
| livenessProbe.successThreshold | int | `1` | Success threshold for livenessProbe |
| livenessProbe.failureThreshold | int | `3` | Failure threshold for livenessProbe |
| customReadinessProbe | object | `{}` | Custom readinessProbe that overrides the default one |
| readinessProbe.enabled | bool | `true` | Enable readinessProbe |
| readinessProbe.initialDelaySeconds | int | `20` | Initial delay seconds for readinessProbe |
| readinessProbe.periodSeconds | int | `60` | Period seconds for readinessProbe |
| readinessProbe.timeoutSeconds | int | `5` | Timeout seconds for readinessProbe |
| readinessProbe.successThreshold | int | `1` | Success threshold for readinessProbe |
| readinessProbe.failureThreshold | int | `3` | Failure threshold for readinessProbe |
| networkpolicy | object | check `values.yaml` | Network policy defines who can access this application and who this applications has access to |
| postgres.host | string | `"radar-appserver-postgresql"` | host name of the postgres db |
| postgres.port | int | `5432` | post of the postgres db |
| postgres.database | string | `"appserver"` | database name |
| postgres.connection_parameters | string | `""` | additional JDBC connection parameters e.g. sslmode=verify-full |
| postgres.user | string | `"postgres"` | postgres user |
| postgres.password | string | `"password"` | password of the postgres user |
| postgres.ssl.enabled | bool | `false` | set to true of the connecting to postgres using SSL |
| postgres.ssl.keystorepassword | string | `"keystorepassword"` |  |
| radar_admin_user | string | `"radar"` |  |
| radar_admin_password | string | `"radar"` |  |
| managementportal_url | string | `"http://management-portal:8080/managementportal"` | URL of the Management Portal |
| serverName | string | `"localhost"` |  |
| managementportal_resource_name | string | `"res_AppServer"` | radar_is.yml config for token verification |
| public_key_endpoints | string | `nil` |  |
| google_application_credentials | string | `""` | Google credentials containing FCM server key, etc. |
| github_client_token | string | `""` | Github client token which is used for authenticating requests |
| smtp.enabled | bool | `false` | set to true, if sending of notifications via email should be enabled. |
| smtp.host | string | `"smtp"` | Hostname of the SMTP server |
| smtp.port | int | `25` | Port of the SMTP server |
| smtp.username | string | `"username"` | Username of the SMTP server |
| smtp.password | string | `"secret"` | Password of the SMTP server |
| smtp.from | string | `"noreply@example.com"` | Email address which should be used to send activation emails |
| smtp.starttls | bool | `false` | set to true,if TTLS should be enabled |
| smtp.auth | bool | `true` | set to true, if the account should be authenticated before sending emails |
