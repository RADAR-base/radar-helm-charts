

# radar-upload-connect-backend
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-upload-connect-backend)](https://artifacthub.io/packages/helm/radar-base/radar-upload-connect-backend)

![Version: 0.9.1](https://img.shields.io/badge/Version-0.9.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.6.4](https://img.shields.io/badge/AppVersion-0.6.4-informational?style=flat-square)

A Helm chart for RADAR-base upload connector backend application. This application is an upload system that stores uploaded data and its metadata in PostgreSQL for later processing.

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-upload-connect-backend>
* <https://github.com/RADAR-base/radar-upload-source-connector>

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
| replicaCount | int | `2` | Number of radar-upload-connect-backend replicas to deploy |
| image.registry | string | `"ghcr.io"` | Image registry |
| image.repository | string | `"radar-base/radar-upload-source-connector/radar-upload-connect-backend"` | Image repository |
| image.tag | string | `nil` | Image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| image.digest | string | `""` | Image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.pullSecrets | list | `[]` | Optionally specify an array of imagePullSecrets. Secrets must be manually created in the namespace. e.g: pullSecrets:   - myRegistryKeySecretName  |
| nameOverride | string | `""` | String to partially override radar-upload-connect-backend.fullname template with a string (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override radar-upload-connect-backend.fullname template with a string |
| podSecurityContext | object | `{}` | Configure radar-upload-connect-backend pods' Security Context |
| securityContext | object | `{}` | Configure radar-upload-connect-backend containers' Security Context |
| service.type | string | `"ClusterIP"` | Kubernetes Service type |
| service.port | int | `8085` | radar-upload-connect-backend port |
| disable_tls | bool | `false` | Reconfigure Ingress to not force TLS |
| advertised_protocol | string | `"https"` | The protocol in advertised URIs (https, http) |
| ingress.enabled | bool | `true` | Enable ingress controller resource |
| ingress.annotations | object | check values.yaml | Annotations that define default ingress class, certificate issuer and proxy settings |
| ingress.path | string | `"/upload/api/?(.*)"` | Path within the url structure |
| ingress.pathType | string | `"ImplementationSpecific"` | Ingress Path type |
| ingress.ingressClassName | string | `"nginx"` | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+) |
| ingress.hosts | list | `["localhost"]` | Host to listen to requests to |
| ingress.tls.secretName | string | `"radar-base-tls"` | Name of the secret containing TLS certificates |
| resources.requests | object | `{"cpu":"100m","memory":"2Gi"}` | CPU/Memory resource requests |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| tolerations | list | `[]` | Toleration labels for pod assignment |
| affinity | object | `{}` | Affinity labels for pod assignment |
| extraEnvVars | list | `[]` | Extra environment variables |
| customLivenessProbe | object | `{}` | Custom livenessProbe that overrides the default one |
| livenessProbe.enabled | bool | `true` | Enable livenessProbe |
| livenessProbe.initialDelaySeconds | int | `5` | Initial delay seconds for livenessProbe |
| livenessProbe.periodSeconds | int | `30` | Period seconds for livenessProbe |
| livenessProbe.timeoutSeconds | int | `5` | Timeout seconds for livenessProbe |
| livenessProbe.successThreshold | int | `1` | Success threshold for livenessProbe |
| livenessProbe.failureThreshold | int | `3` | Failure threshold for livenessProbe |
| customReadinessProbe | object | `{}` | Custom readinessProbe that overrides the default one |
| readinessProbe.enabled | bool | `true` | Enable readinessProbe |
| readinessProbe.initialDelaySeconds | int | `5` | Initial delay seconds for readinessProbe |
| readinessProbe.periodSeconds | int | `10` | Period seconds for readinessProbe |
| readinessProbe.timeoutSeconds | int | `5` | Timeout seconds for readinessProbe |
| readinessProbe.successThreshold | int | `1` | Success threshold for readinessProbe |
| readinessProbe.failureThreshold | int | `3` | Failure threshold for readinessProbe |
| customStartupProbe | object | `{}` | Custom startupProbe that overrides the default one |
| startupProbe.enabled | bool | `true` | Enable startupProbe |
| startupProbe.initialDelaySeconds | int | `5` | Initial delay seconds for startupProbe |
| startupProbe.periodSeconds | int | `10` | Period seconds for startupProbe |
| startupProbe.timeoutSeconds | int | `10` | Timeout seconds for startupProbe |
| startupProbe.successThreshold | int | `1` | Success threshold for startupProbe |
| startupProbe.failureThreshold | int | `30` | Failure threshold for startupProbe |
| networkpolicy | object | check `values.yaml` | Network policy defines who can access this application and who this applications has access to |
| client_id | string | `"radar_upload_backend"` | OAuth2 client id of the upload connect backend application |
| client_secret | string | `"secret"` | OAuth2 client secret of the upload connect backend |
| postgres.host | string | `nil` | Host name of the database to store uploaded data and metadata |
| postgres.database | string | `nil` | Database name |
| postgres.port | string | `nil` |  |
| postgres.urlSecret | object | `{"key":"jdbc-uri","name":"radar-cloudnative-postgresql-uploadconnector"}` | Kubernetes secret containing the database JDBC Connection url (disables use of 'host', 'port' and 'database' values). |
| postgres.user | string | `nil` | Database username |
| postgres.userSecret | object | `{"key":"username","name":"radar-cloudnative-postgresql-uploadconnector"}` | Kubernetes secret containing the database username (disables use of 'user' value). |
| postgres.password | string | `nil` | Database password |
| postgres.passwordSecret | object | `{"key":"password","name":"radar-cloudnative-postgresql-uploadconnector"}` | Kubernetes secret containing the database password (disables use of 'password' value). |
| postgres.parameters | string | `nil` | Additional JDBC connection parameters e.g. sslmode=verify-full  Ignored when using 'urlSecret'. |
| managementportal_url | string | `"http://management-portal:8080/managementportal"` | URL of the Management Portal |
| serverName | string | `"localhost"` | Server name or domain name |
