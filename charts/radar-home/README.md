

# radar-home
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-home)](https://artifacthub.io/packages/helm/radar-base/radar-home)

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.3](https://img.shields.io/badge/AppVersion-0.1.3-informational?style=flat-square)

RADAR-base home page.

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Keyvan Hedayati | <keyvan@thehyve.nl> | <https://www.thehyve.nl> |
| Joris Borgdorff | <joris@thehyve.nl> | <https://www.thehyve.nl/experts/joris-borgdorff> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-home>
* <https://github.com/RADAR-base/radar-home>

## Prerequisites
* Kubernetes 1.22+
* Kubectl 1.22+
* Helm 3.1.0+

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `1` | Number of Appconfig replicas to deploy |
| image.repository | string | `"radarbase/radar-home"` | Appconfig image repository |
| image.tag | string | `"0.1.3"` | Appconfig image tag (immutable tags are recommended) |
| image.pullPolicy | string | `"IfNotPresent"` | Appconfig image pull policy |
| imagePullSecrets | list | `[]` | Docker registry secret names as an array |
| nameOverride | string | `""` | String to partially override radar-home.fullname template with a string (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override radar-home.fullname template with a string |
| namespace | string | `"default"` | Kubernetes namespace that Appconfig is going to be deployed on |
| service.type | string | `"ClusterIP"` | Kubernetes Service type |
| service.port | int | `8080` | Port |
| ingress.enabled | bool | `true` | Enable ingress controller resource |
| ingress.annotations | object | check values.yaml | Annotations that define default ingress class, certificate issuer |
| ingress.path | string | `"/"` | Path within the url structure |
| ingress.pathType | string | `"ImplementationSpecific"` | Ingress Path type |
| ingress.ingressClassName | string | `"nginx"` | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+) |
| ingress.hosts | list | `["localhost"]` | Hosts to accept requests from |
| ingress.tls.secretName | string | `"radar-base-tls-radar-home"` | TLS Secret Name |
| resources.limits | object | `{"cpu":"200m"}` | CPU/Memory resource limits |
| resources.requests | object | `{"cpu":"10m","memory":"5Mi"}` | CPU/Memory resource requests |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| tolerations | list | `[]` | Toleration labels for pod assignment |
| affinity | object | `{}` | Affinity labels for pod assignment |
| extraEnvVars | list | `[]` | Extra environment variables |
| customLivenessProbe | object | `{}` | Custom livenessProbe that overrides the default one |
| livenessProbe.enabled | bool | `true` | Enable livenessProbe |
| livenessProbe.initialDelaySeconds | int | `10` | Initial delay seconds for livenessProbe |
| livenessProbe.periodSeconds | int | `30` | Period seconds for livenessProbe |
| livenessProbe.timeoutSeconds | int | `5` | Timeout seconds for livenessProbe |
| livenessProbe.successThreshold | int | `1` | Success threshold for livenessProbe |
| livenessProbe.failureThreshold | int | `3` | Failure threshold for livenessProbe |
| customReadinessProbe | object | `{}` | Custom readinessProbe that overrides the default one |
| readinessProbe.enabled | bool | `true` | Enable readinessProbe |
| readinessProbe.initialDelaySeconds | int | `10` | Initial delay seconds for readinessProbe |
| readinessProbe.periodSeconds | int | `30` | Period seconds for readinessProbe |
| readinessProbe.timeoutSeconds | int | `5` | Timeout seconds for readinessProbe |
| readinessProbe.successThreshold | int | `1` | Success threshold for readinessProbe |
| readinessProbe.failureThreshold | int | `3` | Failure threshold for readinessProbe |
| networkpolicy | object | check `values.yaml` | Network policy defines who can access this application and who this applications has access to |
| s3.enabled | bool | `false` | Enable link to S3 |
| s3.url | string | `nil` | URL to S3 |
| dashboard.enabled | bool | `false` | Enable link to dashboard |
| dashboard.url | string | `nil` | URL to dashboard |
| appConfig.enabled | bool | `false` | Enable link to app-config service |
| uploadPortal.enabled | bool | `false` | Enable link to upload portal |
| restAuthorizer.enabled | bool | `false` | Enable link to rest source authorizer |
| monitoring.enabled | bool | `false` | Enable link to the monitoring stack, usually Prometheus |
| monitoring.url | string | `nil` | URL to the monitoring stack, usually Prometheus |
| logging.enabled | bool | `false` | Enable link to the logging stack, usually Graylog |
| logging.url | string | `nil` | URL to the monitoring stack, usually Graylog |
