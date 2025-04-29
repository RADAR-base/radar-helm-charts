

# app-config
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/app-config)](https://artifacthub.io/packages/helm/radar-base/app-config)

![Version: 1.5.1](https://img.shields.io/badge/Version-1.5.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.5.2](https://img.shields.io/badge/AppVersion-0.5.2-informational?style=flat-square)

A Helm chart for RADAR-base application config (app-config) backend service which is used as mobile app configuration engine with per-project and per-user configuration.

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/app-config>
* <https://github.com/RADAR-base/radar-app-config>

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
| replicaCount | int | `2` | Number of Appconfig replicas to deploy |
| image.registry | string | `"docker.io"` | Image registry |
| image.repository | string | `"radarbase/radar-app-config"` | Image repository |
| image.tag | string | `nil` | Image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| image.digest | string | `""` | Image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.pullSecrets | list | `[]` | Optionally specify an array of imagePullSecrets. Secrets must be manually created in the namespace. e.g: pullSecrets:   - myRegistryKeySecretName  |
| nameOverride | string | `""` | String to partially override appconfig.fullname template with a string (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override appconfig.fullname template with a string |
| namespace | string | `"default"` | Kubernetes namespace that Appconfig is going to be deployed on |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `nil` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| podSecurityContext | object | `{}` | Configure Appconfig pods' Security Context |
| securityContext | object | `{}` | Configure Appconfig containers' Security Context |
| service.type | string | `"ClusterIP"` | Kubernetes Service type |
| service.port | int | `8090` | Appconfig port |
| disable_tls | bool | `false` | Reconfigure Ingress to not force TLS |
| ingress.enabled | bool | `true` | Enable ingress controller resource |
| ingress.annotations | object | check values.yaml | Annotations that define default ingress class, certificate issuer |
| ingress.path | string | `"/appconfig/api"` | Path within the url structure |
| ingress.pathType | string | `"ImplementationSpecific"` | Ingress Path type |
| ingress.ingressClassName | string | `"nginx"` | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+) |
| ingress.hosts | list | `["localhost"]` | Hosts to accept requests from |
| ingress.tls.secretName | string | `"radar-base-tls"` | TLS Secret Name |
| resources.limits | object | `{"cpu":2}` | CPU/Memory resource limits |
| resources.requests | object | `{"cpu":"100m","memory":"768Mi"}` | CPU/Memory resource requests |
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
| javaOpts | string | `"-Xmx550m"` | Standard JAVA_OPTS that should be passed to this service |
| clientId | string | `"radar_appconfig"` | OAuth2 client id |
| clientSecret | string | `"secret"` | OAuth2 client secret |
| managementportal_url | string | `"http://management-portal:8080/managementportal"` | URL of the Management Portal |
| jdbc.url | string | `nil` | JDBC Connection url of the database. |
| jdbc.urlSecret | object | `{"key":"jdbc-uri","name":"radar-cloudnative-postgresql-appconfig"}` | Kubernetes secret containing the database JDBC Connection url (disables use of 'url' value). |
| jdbc.user | string | `nil` | Username of the database |
| jdbc.userSecret | object | `{"key":"username","name":"radar-cloudnative-postgresql-appconfig"}` | Kubernetes secret containing the database username (disables use of 'user' value). |
| jdbc.password | string | `nil` | Password of the user |
| jdbc.passwordSecret | object | `{"key":"password","name":"radar-cloudnative-postgresql-appconfig"}` | Kubernetes secret containing the database password (disables use of 'password' value). |
| jdbc.parameters | string | `nil` | Additional JDBC connection parameters e.g. sslmode=verify-full Ignored when using 'urlSecret'. |
| jdbc.driver | string | `"org.postgresql.Driver"` | JDBC Driver to connect to the database. |
| jdbc.dialect | string | `"org.hibernate.dialect.PostgreSQLDialect"` |  |
