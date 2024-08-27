

# radar-integration
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-integration)](https://artifacthub.io/packages/helm/radar-base/radar-integration)

![Version: 0.7.0](https://img.shields.io/badge/Version-0.7.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.4](https://img.shields.io/badge/AppVersion-1.0.4-informational?style=flat-square)

A Helm chart for RADAR-Base REDCap survey integration application.

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Yatharth Ranjan | <yatharth.ranjan@kcl.ac.uk> | <https://www.kcl.ac.uk/people/yatharth-ranjan> |
| Pauline Conde | <pauline.conde@kcl.ac.uk> | <https://www.kcl.ac.uk/people/pauline-conde> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-integration>
* <https://github.com/RADAR-base/RADAR-RedcapIntegration>

## Prerequisites
* Kubernetes 1.22+
* Kubectl 1.22+
* Helm 3.1.0+

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `2` | Number replicas to deploy |
| image.repository | string | `"radarbase/radar-redcapintegration"` | radar-integration image repository |
| image.tag | string | `nil` | radar-integration image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| image.pullPolicy | string | `"IfNotPresent"` | radar-integration image pull policy |
| imagePullSecrets | list | `[]` | Docker registry secret names as an array |
| nameOverride | string | `""` | String to partially override radar-integration.fullname template with a string (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override radar-integration.fullname template with a string |
| podSecurityContext | object | `{}` | Configure radar-integration pods' Security Context |
| securityContext | object | `{}` | Configure radar-integration containers' Security Context |
| service.type | string | `"ClusterIP"` | Kubernetes Service type |
| service.port | int | `8080` | radar-integration port |
| disable_tls | bool | `false` | Disable TLS (reconfigures Ingress and sets URLs to use HTTP) |
| ingress.enabled | bool | `true` | Enable ingress controller resource |
| ingress.annotations | object | check values.yaml | Annotations that define default ingress class, certificate issuer and deny access to sensitive URLs |
| ingress.path | string | `"/redcapint/?(.*)"` | Path within the url structure |
| ingress.pathType | string | `"ImplementationSpecific"` | Ingress Path type |
| ingress.ingressClassName | string | `"nginx"` | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+) |
| ingress.hosts | list | `["localhost"]` | Hosts to accept requests from |
| ingress.tls.secretName | string | `"radar-base-tls-radar-integration"` | TLS Secret Name |
| resources.requests | object | `{"cpu":"100m","memory":"128Mi"}` | CPU/Memory resource requests |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| tolerations | list | `[]` | Toleration labels for pod assignment |
| affinity | object | `{}` | Affinity labels for pod assignment |
| customLivenessProbe | object | `{}` | Custom livenessProbe that overrides the default one |
| livenessProbe.enabled | bool | `true` | Enable livenessProbe |
| livenessProbe.initialDelaySeconds | int | `5` | Initial delay seconds for livenessProbe |
| livenessProbe.periodSeconds | int | `60` | Period seconds for livenessProbe |
| livenessProbe.timeoutSeconds | int | `5` | Timeout seconds for livenessProbe |
| livenessProbe.successThreshold | int | `1` | Success threshold for livenessProbe |
| livenessProbe.failureThreshold | int | `3` | Failure threshold for livenessProbe |
| customReadinessProbe | object | `{}` | Custom readinessProbe that overrides the default one |
| readinessProbe.enabled | bool | `true` | Enable readinessProbe |
| readinessProbe.initialDelaySeconds | int | `5` | Initial delay seconds for readinessProbe |
| readinessProbe.periodSeconds | int | `60` | Period seconds for readinessProbe |
| readinessProbe.timeoutSeconds | int | `5` | Timeout seconds for readinessProbe |
| readinessProbe.successThreshold | int | `1` | Success threshold for readinessProbe |
| readinessProbe.failureThreshold | int | `3` | Failure threshold for readinessProbe |
| networkpolicy | object | check `values.yaml` | Network policy defines who can access this application and who this applications has access to |
| oauth_client_id | string | `"radar_redcap_integrator"` | OAuth2 clientId used by the webApp for making requests |
| oauth_client_secret | string | `"secret"` | OAuth2 client secret |
| managementportal_url | string | `"http://management-portal:8080/managementportal/"` | URL of the Management Portal. Make sure to include the trailing slash |
| projects[0].redcap_info.url | string | `""` | URL pointing REDCap instance |
| projects[0].redcap_info.project_id | string | `""` | REDCap project identifier |
| projects[0].redcap_info.api_path | string | `"/api/"` | Redcap relative api path |
| projects[0].redcap_info.enrolment_event | string | `""` | Unique identifier for the enrolment event |
| projects[0].redcap_info.integration_form | string | `""` | Name of integration REDCap form |
| projects[0].redcap_info.token | string | `""` | REDCap API Token used to identify the REDCap user against the REDCap instance |
| projects[0].redcap_info.attributes | list | `[]` | List of REDCap fields to be used as attributes in Management Portal |
| projects[0].mp_info.project_name | string | `""` | Management Portal project identifier |
