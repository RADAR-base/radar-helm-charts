

# radar-rest-sources-backend
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-rest-sources-backend)](https://artifacthub.io/packages/helm/radar-base/radar-rest-sources-backend)

![Version: 1.5.1](https://img.shields.io/badge/Version-1.5.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 4.4.11](https://img.shields.io/badge/AppVersion-4.4.11-informational?style=flat-square)

A Helm chart for the backend application of RADAR-base Rest Sources Authorizer

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-rest-sources-backend>
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
| replicaCount | int | `2` | Number of radar-rest-sources-backend replicas to deploy |
| image.registry | string | `"ghcr.io"` | Image registry |
| image.repository | string | `"radar-base/radar-rest-source-auth/radar-rest-source-auth-backend:latest"` | Image repository |
| image.tag | string | `nil` | Image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| image.digest | string | `""` | Image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.pullSecrets | list | `[]` | Optionally specify an array of imagePullSecrets. Secrets must be manually created in the namespace. e.g: pullSecrets:   - myRegistryKeySecretName  |
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
| customStartupProbe | object | `{}` | Custom startupProbe that overrides the default one |
| startupProbe.enabled | bool | `true` | Enable startupProbe |
| startupProbe.initialDelaySeconds | int | `5` | Initial delay seconds for startupProbe |
| startupProbe.periodSeconds | int | `10` | Period seconds for startupProbe |
| startupProbe.timeoutSeconds | int | `10` | Timeout seconds for startupProbe |
| startupProbe.successThreshold | int | `1` | Success threshold for startupProbe |
| startupProbe.failureThreshold | int | `30` | Failure threshold for startupProbe |
| networkpolicy | object | check `values.yaml` | Network policy defines who can access this application and who this applications has access to |
| authorizer.tokenExpiryTimeInMinutes | int | `15` | Within how many minutes an online authorization attempt should be finalized. Steps: logging in to Fitbit, returning to the authorizer. |
| authorizer.persistentTokenExpiryInMin | int | `7200` | Within how many minutes an authorization attempt by a participant should be finalized. Steps: passing token to participant, them logging in to Fitbit, and returning to the authorizer. |
| postgres.host | string | `nil` | host name of the postgres db |
| postgres.port | string | `nil` | port of the postgres db |
| postgres.database | string | `nil` | database name |
| postgres.urlSecret | object | `{"key":"jdbc-uri","name":"radar-cloudnative-postgresql-restsourceauthorizer"}` | Kubernetes secret containing the database JDBC Connection url (disables use of 'host', 'port' and 'database' values). |
| postgres.user | string | `nil` | postgres user |
| postgres.userSecret | object | `{"key":"username","name":"radar-cloudnative-postgresql-restsourceauthorizer"}` | Kubernetes secret containing the database user (disables use of 'user' value). |
| postgres.password | string | `nil` | password of the postgres user |
| postgres.passwordSecret | object | `{"key":"password","name":"radar-cloudnative-postgresql-restsourceauthorizer"}` | Kubernetes secret containing the database password (disables use of 'password' value). |
| postgres.connection_parameters | string | `""` | Additional JDBC connection parameters e.g. sslmode=verify-full. Ignored when using 'urlSecret'. |
| postgres.ssl.enabled | bool | `false` | set to true of the connecting to postgres using SSL |
| postgres.ssl.keystorepassword | string | `"keystorepassword"` |  |
| redis.uri | string | `"redis://redis-master:6379"` | URI of the redis database |
| serverName | string | `"localhost"` | Resolvable server name, needed to find the advertised URL and callback URL |
| managementportal_url | string | `"http://management-portal:8080/managementportal"` | URL of the Management Portal |
| client_secret | string | `"secret"` | OAuth2 client secret of the radar-rest-sources-backend client from Management Portal |
| public_key_endpoints | list | `["http://hydra-public:4444/.well-known/jwks.json"]` | List of public key endpoints for token verification |
| auth_url | string | `"http://hydra-public:4444/oauth2/token"` | Auth url for MP client |
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
