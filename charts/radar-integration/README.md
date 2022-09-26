

# radar-integration

![Version: 0.3.0](https://img.shields.io/badge/Version-0.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.4](https://img.shields.io/badge/AppVersion-1.0.4-informational?style=flat-square)

A Helm chart for RADAR-Base REDCap survey integration application.

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Yatharth Ranjan | <yatharth.ranjan@kcl.ac.uk> | <https://www.kcl.ac.uk/people/yatharth-ranjan> |
| Pauline Conde | <pauline.conde@kcl.ac.uk> | <https://www.kcl.ac.uk/people/pauline-conde> |

## Source Code

* <https://github.com/RADAR-base/RADAR-RedcapIntegration>

## Prerequisites
* Kubernetes 1.17+
* Kubectl 1.17+
* Helm 3.1.0+

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `2` | Number of radar-push-endpoint replicas to deploy |
| image.repository | string | `"radarbase/radar-redcapintegration"` | radar-integration image repository |
| image.tag | string | `"1.0.4"` | radar-integration image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| image.pullPolicy | string | `"IfNotPresent"` | radar-integration image pull policy |
| imagePullSecrets | list | `[]` | Docker registry secret names as an array |
| nameOverride | string | `""` | String to partially override radar-integration.fullname template with a string (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override radar-integration.fullname template with a string |
| podSecurityContext | object | `{}` | Configure radar-integration pods' Security Context |
| securityContext | object | `{}` | Configure radar-integration containers' Security Context |
| service.type | string | `"ClusterIP"` | Kubernetes Service type |
| service.port | int | `8080` | radar-integration port |
| ingress.enabled | bool | `true` | Enable ingress controller resource |
| ingress.annotations | object | check values.yaml | Annotations that define default ingress class, certificate issuer and deny access to sensitive URLs |
| ingress.path | string | `"/redcapint/?(.*)"` | Path within the url structure |
| ingress.pathType | string | `"ImplementationSpecific"` | Path Type |
| ingress.hosts | list | `["localhost"]` | Hosts to accept requests from |
| ingress.tls.secretName | string | `"radar-base-tls"` | TLS Secret Name |
| resources.requests | object | `{"cpu":"100m","memory":"128Mi"}` | CPU/Memory resource requests |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| tolerations | list | `[]` | Toleration labels for pod assignment |
| affinity | object | `{}` | Affinity labels for pod assignment |
| oauth_client_id | string | `"radar_redcap_integrator"` | OAuth2 clientId used by the webApp for making requests |
| oauth_client_secret | string | `"secret"` | OAuth2 client secret |
| management_portal_url | string | `"management-portal"` | Base URL of the Management Portal |
| projects[0] | object | `{"api_path":"/api/","enrolment_event":"","integration_form":"","mp_info_project_name":"","project_id":"","token":"","url":""}` | URL pointing REDCap instance |
| projects[0].project_id | string | `""` | REDCap project identifier |
| projects[0].api_path | string | `"/api/"` | Redcap relative api path |
| projects[0].enrolment_event | string | `""` | Unique identifier for the enrolment event |
| projects[0].integration_form | string | `""` | Name of integration REDCap form |
| projects[0].token | string | `""` | REDCap API Token used to identify the REDCap user against the REDCap instance |
| projects[0].mp_info_project_name | string | `""` | Management Portal project identifier |
