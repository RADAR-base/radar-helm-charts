

# radar-home
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-home)](https://artifacthub.io/packages/helm/radar-base/radar-home)

![Version: 0.5.6](https://img.shields.io/badge/Version-0.5.6-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.7](https://img.shields.io/badge/AppVersion-0.1.7-informational?style=flat-square)

RADAR-base home page.

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-home>
* <https://github.com/RADAR-base/radar-home>

## Prerequisites
* Kubernetes 1.28+
* Kubectl 1.28+
* Helm 3.1.0+
* When `gatewayAPI.enabled=true`: the Gateway API CRDs and a Gateway Controller (e.g. NGINX Gateway Fabric) must already be installed in the cluster, and the shared parent Gateway `radar-base-k8s-gateway` must exist — it can be created via the [gateway-api](https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/gateway-api) chart

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://radar-base.github.io/radar-helm-charts | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `1` | Number of Appconfig replicas to deploy |
| image.registry | string | `"ghcr.io"` | Image registry |
| image.repository | string | `"radar-base/radar-home/radar-home"` | Image repository |
| image.tag | string | `nil` | Image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| image.digest | string | `""` | Image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.pullSecrets | list | `[]` | Optionally specify an array of imagePullSecrets. Secrets must be manually created in the namespace. e.g: pullSecrets:   - myRegistryKeySecretName  |
| nameOverride | string | `""` | String to partially override radar-home.fullname template with a string (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override radar-home.fullname template with a string |
| namespace | string | `"default"` | Kubernetes namespace that Appconfig is going to be deployed on |
| service.type | string | `"ClusterIP"` | Kubernetes Service type |
| service.port | int | `8080` | Port |
| disable_tls | bool | `false` | Reconfigure Ingress to not force TLS |
| ingress.enabled | bool | `true` | Enable ingress controller resource |
| ingress.annotations | object | check values.yaml | Annotations that define default ingress class, certificate issuer |
| ingress.path | string | `"/"` | Path within the url structure |
| ingress.pathType | string | `"ImplementationSpecific"` | Ingress Path type |
| ingress.ingressClassName | string | `"nginx"` | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+) |
| ingress.hosts | list | `["localhost"]` | Hosts to accept requests from |
| ingress.tls.secretName | string | `"radar-base-tls"` | TLS Secret Name |
| gatewayAPI.enabled | bool | `false` | Enable Gateway API HTTPRoute resource (alternative to ingress). Opt-in: requires the Gateway API CRDs and a Gateway controller to be installed. |
| gatewayAPI.annotations | object | `{}` | Annotations to add to the HTTPRoute |
| gatewayAPI.parentRef | object | `{"name":"radar-base-k8s-gateway","namespace":""}` | Parent Gateway that the HTTPRoute attaches to. The Gateway itself is a shared resource and must be created separately (not by this chart). |
| gatewayAPI.parentRef.name | string | `"radar-base-k8s-gateway"` | Name of the Gateway |
| gatewayAPI.parentRef.namespace | string | `""` | Namespace of the Gateway (defaults to the release namespace when empty) |
| gatewayAPI.hostnames | list | `["{{ .Values.serverName }}"]` | Hostnames the HTTPRoutes accept requests for (must intersect the Gateway listener hostnames). String values support Helm templating (tpl); defaults to serverName so deployments override it the same way as ingress.hosts. |
| gatewayAPI.https | object | `{"port":443,"sectionName":""}` | HTTPS listener on the Gateway that the main route attaches to |
| gatewayAPI.https.port | int | `443` | Listener port (empty attaches to all matching listeners) |
| gatewayAPI.https.sectionName | string | `""` | Listener sectionName on the Gateway (optional) |
| gatewayAPI.pathType | string | `"PathPrefix"` | Path match type (PathPrefix, Exact or RegularExpression) |
| gatewayAPI.path | string | `"/"` | Path to match within the URL structure |
| gatewayAPI.filters | list | `[]` | Additional HTTPRoute filters (e.g. URLRewrite, RequestHeaderModifier) |
| gatewayAPI.httpsRedirect | object | `{"enabled":true,"port":80,"sectionName":"","statusCode":301}` | HTTP->HTTPS redirect route (equivalent to nginx force-TLS behaviour) |
| gatewayAPI.httpsRedirect.enabled | bool | `true` | Enable a second HTTPRoute that 301-redirects HTTP traffic to HTTPS |
| gatewayAPI.httpsRedirect.port | int | `80` | HTTP listener port on the Gateway to attach the redirect to |
| gatewayAPI.httpsRedirect.sectionName | string | `""` | Listener sectionName on the Gateway (optional) |
| gatewayAPI.httpsRedirect.statusCode | int | `301` | Redirect HTTP status code |
| resources.limits | object | `{"cpu":"200m"}` | CPU/Memory resource limits |
| resources.requests | object | `{"cpu":"10m","memory":"5Mi"}` | CPU/Memory resource requests |
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
| readinessProbe.periodSeconds | int | `30` | Period seconds for readinessProbe |
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
| podDisruptionBudget.enabled | bool | `false` | Enable Pod Disruption Budget |
| podDisruptionBudget.minAvailable | int | `1` | Minimum number of pods that must be available during disruptions |
| podDisruptionBudget.maxUnavailable | string | `nil` | Maximum number of pods that can be unavailable during disruptions |
| serverName | string | `"localhost"` |  |
