

# radar-upload-connect-frontend
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-upload-connect-frontend)](https://artifacthub.io/packages/helm/radar-base/radar-upload-connect-frontend)

![Version: 0.5.0](https://img.shields.io/badge/Version-0.5.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.5.14](https://img.shields.io/badge/AppVersion-0.5.14-informational?style=flat-square)

A Helm chart for RADAR-base upload connector frontend application that provides a UI for uploading files and sending them to the upload-backend.

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Keyvan Hedayati | <keyvan@thehyve.nl> | <https://www.thehyve.nl> |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |
| Nivethika Mahasivam | <nivethika@thehyve.nl> | <https://www.thehyve.nl/experts/nivethika-mahasivam> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-upload-connect-frontend>
* <https://github.com/RADAR-base/radar-upload-source-connector>

## Prerequisites
* Kubernetes 1.22+
* Kubectl 1.22+
* Helm 3.1.0+

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `2` | Number of radar-upload-connect-frontend replicas to deploy |
| image.repository | string | `"radarbase/radar-upload-connect-frontend"` | radar-upload-connect-frontend image repository |
| image.tag | string | `nil` | radar-upload-connect-frontend image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| image.pullPolicy | string | `"IfNotPresent"` | radar-upload-connect-frontend image pull policy |
| imagePullSecrets | list | `[]` | Docker registry secret names as an array |
| nameOverride | string | `""` | String to partially override radar-upload-connect-frontend.fullname template with a string (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override radar-upload-connect-frontend.fullname template with a string |
| podSecurityContext | object | `{}` | Configure radar-upload-connect-frontend pods' Security Context |
| securityContext | object | `{}` | Configure radar-upload-connect-frontend containers' Security Context |
| service.type | string | `"ClusterIP"` | Kubernetes Service type |
| service.port | int | `80` | radar-upload-connect-frontend port |
| disable_tls | bool | `false` | Disable TLS (reconfigures Ingress and sets URLs to use HTTP) |
| advertised_protocol | string | `"https"` |  |
| ingress.enabled | bool | `true` | Enable ingress controller resource |
| ingress.annotations | object | check values.yaml | Annotations that define default ingress class, certificate issuer |
| ingress.path | string | `"/upload/?(.*)"` | Path within the url structure |
| ingress.pathType | string | `"ImplementationSpecific"` | Ingress Path type |
| ingress.ingressClassName | string | `"nginx"` | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+) |
| ingress.hosts | list | `["localhost"]` | Host to listen to requests to |
| ingress.tls.secretName | string | `"radar-base-tls-radar-upload-connect-frontend"` | Name of the secret containing TLS certificates |
| resources.requests | object | `{"cpu":"100m","memory":"128Mi"}` | CPU/Memory resource requests |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| tolerations | list | `[]` | Toleration labels for pod assignment |
| affinity | object | `{}` | Affinity labels for pod assignment |
| extraEnvVars | list | `[]` | Extra environment variables |
| customLivenessProbe | object | `{}` | Custom livenessProbe that overrides the default one |
| livenessProbe.enabled | bool | `true` | Enable livenessProbe |
| livenessProbe.initialDelaySeconds | int | `3` | Initial delay seconds for livenessProbe |
| livenessProbe.periodSeconds | int | `300` | Period seconds for livenessProbe |
| livenessProbe.timeoutSeconds | int | `10` | Timeout seconds for livenessProbe |
| livenessProbe.successThreshold | int | `1` | Success threshold for livenessProbe |
| livenessProbe.failureThreshold | int | `3` | Failure threshold for livenessProbe |
| customReadinessProbe | object | `{}` | Custom readinessProbe that overrides the default one |
| readinessProbe.enabled | bool | `true` | Enable readinessProbe |
| readinessProbe.initialDelaySeconds | int | `5` | Initial delay seconds for readinessProbe |
| readinessProbe.periodSeconds | int | `10` | Period seconds for readinessProbe |
| readinessProbe.timeoutSeconds | int | `10` | Timeout seconds for readinessProbe |
| readinessProbe.successThreshold | int | `1` | Success threshold for readinessProbe |
| readinessProbe.failureThreshold | int | `3` | Failure threshold for readinessProbe |
| networkpolicy | object | check `values.yaml` | Network policy defines who can access this application and who this applications has access to |
| server_name | string | `"localhost"` | Server name or domain name |
| vue_app_client_id | string | `"radar_upload_frontend"` | OAuth2 client id of the upload connect frontend application |
