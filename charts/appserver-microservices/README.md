

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
| services.gateway-service.command | string | `"gateway-service"` | Command to run when starting the container. |
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
| services.gateway-service.managementportal_url | string | `"http://management-portal:8080/managementportal"` | URL of the Management Portal |
| services.gateway-service.config | object | check `values.yaml` | Contents of a gateway-service.yml configuration file |
| services.gateway-service.networkpolicy | object | check `values.yaml` | Network policy defines who can access this application and who this applications has access to |
| services.project-service.enabled | bool | `true` |  |
| services.project-service.replicaCount | int | `1` | Number of appserver microservices replicas to deploy |
| services.project-service.image.repository | string | `"ghcr.io/radar-base/radar-appserver/project-service"` | Image repository |
| services.project-service.image.tag | string | `nil` | Image tag (immutable tags are recommended) |
| services.project-service.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| services.project-service.podSecurityContext | object | `{}` | Configure radar-appserver pods' Security Context |
| services.project-service.securityContext | object | `{}` | Configure radar-appserver containers' Security Context |
| services.project-service.service.type | string | `"ClusterIP"` | Kubernetes Service type |
| services.project-service.service.port | int | `9010` | appserver-microservices service port |
| services.project-service.ports.containerPort | int | `9010` | appserver-microservices container port |
| services.project-service.command | string | `"project-service"` | Command to run when starting the container. |
| services.project-service.disable_tls | bool | `true` | Reconfigure Ingress to not force TLS |
| services.project-service.advertised_protocol | string | `"https"` | The protocol in advertised URIs (https, http) |
| services.project-service.ingress.enabled | bool | `false` | Enable ingress controller resource |
| services.project-service.resources.requests | object | `{"cpu":"100m","memory":"128Mi"}` | CPU/Memory resource requests |
| services.project-service.nodeSelector | object | `{}` | Node labels for pod assignment |
| services.project-service.tolerations | list | `[]` | Toleration labels for pod assignment |
| services.project-service.affinity | object | `{}` | Affinity labels for pod assignment |
| services.project-service.extraEnvVars | list | `[]` | Extra environment variables |
| services.project-service.postgres.host | string | `nil` | host name of the postgres db |
| services.project-service.postgres.port | string | `nil` | port of the postgres db |
| services.project-service.postgres.database | string | `nil` | database name |
| services.project-service.postgres.urlSecret | object | `{"key":"jdbc-uri","name":"radar-cloudnative-postgresql-appserver"}` | Kubernetes secret containing the database JDBC Connection url (disables use of 'host', 'port' and 'database' values). |
| services.project-service.postgres.user | string | `nil` | postgres user |
| services.project-service.postgres.userSecret | object | `{"key":"username","name":"radar-cloudnative-postgresql-appserver"}` | Kubernetes secret containing the database user (disables use of 'user' value). |
| services.project-service.postgres.password | string | `nil` | password of the postgres user |
| services.project-service.postgres.passwordSecret | object | `{"key":"password","name":"radar-cloudnative-postgresql-appserver"}` | Kubernetes secret containing the database password (disables use of 'password' value). |
| services.project-service.postgres.hibernateDialect | string | `"org.hibernate.dialect.PostgreSQLDialect"` |  |
| services.project-service.postgres.jdbcDriver | string | `"org.postgresql.Driver"` |  |
| services.project-service.postgres.connection_parameters | string | `""` | Additional JDBC connection parameters e.g. sslmode=verify-full. Ignored when using 'urlSecret'. |
| services.project-service.postgres.ssl.enabled | bool | `false` | set to true of the connecting to postgres using SSL |
| services.project-service.postgres.ssl.keystorepassword | string | `"keystorepassword"` |  |
| services.project-service.injectJavaOpts | bool | `true` |  |
| services.project-service.customLivenessProbe | object | `{}` | Custom livenessProbe that overrides the default one |
| services.project-service.livenessProbe.enabled | bool | `true` | Enable livenessProbe |
| services.project-service.livenessProbe.initialDelaySeconds | int | `5` | Initial delay seconds for livenessProbe |
| services.project-service.livenessProbe.periodSeconds | int | `30` | Period seconds for livenessProbe |
| services.project-service.livenessProbe.timeoutSeconds | int | `5` | Timeout seconds for livenessProbe |
| services.project-service.livenessProbe.successThreshold | int | `1` | Success threshold for livenessProbe |
| services.project-service.livenessProbe.failureThreshold | int | `3` | Failure threshold for livenessProbe |
| services.project-service.customReadinessProbe | object | `{}` | Custom readinessProbe that overrides the default one |
| services.project-service.readinessProbe.enabled | bool | `true` | Enable readinessProbe |
| services.project-service.readinessProbe.initialDelaySeconds | int | `5` | Initial delay seconds for readinessProbe |
| services.project-service.readinessProbe.periodSeconds | int | `30` | Period seconds for readinessProbe |
| services.project-service.readinessProbe.timeoutSeconds | int | `5` | Timeout seconds for readinessProbe |
| services.project-service.readinessProbe.successThreshold | int | `1` | Success threshold for readinessProbe |
| services.project-service.readinessProbe.failureThreshold | int | `3` | Failure threshold for readinessProbe |
| services.project-service.customStartupProbe | object | `{}` | Custom startupProbe that overrides the default one |
| services.project-service.startupProbe.enabled | bool | `true` | Enable startupProbe |
| services.project-service.startupProbe.initialDelaySeconds | int | `5` | Initial delay seconds for startupProbe |
| services.project-service.startupProbe.periodSeconds | int | `10` | Period seconds for startupProbe |
| services.project-service.startupProbe.timeoutSeconds | int | `10` | Timeout seconds for startupProbe |
| services.project-service.startupProbe.successThreshold | int | `1` | Success threshold for startupProbe |
| services.project-service.startupProbe.failureThreshold | int | `30` | Failure threshold for startupProbe |
| services.project-service.managementportal_url | string | `"http://management-portal:8080/managementportal"` | URL of the Management Portal |
| services.project-service.config | object | check `values.yaml` | Contents of a gateway-service.yml configuration file |
| services.project-service.networkpolicy | object | check `values.yaml` | Network policy defines who can access this application and who this applications has access to |
| services.user-service.enabled | bool | `true` |  |
| services.user-service.replicaCount | int | `1` | Number of appserver microservices replicas to deploy |
| services.user-service.image.repository | string | `"ghcr.io/radar-base/radar-appserver/user-service"` | Image repository |
| services.user-service.image.tag | string | `nil` | Image tag (immutable tags are recommended) |
| services.user-service.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| services.user-service.podSecurityContext | object | `{}` | Configure radar-appserver pods' Security Context |
| services.user-service.securityContext | object | `{}` | Configure radar-appserver containers' Security Context |
| services.user-service.service.type | string | `"ClusterIP"` | Kubernetes Service type |
| services.user-service.service.port | int | `9013` | appserver-microservices service port |
| services.user-service.ports.containerPort | int | `9013` | appserver-microservices container port |
| services.user-service.command | string | `"user-service"` | Command to run when starting the container. |
| services.user-service.disable_tls | bool | `true` | Reconfigure Ingress to not force TLS |
| services.user-service.advertised_protocol | string | `"http"` | The protocol in advertised URIs (https, http) |
| services.user-service.ingress.enabled | bool | `false` | Enable ingress controller resource |
| services.user-service.resources.requests | object | `{"cpu":"100m","memory":"128Mi"}` | CPU/Memory resource requests |
| services.user-service.nodeSelector | object | `{}` | Node labels for pod assignment |
| services.user-service.tolerations | list | `[]` | Toleration labels for pod assignment |
| services.user-service.affinity | object | `{}` | Affinity labels for pod assignment |
| services.user-service.extraEnvVars | list | `[]` | Extra environment variables |
| services.user-service.postgres.host | string | `nil` | host name of the postgres db |
| services.user-service.postgres.port | string | `nil` | port of the postgres db |
| services.user-service.postgres.database | string | `nil` | database name |
| services.user-service.postgres.urlSecret | object | `{"key":"jdbc-uri","name":"radar-cloudnative-postgresql-appserver"}` | Kubernetes secret containing the database JDBC Connection url (disables use of 'host', 'port' and 'database' values). |
| services.user-service.postgres.user | string | `nil` | postgres user |
| services.user-service.postgres.userSecret | object | `{"key":"username","name":"radar-cloudnative-postgresql-appserver"}` | Kubernetes secret containing the database user (disables use of 'user' value). |
| services.user-service.postgres.password | string | `nil` | password of the postgres user |
| services.user-service.postgres.passwordSecret | object | `{"key":"password","name":"radar-cloudnative-postgresql-appserver"}` | Kubernetes secret containing the database password (disables use of 'password' value). |
| services.user-service.postgres.hibernateDialect | string | `"org.hibernate.dialect.PostgreSQLDialect"` |  |
| services.user-service.postgres.jdbcDriver | string | `"org.postgresql.Driver"` |  |
| services.user-service.postgres.connection_parameters | string | `""` | Additional JDBC connection parameters e.g. sslmode=verify-full. Ignored when using 'urlSecret'. |
| services.user-service.postgres.ssl.enabled | bool | `false` | set to true of the connecting to postgres using SSL |
| services.user-service.postgres.ssl.keystorepassword | string | `"keystorepassword"` |  |
| services.user-service.injectJavaOpts | bool | `true` |  |
| services.user-service.customLivenessProbe | object | `{}` | Custom livenessProbe that overrides the default one |
| services.user-service.livenessProbe.enabled | bool | `true` | Enable livenessProbe |
| services.user-service.livenessProbe.initialDelaySeconds | int | `5` | Initial delay seconds for livenessProbe |
| services.user-service.livenessProbe.periodSeconds | int | `30` | Period seconds for livenessProbe |
| services.user-service.livenessProbe.timeoutSeconds | int | `5` | Timeout seconds for livenessProbe |
| services.user-service.livenessProbe.successThreshold | int | `1` | Success threshold for livenessProbe |
| services.user-service.livenessProbe.failureThreshold | int | `3` | Failure threshold for livenessProbe |
| services.user-service.customReadinessProbe | object | `{}` | Custom readinessProbe that overrides the default one |
| services.user-service.readinessProbe.enabled | bool | `true` | Enable readinessProbe |
| services.user-service.readinessProbe.initialDelaySeconds | int | `5` | Initial delay seconds for readinessProbe |
| services.user-service.readinessProbe.periodSeconds | int | `30` | Period seconds for readinessProbe |
| services.user-service.readinessProbe.timeoutSeconds | int | `5` | Timeout seconds for readinessProbe |
| services.user-service.readinessProbe.successThreshold | int | `1` | Success threshold for readinessProbe |
| services.user-service.readinessProbe.failureThreshold | int | `3` | Failure threshold for readinessProbe |
| services.user-service.customStartupProbe | object | `{}` | Custom startupProbe that overrides the default one |
| services.user-service.startupProbe.enabled | bool | `true` | Enable startupProbe |
| services.user-service.startupProbe.initialDelaySeconds | int | `5` | Initial delay seconds for startupProbe |
| services.user-service.startupProbe.periodSeconds | int | `10` | Period seconds for startupProbe |
| services.user-service.startupProbe.timeoutSeconds | int | `10` | Timeout seconds for startupProbe |
| services.user-service.startupProbe.successThreshold | int | `1` | Success threshold for startupProbe |
| services.user-service.startupProbe.failureThreshold | int | `30` | Failure threshold for startupProbe |
| services.user-service.managementportal_url | string | `"http://management-portal:8080/managementportal"` | URL of the Management Portal |
| services.user-service.config | object | check `values.yaml` | Contents of a gateway-service.yml configuration file |
| services.user-service.networkpolicy | object | check `values.yaml` | Network policy defines who can access this application and who this applications has access to |
| services.task-service.enabled | bool | `true` |  |
| services.task-service.replicaCount | int | `1` | Number of appserver microservices replicas to deploy |
| services.task-service.image.repository | string | `"ghcr.io/radar-base/radar-appserver/task-service"` | Image repository |
| services.task-service.image.tag | string | `nil` | Image tag (immutable tags are recommended) |
| services.task-service.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| services.task-service.podSecurityContext | object | `{}` | Configure radar-appserver pods' Security Context |
| services.task-service.securityContext | object | `{}` | Configure radar-appserver containers' Security Context |
| services.task-service.service.type | string | `"ClusterIP"` | Kubernetes Service type |
| services.task-service.service.port | int | `9014` | appserver-microservices service port |
| services.task-service.ports.containerPort | int | `9014` | appserver-microservices container port |
| services.task-service.command | string | `"task-service"` | Command to run when starting the container. |
| services.task-service.disable_tls | bool | `true` | Reconfigure Ingress to not force TLS |
| services.task-service.advertised_protocol | string | `"http"` | The protocol in advertised URIs (https, http) |
| services.task-service.ingress.enabled | bool | `false` | Enable ingress controller resource |
| services.task-service.resources.requests | object | `{"cpu":"100m","memory":"128Mi"}` | CPU/Memory resource requests |
| services.task-service.nodeSelector | object | `{}` | Node labels for pod assignment |
| services.task-service.tolerations | list | `[]` | Toleration labels for pod assignment |
| services.task-service.affinity | object | `{}` | Affinity labels for pod assignment |
| services.task-service.extraEnvVars | list | `[]` | Extra environment variables |
| services.task-service.postgres.host | string | `nil` | host name of the postgres db |
| services.task-service.postgres.port | string | `nil` | port of the postgres db |
| services.task-service.postgres.database | string | `nil` | database name |
| services.task-service.postgres.urlSecret | object | `{"key":"jdbc-uri","name":"radar-cloudnative-postgresql-appserver"}` | Kubernetes secret containing the database JDBC Connection url (disables use of 'host', 'port' and 'database' values). |
| services.task-service.postgres.user | string | `nil` | postgres user |
| services.task-service.postgres.userSecret | object | `{"key":"username","name":"radar-cloudnative-postgresql-appserver"}` | Kubernetes secret containing the database user (disables use of 'user' value). |
| services.task-service.postgres.password | string | `nil` | password of the postgres user |
| services.task-service.postgres.passwordSecret | object | `{"key":"password","name":"radar-cloudnative-postgresql-appserver"}` | Kubernetes secret containing the database password (disables use of 'password' value). |
| services.task-service.postgres.hibernateDialect | string | `"org.hibernate.dialect.PostgreSQLDialect"` |  |
| services.task-service.postgres.jdbcDriver | string | `"org.postgresql.Driver"` |  |
| services.task-service.postgres.connection_parameters | string | `""` | Additional JDBC connection parameters e.g. sslmode=verify-full. Ignored when using 'urlSecret'. |
| services.task-service.postgres.ssl.enabled | bool | `false` | set to true of the connecting to postgres using SSL |
| services.task-service.postgres.ssl.keystorepassword | string | `"keystorepassword"` |  |
| services.task-service.injectJavaOpts | bool | `true` |  |
| services.task-service.customLivenessProbe | object | `{}` | Custom livenessProbe that overrides the default one |
| services.task-service.livenessProbe.enabled | bool | `true` | Enable livenessProbe |
| services.task-service.livenessProbe.initialDelaySeconds | int | `5` | Initial delay seconds for livenessProbe |
| services.task-service.livenessProbe.periodSeconds | int | `30` | Period seconds for livenessProbe |
| services.task-service.livenessProbe.timeoutSeconds | int | `5` | Timeout seconds for livenessProbe |
| services.task-service.livenessProbe.successThreshold | int | `1` | Success threshold for livenessProbe |
| services.task-service.livenessProbe.failureThreshold | int | `3` | Failure threshold for livenessProbe |
| services.task-service.customReadinessProbe | object | `{}` | Custom readinessProbe that overrides the default one |
| services.task-service.readinessProbe.enabled | bool | `true` | Enable readinessProbe |
| services.task-service.readinessProbe.initialDelaySeconds | int | `5` | Initial delay seconds for readinessProbe |
| services.task-service.readinessProbe.periodSeconds | int | `30` | Period seconds for readinessProbe |
| services.task-service.readinessProbe.timeoutSeconds | int | `5` | Timeout seconds for readinessProbe |
| services.task-service.readinessProbe.successThreshold | int | `1` | Success threshold for readinessProbe |
| services.task-service.readinessProbe.failureThreshold | int | `3` | Failure threshold for readinessProbe |
| services.task-service.customStartupProbe | object | `{}` | Custom startupProbe that overrides the default one |
| services.task-service.startupProbe.enabled | bool | `true` | Enable startupProbe |
| services.task-service.startupProbe.initialDelaySeconds | int | `5` | Initial delay seconds for startupProbe |
| services.task-service.startupProbe.periodSeconds | int | `10` | Period seconds for startupProbe |
| services.task-service.startupProbe.timeoutSeconds | int | `10` | Timeout seconds for startupProbe |
| services.task-service.startupProbe.successThreshold | int | `1` | Success threshold for startupProbe |
| services.task-service.startupProbe.failureThreshold | int | `30` | Failure threshold for startupProbe |
| services.task-service.managementportal_url | string | `"http://management-portal:8080/managementportal"` | URL of the Management Portal |
| services.task-service.config | object | check `values.yaml` | Contents of a gateway-service.yml configuration file |
| services.task-service.networkpolicy | object | check `values.yaml` | Network policy defines who can access this application and who this applications has access to |
| services.cloud-mesaging-service.enabled | bool | `true` |  |
| services.cloud-mesaging-service.replicaCount | int | `1` | Number of appserver microservices replicas to deploy |
| services.cloud-mesaging-service.image.repository | string | `"ghcr.io/radar-base/radar-appserver/cloud-messaging-service"` | Image repository |
| services.cloud-mesaging-service.image.tag | string | `nil` | Image tag (immutable tags are recommended) |
| services.cloud-mesaging-service.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| services.cloud-mesaging-service.podSecurityContext | object | `{}` | Configure radar-appserver pods' Security Context |
| services.cloud-mesaging-service.securityContext | object | `{}` | Configure radar-appserver containers' Security Context |
| services.cloud-mesaging-service.service.type | string | `"ClusterIP"` | Kubernetes Service type |
| services.cloud-mesaging-service.service.port | int | `9015` | appserver-microservices service port |
| services.cloud-mesaging-service.ports.containerPort | int | `9015` | appserver-microservices container port |
| services.cloud-mesaging-service.command | string | `"cloud-messaging-service"` | Command to run when starting the container. |
| services.cloud-mesaging-service.disable_tls | bool | `true` | Reconfigure Ingress to not force TLS |
| services.cloud-mesaging-service.advertised_protocol | string | `"http"` | The protocol in advertised URIs (https, http) |
| services.cloud-mesaging-service.ingress.enabled | bool | `false` | Enable ingress controller resource |
| services.cloud-mesaging-service.resources.requests | object | `{"cpu":"100m","memory":"128Mi"}` | CPU/Memory resource requests |
| services.cloud-mesaging-service.nodeSelector | object | `{}` | Node labels for pod assignment |
| services.cloud-mesaging-service.tolerations | list | `[]` | Toleration labels for pod assignment |
| services.cloud-mesaging-service.affinity | object | `{}` | Affinity labels for pod assignment |
| services.cloud-mesaging-service.extraEnvVars | list | `[]` | Extra environment variables |
| services.cloud-mesaging-service.postgres.host | string | `nil` | host name of the postgres db |
| services.cloud-mesaging-service.postgres.port | string | `nil` | port of the postgres db |
| services.cloud-mesaging-service.postgres.database | string | `nil` | database name |
| services.cloud-mesaging-service.postgres.urlSecret | object | `{"key":"jdbc-uri","name":"radar-cloudnative-postgresql-appserver"}` | Kubernetes secret containing the database JDBC Connection url (disables use of 'host', 'port' and 'database' values). |
| services.cloud-mesaging-service.postgres.user | string | `nil` | postgres user |
| services.cloud-mesaging-service.postgres.userSecret | object | `{"key":"username","name":"radar-cloudnative-postgresql-appserver"}` | Kubernetes secret containing the database user (disables use of 'user' value). |
| services.cloud-mesaging-service.postgres.password | string | `nil` | password of the postgres user |
| services.cloud-mesaging-service.postgres.passwordSecret | object | `{"key":"password","name":"radar-cloudnative-postgresql-appserver"}` | Kubernetes secret containing the database password (disables use of 'password' value). |
| services.cloud-mesaging-service.postgres.hibernateDialect | string | `"org.hibernate.dialect.PostgreSQLDialect"` |  |
| services.cloud-mesaging-service.postgres.jdbcDriver | string | `"org.postgresql.Driver"` |  |
| services.cloud-mesaging-service.postgres.connection_parameters | string | `""` | Additional JDBC connection parameters e.g. sslmode=verify-full. Ignored when using 'urlSecret'. |
| services.cloud-mesaging-service.postgres.ssl.enabled | bool | `false` | set to true of the connecting to postgres using SSL |
| services.cloud-mesaging-service.postgres.ssl.keystorepassword | string | `"keystorepassword"` |  |
| services.cloud-mesaging-service.injectJavaOpts | bool | `true` |  |
| services.cloud-mesaging-service.google_application_credentials | string | `""` | Google credentials containing FCM server key, etc. |
| services.cloud-mesaging-service.smtp.enabled | bool | `false` | set to true, if sending of notifications via email should be enabled. |
| services.cloud-mesaging-service.smtp.host | string | `"smtp"` | Hostname of the SMTP server |
| services.cloud-mesaging-service.smtp.port | int | `25` | Port of the SMTP server |
| services.cloud-mesaging-service.smtp.username | string | `"username"` | Username of the SMTP server |
| services.cloud-mesaging-service.smtp.password | string | `"secret"` | Password of the SMTP server |
| services.cloud-mesaging-service.smtp.from | string | `"noreply@example.com"` | Email address which should be used to send activation emails |
| services.cloud-mesaging-service.smtp.starttls | bool | `false` | set to true,if TTLS should be enabled |
| services.cloud-mesaging-service.smtp.auth | bool | `true` | set to true, if the account should be authenticated before sending emails |
| services.cloud-mesaging-service.smtp.connect_timeout | int | `10000` | Timeout (ms) for establishing TCP connection to server |
| services.cloud-mesaging-service.smtp.read_timeout | int | `10000` | Timeout (ms) for read operations (socket read timeout), waiting for server responses |
| services.cloud-mesaging-service.customLivenessProbe | object | `{}` | Custom livenessProbe that overrides the default one |
| services.cloud-mesaging-service.livenessProbe.enabled | bool | `true` | Enable livenessProbe |
| services.cloud-mesaging-service.livenessProbe.initialDelaySeconds | int | `5` | Initial delay seconds for livenessProbe |
| services.cloud-mesaging-service.livenessProbe.periodSeconds | int | `30` | Period seconds for livenessProbe |
| services.cloud-mesaging-service.livenessProbe.timeoutSeconds | int | `5` | Timeout seconds for livenessProbe |
| services.cloud-mesaging-service.livenessProbe.successThreshold | int | `1` | Success threshold for livenessProbe |
| services.cloud-mesaging-service.livenessProbe.failureThreshold | int | `3` | Failure threshold for livenessProbe |
| services.cloud-mesaging-service.customReadinessProbe | object | `{}` | Custom readinessProbe that overrides the default one |
| services.cloud-mesaging-service.readinessProbe.enabled | bool | `true` | Enable readinessProbe |
| services.cloud-mesaging-service.readinessProbe.initialDelaySeconds | int | `5` | Initial delay seconds for readinessProbe |
| services.cloud-mesaging-service.readinessProbe.periodSeconds | int | `30` | Period seconds for readinessProbe |
| services.cloud-mesaging-service.readinessProbe.timeoutSeconds | int | `5` | Timeout seconds for readinessProbe |
| services.cloud-mesaging-service.readinessProbe.successThreshold | int | `1` | Success threshold for readinessProbe |
| services.cloud-mesaging-service.readinessProbe.failureThreshold | int | `3` | Failure threshold for readinessProbe |
| services.cloud-mesaging-service.customStartupProbe | object | `{}` | Custom startupProbe that overrides the default one |
| services.cloud-mesaging-service.startupProbe.enabled | bool | `true` | Enable startupProbe |
| services.cloud-mesaging-service.startupProbe.initialDelaySeconds | int | `5` | Initial delay seconds for startupProbe |
| services.cloud-mesaging-service.startupProbe.periodSeconds | int | `10` | Period seconds for startupProbe |
| services.cloud-mesaging-service.startupProbe.timeoutSeconds | int | `10` | Timeout seconds for startupProbe |
| services.cloud-mesaging-service.startupProbe.successThreshold | int | `1` | Success threshold for startupProbe |
| services.cloud-mesaging-service.startupProbe.failureThreshold | int | `30` | Failure threshold for startupProbe |
| services.cloud-mesaging-service.managementportal_url | string | `"http://management-portal:8080/managementportal"` | URL of the Management Portal |
| services.cloud-mesaging-service.config | object | check `values.yaml` | Contents of a gateway-service.yml configuration file |
| services.cloud-mesaging-service.networkpolicy | object | check `values.yaml` | Network policy defines who can access this application and who this applications has access to |
| services.github-service.enabled | bool | `true` |  |
| services.github-service.replicaCount | int | `1` | Number of appserver microservices replicas to deploy |
| services.github-service.image.repository | string | `"ghcr.io/radar-base/radar-appserver/github-service"` | Image repository |
| services.github-service.image.tag | string | `nil` | Image tag (immutable tags are recommended) |
| services.github-service.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| services.github-service.podSecurityContext | object | `{}` | Configure radar-appserver pods' Security Context |
| services.github-service.securityContext | object | `{}` | Configure radar-appserver containers' Security Context |
| services.github-service.service.type | string | `"ClusterIP"` | Kubernetes Service type |
| services.github-service.service.port | int | `9011` | appserver-microservices service port |
| services.github-service.ports.containerPort | int | `9011` | appserver-microservices container port |
| services.github-service.command | string | `"github-service"` | Command to run when starting the container. |
| services.github-service.disable_tls | bool | `true` | Reconfigure Ingress to not force TLS |
| services.github-service.advertised_protocol | string | `"http"` | The protocol in advertised URIs (https, http) |
| services.github-service.ingress.enabled | bool | `false` | Enable ingress controller resource |
| services.github-service.resources.requests | object | `{"cpu":"100m","memory":"128Mi"}` | CPU/Memory resource requests |
| services.github-service.nodeSelector | object | `{}` | Node labels for pod assignment |
| services.github-service.tolerations | list | `[]` | Toleration labels for pod assignment |
| services.github-service.affinity | object | `{}` | Affinity labels for pod assignment |
| services.github-service.extraEnvVars | list | `[]` | Extra environment variables |
| services.github-service.injectJavaOpts | bool | `true` |  |
| services.github-service.customLivenessProbe | object | `{}` | Custom livenessProbe that overrides the default one |
| services.github-service.livenessProbe.enabled | bool | `true` | Enable livenessProbe |
| services.github-service.livenessProbe.initialDelaySeconds | int | `5` | Initial delay seconds for livenessProbe |
| services.github-service.livenessProbe.periodSeconds | int | `30` | Period seconds for livenessProbe |
| services.github-service.livenessProbe.timeoutSeconds | int | `5` | Timeout seconds for livenessProbe |
| services.github-service.livenessProbe.successThreshold | int | `1` | Success threshold for livenessProbe |
| services.github-service.livenessProbe.failureThreshold | int | `3` | Failure threshold for livenessProbe |
| services.github-service.customReadinessProbe | object | `{}` | Custom readinessProbe that overrides the default one |
| services.github-service.readinessProbe.enabled | bool | `true` | Enable readinessProbe |
| services.github-service.readinessProbe.initialDelaySeconds | int | `5` | Initial delay seconds for readinessProbe |
| services.github-service.readinessProbe.periodSeconds | int | `30` | Period seconds for readinessProbe |
| services.github-service.readinessProbe.timeoutSeconds | int | `5` | Timeout seconds for readinessProbe |
| services.github-service.readinessProbe.successThreshold | int | `1` | Success threshold for readinessProbe |
| services.github-service.readinessProbe.failureThreshold | int | `3` | Failure threshold for readinessProbe |
| services.github-service.customStartupProbe | object | `{}` | Custom startupProbe that overrides the default one |
| services.github-service.startupProbe.enabled | bool | `true` | Enable startupProbe |
| services.github-service.startupProbe.initialDelaySeconds | int | `5` | Initial delay seconds for startupProbe |
| services.github-service.startupProbe.periodSeconds | int | `10` | Period seconds for startupProbe |
| services.github-service.startupProbe.timeoutSeconds | int | `10` | Timeout seconds for startupProbe |
| services.github-service.startupProbe.successThreshold | int | `1` | Success threshold for startupProbe |
| services.github-service.startupProbe.failureThreshold | int | `30` | Failure threshold for startupProbe |
| services.github-service.managementportal_url | string | `"http://management-portal:8080/managementportal"` | URL of the Management Portal |
| services.github-service.config | object | check `values.yaml` | Contents of a gateway-service.yml configuration file |
| services.github-service.networkpolicy | object | check `values.yaml` | Network policy defines who can access this application and who this applications has access to |
| services.protocol-service.enabled | bool | `true` |  |
| services.protocol-service.replicaCount | int | `1` | Number of appserver microservices replicas to deploy |
| services.protocol-service.image.repository | string | `"ghcr.io/radar-base/radar-appserver/protocol-service"` | Image repository |
| services.protocol-service.image.tag | string | `nil` | Image tag (immutable tags are recommended) |
| services.protocol-service.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| services.protocol-service.podSecurityContext | object | `{}` | Configure radar-appserver pods' Security Context |
| services.protocol-service.securityContext | object | `{}` | Configure radar-appserver containers' Security Context |
| services.protocol-service.service.type | string | `"ClusterIP"` | Kubernetes Service type |
| services.protocol-service.service.port | int | `9012` | appserver-microservices service port |
| services.protocol-service.ports.containerPort | int | `9012` | appserver-microservices container port |
| services.protocol-service.command | string | `"protocol-service"` | Command to run when starting the container. |
| services.protocol-service.disable_tls | bool | `true` | Reconfigure Ingress to not force TLS |
| services.protocol-service.advertised_protocol | string | `"http"` | The protocol in advertised URIs (https, http) |
| services.protocol-service.ingress.enabled | bool | `false` | Enable ingress controller resource |
| services.protocol-service.resources.requests | object | `{"cpu":"100m","memory":"128Mi"}` | CPU/Memory resource requests |
| services.protocol-service.nodeSelector | object | `{}` | Node labels for pod assignment |
| services.protocol-service.tolerations | list | `[]` | Toleration labels for pod assignment |
| services.protocol-service.affinity | object | `{}` | Affinity labels for pod assignment |
| services.protocol-service.extraEnvVars | list | `[]` | Extra environment variables |
| services.protocol-service.injectJavaOpts | bool | `true` |  |
| services.protocol-service.customLivenessProbe | object | `{}` | Custom livenessProbe that overrides the default one |
| services.protocol-service.livenessProbe.enabled | bool | `true` | Enable livenessProbe |
| services.protocol-service.livenessProbe.initialDelaySeconds | int | `5` | Initial delay seconds for livenessProbe |
| services.protocol-service.livenessProbe.periodSeconds | int | `30` | Period seconds for livenessProbe |
| services.protocol-service.livenessProbe.timeoutSeconds | int | `5` | Timeout seconds for livenessProbe |
| services.protocol-service.livenessProbe.successThreshold | int | `1` | Success threshold for livenessProbe |
| services.protocol-service.livenessProbe.failureThreshold | int | `3` | Failure threshold for livenessProbe |
| services.protocol-service.customReadinessProbe | object | `{}` | Custom readinessProbe that overrides the default one |
| services.protocol-service.readinessProbe.enabled | bool | `true` | Enable readinessProbe |
| services.protocol-service.readinessProbe.initialDelaySeconds | int | `5` | Initial delay seconds for readinessProbe |
| services.protocol-service.readinessProbe.periodSeconds | int | `30` | Period seconds for readinessProbe |
| services.protocol-service.readinessProbe.timeoutSeconds | int | `5` | Timeout seconds for readinessProbe |
| services.protocol-service.readinessProbe.successThreshold | int | `1` | Success threshold for readinessProbe |
| services.protocol-service.readinessProbe.failureThreshold | int | `3` | Failure threshold for readinessProbe |
| services.protocol-service.customStartupProbe | object | `{}` | Custom startupProbe that overrides the default one |
| services.protocol-service.startupProbe.enabled | bool | `true` | Enable startupProbe |
| services.protocol-service.startupProbe.initialDelaySeconds | int | `5` | Initial delay seconds for startupProbe |
| services.protocol-service.startupProbe.periodSeconds | int | `10` | Period seconds for startupProbe |
| services.protocol-service.startupProbe.timeoutSeconds | int | `10` | Timeout seconds for startupProbe |
| services.protocol-service.startupProbe.successThreshold | int | `1` | Success threshold for startupProbe |
| services.protocol-service.startupProbe.failureThreshold | int | `30` | Failure threshold for startupProbe |
| services.protocol-service.managementportal_url | string | `"http://management-portal:8080/managementportal"` | URL of the Management Portal |
| services.protocol-service.config | object | check `values.yaml` | Contents of a gateway-service.yml configuration file |
| services.protocol-service.networkpolicy | object | check `values.yaml` | Network policy defines who can access this application and who this applications has access to |
