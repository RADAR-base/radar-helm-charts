

# radar-console
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-console)](https://artifacthub.io/packages/helm/radar-base/radar-console)

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.1](https://img.shields.io/badge/AppVersion-0.0.1-informational?style=flat-square)

A Helm chart for the frontend application of RADAR-base console application.

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-console>
* <https://github.com/RADAR-base/radar-app-config>

## Prerequisites
* Kubernetes 1.28+
* Kubectl 1.28+
* Helm 3.1.0+

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.companyinfo.dev | helmet | 0.14.0 |
| https://radar-base.github.io/radar-helm-charts | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| serverName | string | `"localhost"` | Resolvable server name, needed to find the advertised URL and callback URL |
| disable_tls | bool | `false` | Reconfigure Ingress to not force TLS |
| advertised_protocol | string | `"https"` | The protocol in advertised URIs (https, http) |
| replicaCount | int | `1` | Number of Appconfig frontend replicas to deploy |
| image.registry | string | `"docker.io"` | Image registry |
| image.repository | string | `"peymanm/radarbase-console"` | Image repository |
| image.tag | string | `"0.0.5"` | Image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| image.digest | string | `""` | Image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.pullSecrets | list | `[]` | Optionally specify an array of imagePullSecrets. Secrets must be manually created in the namespace. e.g: pullSecrets:   - myRegistryKeySecretName  |
| nameOverride | string | `""` | String to partially override radar-console.fullname template with a string (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override radar-console.fullname template with a string |
| envVars | list | `[]` |  |
| podAnnotations | object | `{}` | Annotations for Appconfig frontend pods |
| podSecurityContext | object | `{}` | Configure Appconfig pods' Security Context |
| securityContext | object | `{}` | Configure Appconfig containers' Security Context |
| service.type | string | `"ClusterIP"` |  |
| service.ports[0].name | string | `"http"` |  |
| service.ports[0].port | int | `8080` |  |
| service.ports[0].targetPort | int | `8080` |  |
| ingress.enabled | bool | `true` | Enable ingress controller resource |
| ingress.annotations | object | check values.yaml | Annotations that define default ingress class, certificate issuer |
| ingress.hostname | string | `"localhost"` |  |
| ingress.path | string | `"/radarbase-console"` | Path within the url structure |
| ingress.pathType | string | `"ImplementationSpecific"` | Ingress Path type |
| ingress.ingressClassName | string | `"nginx"` | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+) |
| ingress.tls | bool | `true` | Hosts to accept requests from |
| ingress.existingSecret | string | `"radar-base-tls"` | TLS Secret Name |
| configMap.mounted | bool | `true` |  |
| configMap.mountPath | string | `"/app/config"` |  |
| configMap.data."frontend-config.json" | object | `{}` |  |
| resources.limits | object | `{"cpu":"200m","memory":"512Mi"}` | CPU/Memory resource limits |
| resources.requests | object | `{"cpu":"100m","memory":"128Mi"}` | CPU/Memory resource requests |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| tolerations | list | `[]` | Toleration labels for pod assignment |
| affinity | object | `{}` | Affinity labels for pod assignment |
| customLivenessProbe | object | `{}` | Custom livenessProbe that overrides the default one |
| livenessProbe.enabled | bool | `true` | Enable livenessProbe |
| livenessProbe.initialDelaySeconds | int | `5` | Initial delay seconds for livenessProbe |
| livenessProbe.periodSeconds | int | `30` | Period seconds for livenessProbe |
| livenessProbe.timeoutSeconds | int | `5` | Timeout seconds for livenessProbe |
| livenessProbe.successThreshold | int | `1` | Success threshold for livenessProbe |
| livenessProbe.failureThreshold | int | `3` | Failure threshold for livenessProbe |
| livenessProbe.httpGet.path | string | `"/"` |  |
| livenessProbe.httpGet.port | string | `"http"` |  |
| customReadinessProbe | object | `{}` | Custom readinessProbe that overrides the default one |
| readinessProbe.enabled | bool | `true` | Enable readinessProbe |
| readinessProbe.initialDelaySeconds | int | `5` | Initial delay seconds for readinessProbe |
| readinessProbe.periodSeconds | int | `30` | Period seconds for readinessProbe |
| readinessProbe.timeoutSeconds | int | `5` | Timeout seconds for readinessProbe |
| readinessProbe.successThreshold | int | `1` | Success threshold for readinessProbe |
| readinessProbe.failureThreshold | int | `3` | Failure threshold for readinessProbe |
| readinessProbe.httpGet.path | string | `"/"` |  |
| readinessProbe.httpGet.port | string | `"http"` |  |
| customStartupProbe | object | `{}` | Custom startupProbe that overrides the default one |
| startupProbe.enabled | bool | `true` | Enable startupProbe |
| startupProbe.initialDelaySeconds | int | `5` | Initial delay seconds for startupProbe |
| startupProbe.periodSeconds | int | `10` | Period seconds for startupProbe |
| startupProbe.timeoutSeconds | int | `10` | Timeout seconds for startupProbe |
| startupProbe.successThreshold | int | `1` | Success threshold for startupProbe |
| startupProbe.failureThreshold | int | `30` | Failure threshold for startupProbe |
| startupProbe.httpGet.path | string | `"/"` |  |
| startupProbe.httpGet.port | string | `"http"` |  |
| networkpolicy | object | check `values.yaml` | Network policy defines who can access this application and who this applications has access to |
