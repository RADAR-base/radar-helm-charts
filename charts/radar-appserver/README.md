

# radar-appserver

![Version: 0.1.2](https://img.shields.io/badge/Version-0.1.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 3.2.0](https://img.shields.io/badge/AppVersion-3.2.0-informational?style=flat-square)

A Helm chart for the backend application of RADAR-base Appserver

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Yatharth Ranjan | <yatharth.ranjan@kcl.ac.uk> | <https://www.kcl.ac.uk/people/yatharth-ranjan> |
| Pauline Conde | <pauline.conde@kcl.ac.uk> | <https://www.kcl.ac.uk/people/pauline-conde> |

## Source Code

* <https://github.com/RADAR-base/RADAR-Appserver>

## Prerequisites
* Kubernetes 1.17+
* Kubectl 1.17+
* Helm 3.1.0+

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `2` | Number of radar-appserver replicas to deploy |
| image.repository | string | `"radarbase/radar-appserver"` | radar-appserver image repository |
| image.tag | string | `"1.3.0"` | radar-appserver image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| image.pullPolicy | string | `"IfNotPresent"` | radar-appserver image pull policy |
| imagePullSecrets | list | `[]` | Docker registry secret names as an array |
| nameOverride | string | `""` | String to partially override radar-appserver.fullname template with a string (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override radar-appserver.fullname template with a string |
| podSecurityContext | object | `{}` | Configure radar-appserver pods' Security Context |
| securityContext | object | `{}` | Configure radar-appserver containers' Security Context |
| service.type | string | `"ClusterIP"` | Kubernetes Service type |
| service.port | int | `8080` | radar-appserver port |
| ingress.enabled | bool | `true` | Enable ingress controller resource |
| ingress.annotations | object | check values.yaml | Annotations that define default ingress class, certificate issuer and session configuration |
| ingress.path | string | `"/appserver/?(.*)"` | Path within the url structure |
| ingress.hosts | list | `["localhost"]` | Hosts to accept requests from |
| ingress.tls.secretName | string | `"radar-base-tls"` | TLS Secret Name |
| resources.requests | object | `{"cpu":"100m","memory":"128Mi"}` | CPU/Memory resource requests |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| tolerations | list | `[]` | Toleration labels for pod assignment |
| affinity | object | `{}` | Affinity labels for pod assignment |
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
| managementportal_host | string | `"management-portal"` | hostname of the Management Portal |
| serverName | string | `"localhost"` |  |
| managementportal_resource_name | string | `"res_AppServer"` | radar_is.yml config for token verification |
| public_key_endpoints | string | `nil` |  |
| google_application_credentials | string | `""` | Google credentials containing FCM server key, etc. |
