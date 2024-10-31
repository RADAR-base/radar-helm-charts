

# radar-rest-sources-backend
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-rest-sources-backend)](https://artifacthub.io/packages/helm/radar-base/radar-rest-sources-backend)

![Version: 1.2.3](https://img.shields.io/badge/Version-1.2.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 4.4.7](https://img.shields.io/badge/AppVersion-4.4.7-informational?style=flat-square)

A Helm chart for the backend application of RADAR-base Rest Sources Authorizer

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Keyvan Hedayati | <keyvan@thehyve.nl> | <https://www.thehyve.nl> |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |
| Nivethika Mahasivam | <nivethika@thehyve.nl> | <https://www.thehyve.nl/experts/nivethika-mahasivam> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-rest-sources-backend>
* <https://github.com/RADAR-base/RADAR-Rest-Source-Auth>

## Prerequisites
* Kubernetes 1.22+
* Kubectl 1.22+
* Helm 3.1.0+

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `2` | Number of radar-rest-sources-backend replicas to deploy |
| image.repository | string | `"radarbase/radar-rest-source-auth-backend"` | radar-rest-sources-backend image repository |
| image.tag | string | `nil` | radar-rest-sources-backend image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| image.pullPolicy | string | `"IfNotPresent"` | radar-rest-sources-backend image pull policy |
| imagePullSecrets | list | `[]` | Docker registry secret names as an array |
| nameOverride | string | `""` | String to partially override radar-rest-sources-backend.fullname template with a string (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override radar-rest-sources-backend.fullname template with a string |
| podSecurityContext | object | `{}` | Configure radar-rest-sources-backend pods' Security Context |
| securityContext | object | `{}` | Configure radar-rest-sources-backend containers' Security Context |
| service.type | string | `"ClusterIP"` | Kubernetes Service type |
| service.port | int | `8080` | radar-rest-sources-backend port |
| disable_tls | bool | `false` | Disable TLS (reconfigures Ingress) |
| advertised_protocol | string | `"https"` | The protocol in advertised URIs (https, http) |
| ingress.enabled | bool | `true` | Enable ingress controller resource |
| ingress.annotations | object | check values.yaml | Annotations that define default ingress class, certificate issuer and session configuration |
| ingress.path | string | `"/rest-sources/backend"` | Path within the url structure |
| ingress.pathType | string | `"ImplementationSpecific"` | Ingress Path type |
| ingress.ingressClassName | string | `"nginx"` | IngressClass that will be used to implement the Ingress (Kubernetes 1.18+) |
| ingress.hosts | list | `["localhost"]` | Hosts to accept requests from |
| ingress.tls.secretName | string | `"radar-base-tls"` | TLS Secret Name |
| resources.requests | object | `{"cpu":"100m","memory":"400Mi"}` | CPU/Memory resource requests |
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
| readinessProbe.periodSeconds | int | `15` | Period seconds for readinessProbe |
| readinessProbe.timeoutSeconds | int | `3` | Timeout seconds for readinessProbe |
| readinessProbe.successThreshold | int | `1` | Success threshold for readinessProbe |
| readinessProbe.failureThreshold | int | `3` | Failure threshold for readinessProbe |
| networkpolicy | object | check `values.yaml` | Network policy defines who can access this application and who this applications has access to |
| authorizer.tokenExpiryTimeInMinutes | int | `15` | Within how many minutes an online authorization attempt should be finalized. Steps: logging in to Fitbit, returning to the authorizer. |
| authorizer.persistentTokenExpiryInMin | int | `7200` | Within how many minutes an authorization attempt by a participant should be finalized. Steps: passing token to participant, them logging in to Fitbit, and returning to the authorizer. |
| postgres.host | string | `"postgresql"` | host name of the postgres db |
| postgres.port | int | `5432` | post of the postgres db |
| postgres.database | string | `"restsourceauthorizer"` | database name |
| postgres.connection_parameters | string | `""` | additional JDBC connection parameters e.g. sslmode=verify-full |
| postgres.user | string | `"postgres"` | postgres user |
| postgres.password | string | `"password"` | password of the postgres user |
| postgres.ssl.enabled | bool | `false` | set to true of the connecting to postgres using SSL |
| postgres.ssl.keystorepassword | string | `"keystorepassword"` |  |
| redis.uri | string | `"redis://redis-master:6379"` | URI of the redis database |
| serverName | string | `"localhost"` | Resolvable server name, needed to find the advertised URL and callback URL |
| managementportal_url | string | `"http://management-portal:8080/managementportal"` | URL of the Management Portal |
| client_secret | string | `"secret"` | OAuth2 client secret of the radar-rest-sources-backend client from Management Portal |
| restSourceClients.fitbit.enable | bool | `false` | set to true, if Fitbit client should be used |
| restSourceClients.fitbit.sourceType | string | `"FitBit"` | Type of the data sources |
| restSourceClients.fitbit.authorizationEndpoint | string | `"https://www.fitbit.com/oauth2/authorize"` | Authorization endpoint for Fitbit authentication and authorization |
| restSourceClients.fitbit.tokenEndpoint | string | `"https://api.fitbit.com/oauth2/token"` | Token endpoint to request access-token from FitBit |
| restSourceClients.fitbit.clientId | string | `nil` | FitBit client id |
| restSourceClients.fitbit.clientSecret | string | `nil` | FitBit client secret |
| restSourceClients.fitbit.scope | string | `"activity heartrate sleep profile"` | List of scopes of the data that should be collected from Fitbit. For details, please refer to https://dev.fitbit.com/build/reference/web-api/developer-guide/application-design/#Scopes |
| restSourceClients.garmin.enable | bool | `false` | set to true, if Garmin client should be used |
| restSourceClients.garmin.sourceType | string | `"Garmin"` | Type of the data sources |
| restSourceClients.garmin.preAuthorizationEndpoint | string | `"https://connectapi.garmin.com/oauth-service/oauth/request_token"` | Pre authorization endpoint to get request token in OAuth 1.0 terminology |
| restSourceClients.garmin.authorizationEndpoint | string | `"https://connect.garmin.com/oauthConfirm"` | Authorization endpoint to get oauth confirmation in OAuth 1.0 terminology |
| restSourceClients.garmin.deregistrationEndpoint | string | `"https://healthapi.garmin.com/wellness-api/rest/user/registration"` | Endpoint to deregister a user on garmin to disable receiving push requests |
| restSourceClients.garmin.tokenEndpoint | string | `"https://connectapi.garmin.com/oauth-service/oauth/access_token"` | Token endpoint to request access-token from Garmin |
| restSourceClients.garmin.clientId | string | `"Garmin-clientid"` | Garmin client id |
| restSourceClients.garmin.clientSecret | string | `"Garmin-clientsecret"` | Garmin client secret |
| restSourceClients.garmin.scope | string | `"activity heartrate sleep profile"` | List of scopes of the data that should be collected from Garmin. |
| restSourceClients.oura.enable | bool | `true` | set to true, if Oura client should be used |
| restSourceClients.oura.sourceType | string | `"Oura"` | Type of the data sources |
| restSourceClients.oura.authorizationEndpoint | string | `"https://cloud.ouraring.com/oauth/authorize"` | Authorization endpoint for Oura authentication and authorization |
| restSourceClients.oura.tokenEndpoint | string | `"https://api.ouraring.com/oauth/token"` | Token endpoint to request access-token from Oura |
| restSourceClients.oura.deregistrationEndpoint | string | `"https://api.ouraring.com/oauth/revoke"` |  |
| restSourceClients.oura.clientId | string | `"Oura-clientid"` | Oura client id |
| restSourceClients.oura.clientSecret | string | `"Oura-clientsecret"` | Oura client secret |
| restSourceClients.oura.scope | string | `"daily session heartrate workout tag personal email spo2 ring_configuration"` | List of scopes of the data that should be collected from Oura. For details, please refer to https://cloud.ouraring.com/docs/authentication |
