

# radar-rest-sources-authorizer
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-rest-sources-authorizer)](https://artifacthub.io/packages/helm/radar-base/radar-rest-sources-authorizer)

![Version: 2.3.0](https://img.shields.io/badge/Version-2.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 4.4.8](https://img.shields.io/badge/AppVersion-4.4.8-informational?style=flat-square)

A Helm chart for the front-end application of RADAR-base Rest Sources Authorizer which is a portal to authorize the Fitbit connector to read data from Fitbit accounts.

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-rest-sources-authorizer>
* <https://github.com/RADAR-base/RADAR-Rest-Source-Auth>

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
| replicaCount | int | `2` | Number of radar-rest-sources-authorizer replicas to deploy |
| image.registry | string | `"docker.io"` | Image registry |
| image.repository | string | `"radarbase/radar-rest-source-authorizer"` | Image repository |
| image.tag | string | `nil` | Image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| image.digest | string | `""` | Image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.pullSecrets | list | `[]` | Optionally specify an array of imagePullSecrets. Secrets must be manually created in the namespace. e.g: pullSecrets:   - myRegistryKeySecretName  |
| nameOverride | string | `""` | String to partially override radar-rest-sources-authorizer.fullname template with a string (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override radar-rest-sources-authorizer.fullname template with a string |
| podSecurityContext | object | `{}` | Configure radar-rest-sources-authorizer pods' Security Context |
| securityContext | object | `{}` | Configure radar-rest-sources-authorizer containers' Security Context |
| service.type | string | `"ClusterIP"` | Kubernetes Service type |
| service.port | int | `8080` | radar-rest-sources-authorizer port |
| disable_tls | bool | `false` | Reconfigure Ingress to not force TLS |
| advertised_protocol | string | `"https"` | The protocol in advertised URIs (https, http) |
| ingress.enabled | bool | `true` | Enable ingress controller resource |
| ingress.annotations | object | check values.yaml | Annotations that define default ingress class, certificate issuer |
| ingress.path | string | `"/rest-sources/authorizer"` | Path within the url structure |
| ingress.pathType | string | `"ImplementationSpecific"` | Ingress Path type |
| ingress.ingressClassName | string | `"nginx"` | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+) |
| ingress.hosts | list | `["localhost"]` | Hosts to accept requests from |
| ingress.tls.secretName | string | `"radar-base-tls"` | TLS Secret Name |
| resources.requests | object | `{"cpu":"100m","memory":"128Mi"}` | CPU/Memory resource requests |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| tolerations | list | `[]` | Toleration labels for pod assignment |
| affinity | object | `{}` | Affinity labels for pod assignment |
| extraEnvVars | list | `[]` | Extra environment variables |
| customLivenessProbe | object | `{}` | Custom livenessProbe that overrides the default one |
| livenessProbe.enabled | bool | `true` | Enable livenessProbe |
| livenessProbe.initialDelaySeconds | int | `5` | Initial delay seconds for livenessProbe |
| livenessProbe.periodSeconds | int | `30` | Period seconds for livenessProbe |
| livenessProbe.timeoutSeconds | int | `3` | Timeout seconds for livenessProbe |
| livenessProbe.successThreshold | int | `1` | Success threshold for livenessProbe |
| livenessProbe.failureThreshold | int | `3` | Failure threshold for livenessProbe |
| customReadinessProbe | object | `{}` | Custom readinessProbe that overrides the default one |
| readinessProbe.enabled | bool | `true` | Enable readinessProbe |
| readinessProbe.initialDelaySeconds | int | `5` | Initial delay seconds for readinessProbe |
| readinessProbe.periodSeconds | int | `10` | Period seconds for readinessProbe |
| readinessProbe.timeoutSeconds | int | `3` | Timeout seconds for readinessProbe |
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
| clientId | string | `"radar_rest_sources_authorizer"` | OAuth2 client id of the application registered in Management Portal. It is assumed that this is a public client with empty client secret. |
| serverName | string | `"localhost"` | Domain name of the server |
| authUrl | string | `nil` | Authorization URL of the IDP (overrides the default value derived from the serverName) |
| authPath | string | `"/auth"` | Authorization path appended to the authUrl of the IDP (/auth for Hydra, /authorize for MP) |
| sentry.dsn | string | `nil` | DSN (Data Source Name) of the sentry server |
| sentry.level | string | `"ERROR"` | Log level for sentry (TRACE, DEBUG, INFO, WARN, or ERROR) |
| sentry.service.name | string | `nil` | Name of the service to be displayed in the sentry dashboard |
| sentry.service.release | string | `nil` | App version to be displayed in the sentry dashboard |
| sentry.service.environment | string | `"production"` | Environment of the sentry service |
| sentry.stacktrace.enabled | bool | `true` | Set to true, if stack trace should be enabled |
| sentry.stacktrace.packages | string | `"org.radarbase.gateway,org.apache.avro"` | Comma-separated list of package prefixes to be included in the stacktrace |
| openTelemetry.agent.enabled | bool | `false` | Enable OpenTelemetry agent (currently only Sentry agent is supported) |
| openTelemetry.agent.agentJar | string | `"sentry-opentelemetry-agent-8.1.0.jar"` | OpenTelemetry Sentry agent jar file name, depends on version of 'io.sentry:sentry-opentelemetry-agent' |
| openTelemetry.exporter.tracesSampleRate | float | `1` | Sample rate for traces (0.0 to 1.0) |
| openTelemetry.exporter.metricsExporterEnabled | bool | `false` | Enable OpenTelemetry metrics exporter other than Sentry |
| openTelemetry.exporter.tracesExporterEnabled | bool | `false` | Enable OpenTelemetry traces exporter other than Sentry |
| openTelemetry.exporter.logsExporterEnabled | bool | `true` | Enable OpenTelemetry logs exporter other than Sentry |
