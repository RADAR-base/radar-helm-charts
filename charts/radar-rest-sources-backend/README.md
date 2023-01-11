

# radar-rest-sources-backend

![Version: 0.4.7](https://img.shields.io/badge/Version-0.4.7-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 4.2.0](https://img.shields.io/badge/AppVersion-4.2.0-informational?style=flat-square)

A Helm chart for the backend application of RADAR-base Rest Sources Authorizer

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Keyvan Hedayati | <keyvan@thehyve.nl> | <https://www.thehyve.nl> |
| Joris Borgdorff | <joris@thehyve.nl> | <https://www.thehyve.nl/experts/joris-borgdorff> |
| Nivethika Mahasivam | <nivethika@thehyve.nl> | <https://www.thehyve.nl/experts/nivethika-mahasivam> |

## Source Code

* <https://github.com/RADAR-base/RADAR-Rest-Source-Auth>

## Prerequisites
* Kubernetes 1.17+
* Kubectl 1.17+
* Helm 3.1.0+

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `2` | Number of radar-rest-sources-backend replicas to deploy |
| image.repository | string | `"radarbase/radar-rest-source-auth-backend"` | radar-rest-sources-backend image repository |
| image.tag | string | `"4.2.0"` | radar-rest-sources-backend image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| image.pullPolicy | string | `"IfNotPresent"` | radar-rest-sources-backend image pull policy |
| imagePullSecrets | list | `[]` | Docker registry secret names as an array |
| nameOverride | string | `""` | String to partially override radar-rest-sources-backend.fullname template with a string (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override radar-rest-sources-backend.fullname template with a string |
| podSecurityContext | object | `{}` | Configure radar-rest-sources-backend pods' Security Context |
| securityContext | object | `{}` | Configure radar-rest-sources-backend containers' Security Context |
| service.type | string | `"ClusterIP"` | Kubernetes Service type |
| service.port | int | `8080` | radar-rest-sources-backend port |
| ingress.enabled | bool | `true` | Enable ingress controller resource |
| ingress.annotations | object | check values.yaml | Annotations that define default ingress class, certificate issuer and session configuration |
| ingress.path | string | `"/rest-sources/backend"` | Path within the url structure |
| ingress.pathType | string | `"ImplementationSpecific"` |  |
| ingress.hosts | list | `["localhost"]` | Hosts to accept requests from |
| ingress.tls.secretName | string | `"radar-base-tls"` | TLS Secret Name |
| resources.requests | object | `{"cpu":"100m","memory":"400Mi"}` | CPU/Memory resource requests |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| tolerations | list | `[]` | Toleration labels for pod assignment |
| affinity | object | `{}` | Affinity labels for pod assignment |
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
| managementportal_host | string | `"management-portal"` | hostname of the Management Portal |
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
