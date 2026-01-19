

# radar-appserver
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-appserver)](https://artifacthub.io/packages/helm/radar-base/radar-appserver)

![Version: 0.10.2](https://img.shields.io/badge/Version-0.10.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.4.5](https://img.shields.io/badge/AppVersion-2.4.5-informational?style=flat-square)

A Helm chart for the backend application of RADAR-base Appserver

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Yatharth Ranjan | <yatharth.ranjan@kcl.ac.uk> | <https://www.kcl.ac.uk/people/yatharth-ranjan> |
| Pauline Conde | <pauline.conde@kcl.ac.uk> | <https://www.kcl.ac.uk/people/pauline-conde> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-appserver>
* <https://github.com/RADAR-base/RADAR-Appserver>

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
| global.nameOverride | string | `""` | String to partially override appserver-microservices.fullname template with a string (will prepend the release name) |
| global.fullnameOverride | string | `""` | String to fully override appserver-microservices.fullname template with a string |
| global.replicaCount | int | `1` | Number of appserver microservices replicas to deploy |
| global.javaOpts | string | `"-XX:GCTimeRatio=19 -XX:MinHeapFreeRatio=20 -XX:MaxHeapFreeRatio=30 --add-opens java.base/java.io=ALL-UNNAMED --add-opens java.management/javax.management.openmbean=ALL-UNNAMED --add-opens java.base/java.lang.reflect=ALL-UNNAMED --add-opens java.management/javax.management=ALL-UNNAMED -Djava.util.logging.manager=org.apache.logging.log4j.jul.LogManager"` | Standard JAVA_OPTS that should be passed to this service |
| global.imagePullSecrets | list | `[]` | Optionally specify an array of imagePullSecrets. Secrets must be manually created in the namespace. e.g: pullSecrets:   - myRegistryKeySecretName  |
| global.nodeSelector | object | `{}` | Node labels for pod assignment |
| global.tolerations | list | `[]` | Toleration labels for pod assignment |
| global.affinity | object | `{}` | Affinity labels for pod assignment |
| services.gateway-service.enabled | bool | `true` |  |
| services.gateway-service.replicaCount | int | `1` | Number of appserver microservices replicas to deploy |
| services.gateway-service.image.repository | string | `"ghcr.io/radar-base/radar-appserver/gateway-service"` | Image repository |
| services.gateway-service.image.tag | string | `nil` | Image tag (immutable tags are recommended) |
| services.gateway-service.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| services.gateway-service.podSecurityContext | object | `{}` | Configure radar-appserver pods' Security Context |
| services.gateway-service.securityContext | object | `{}` | Configure radar-appserver containers' Security Context |
| services.gateway-service.service.type | string | `"ClusterIP"` | Kubernetes Service type |
| services.gateway-service.service.port | int | `8080` | appserver-microservices service port |
| services.gateway-service.ports.containerPort | int | `8080` | appserver-microservices container port |
| services.gateway-service.disable_tls | bool | `false` | Reconfigure Ingress to not force TLS |
| services.gateway-service.advertised_protocol | string | `"https"` | The protocol in advertised URIs (https, http) |
| services.gateway-service.ingress.enabled | bool | `true` | Enable ingress controller resource |
| services.gateway-service.ingress.annotations | object | check values.yaml | Annotations that define default ingress class, certificate issuer and session configuration |
| services.gateway-service.ingress.path | string | `"/appserver/?(.*)"` | Path within the url structure |
| services.gateway-service.ingress.pathType | string | `"ImplementationSpecific"` | Ingress path type |
| services.gateway-service.ingress.ingressClassName | string | `"nginx"` | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+) |
| services.gateway-service.ingress.hosts | list | `["localhost"]` | Hosts to accept requests from |
| services.gateway-service.ingress.tls.secretName | string | `"radar-base-tls"` | TLS Secret Name |
| services.gateway-service.resources.requests | object | `{"cpu":"100m","memory":"128Mi"}` | CPU/Memory resource requests |
| services.gateway-service.nodeSelector | object | `{}` | Node labels for pod assignment |
| services.gateway-service.tolerations | list | `[]` | Toleration labels for pod assignment |
| services.gateway-service.affinity | object | `{}` | Affinity labels for pod assignment |
| services.gateway-service.extraEnvVars | list | `[]` | Extra environment variables |
| services.gateway-service.injectJavaOpts | bool | `true` |  |
| services.gateway-service.customLivenessProbe | object | `{}` | Custom livenessProbe that overrides the default one |
| services.gateway-service.livenessProbe.enabled | bool | `true` | Enable livenessProbe |
| services.gateway-service.livenessProbe.initialDelaySeconds | int | `5` | Initial delay seconds for livenessProbe |
| services.gateway-service.livenessProbe.periodSeconds | int | `30` | Period seconds for livenessProbe |
| services.gateway-service.livenessProbe.timeoutSeconds | int | `5` | Timeout seconds for livenessProbe |
| services.gateway-service.livenessProbe.successThreshold | int | `1` | Success threshold for livenessProbe |
| services.gateway-service.livenessProbe.failureThreshold | int | `3` | Failure threshold for livenessProbe |
| services.gateway-service.customReadinessProbe | object | `{}` | Custom readinessProbe that overrides the default one |
| services.gateway-service.readinessProbe.enabled | bool | `true` | Enable readinessProbe |
| services.gateway-service.readinessProbe.initialDelaySeconds | int | `5` | Initial delay seconds for readinessProbe |
| services.gateway-service.readinessProbe.periodSeconds | int | `30` | Period seconds for readinessProbe |
| services.gateway-service.readinessProbe.timeoutSeconds | int | `5` | Timeout seconds for readinessProbe |
| services.gateway-service.readinessProbe.successThreshold | int | `1` | Success threshold for readinessProbe |
| services.gateway-service.readinessProbe.failureThreshold | int | `3` | Failure threshold for readinessProbe |
| services.gateway-service.customStartupProbe | object | `{}` | Custom startupProbe that overrides the default one |
| services.gateway-service.startupProbe.enabled | bool | `true` | Enable startupProbe |
| services.gateway-service.startupProbe.initialDelaySeconds | int | `5` | Initial delay seconds for startupProbe |
| services.gateway-service.startupProbe.periodSeconds | int | `10` | Period seconds for startupProbe |
| services.gateway-service.startupProbe.timeoutSeconds | int | `10` | Timeout seconds for startupProbe |
| services.gateway-service.startupProbe.successThreshold | int | `1` | Success threshold for startupProbe |
| services.gateway-service.startupProbe.failureThreshold | int | `30` | Failure threshold for startupProbe |
| services.gateway-service.postgres.host | string | `nil` | host name of the postgres db |
| services.gateway-service.postgres.port | string | `nil` | port of the postgres db |
| services.gateway-service.postgres.database | string | `nil` | database name |
| services.gateway-service.postgres.urlSecret | object | `{"key":"jdbc-uri","name":"radar-cloudnative-postgresql-appserver"}` | Kubernetes secret containing the database JDBC Connection url (disables use of 'host', 'port' and 'database' values). |
| services.gateway-service.postgres.user | string | `nil` | postgres user |
| services.gateway-service.postgres.userSecret | object | `{"key":"username","name":"radar-cloudnative-postgresql-appserver"}` | Kubernetes secret containing the database user (disables use of 'user' value). |
| services.gateway-service.postgres.password | string | `nil` | password of the postgres user |
| services.gateway-service.postgres.passwordSecret | object | `{"key":"password","name":"radar-cloudnative-postgresql-appserver"}` | Kubernetes secret containing the database password (disables use of 'password' value). |
| services.gateway-service.postgres.hibernateDialect | string | `"org.hibernate.dialect.PostgreSQLDialect"` |  |
| services.gateway-service.postgres.jdbcDriver | string | `"org.postgresql.Driver"` |  |
| services.gateway-service.postgres.connection_parameters | string | `""` | Additional JDBC connection parameters e.g. sslmode=verify-full. Ignored when using 'urlSecret'. |
| services.gateway-service.postgres.ssl.enabled | bool | `false` | set to true of the connecting to postgres using SSL |
| services.gateway-service.postgres.ssl.keystorepassword | string | `"keystorepassword"` |  |
| services.gateway-service.managementportal_url | string | `"http://management-portal:8080/managementportal"` | URL of the Management Portal |
| services.gateway-service.config | object | check `values.yaml` | Contents of a gateway-service.yml configuration file |
| services.gateway-service.networkpolicy | object | check `values.yaml` | Network policy defines who can access this application and who this applications has access to |
