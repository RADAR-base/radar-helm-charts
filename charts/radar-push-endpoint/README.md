

# radar-push-endpoint
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-push-endpoint)](https://artifacthub.io/packages/helm/radar-base/radar-push-endpoint)

![Version: 0.6.9](https://img.shields.io/badge/Version-0.6.9-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.4.0](https://img.shields.io/badge/AppVersion-0.4.0-informational?style=flat-square)

A Helm chart for RADAR-base Push Endpoint. REST Gateway to Kafka, for incoming data from Push or Subscription based WEB APIs. It performs authentication, authorization and content validation. For more details of the configurations, see https://github.com/RADAR-base/RADAR-PushEndpoint.

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Yatharth Ranjan | <yatharth.ranjan@kcl.ac.uk> | <https://www.kcl.ac.uk/people/yatharth-ranjan> |
| Pauline Conde | <pauline.conde@kcl.ac.uk> | <https://www.kcl.ac.uk/people/pauline-conde> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-push-endpoint>
* <https://github.com/RADAR-base/RADAR-PushEndpoint>

## Prerequisites
* Kubernetes 1.28+
* Kubectl 1.28+
* Helm 3.1.0+
* [metrics-server](https://github.com/kubernetes-sigs/metrics-server) is required in the cluster when HPA is enabled (`hpa.enabled=true`)

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://radar-base.github.io/radar-helm-charts | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `2` | Number of radar-push-endpoint replicas to deploy |
| image.registry | string | `"docker.io"` | Image registry |
| image.repository | string | `"radarbase/radar-push-endpoint"` | Image repository |
| image.tag | string | `nil` | Image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| image.digest | string | `""` | Image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.pullSecrets | list | `[]` | Optionally specify an array of imagePullSecrets. Secrets must be manually created in the namespace. e.g: pullSecrets:   - myRegistryKeySecretName  |
| image_exporter.registry | string | `"docker.io"` | Image registry |
| image_exporter.repository | string | `"sscaling/jmx-prometheus-exporter"` | Image repository |
| image_exporter.tag | string | `nil` | Image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| image_exporter.digest | string | `"sha256:48e3bd31f132146751e449429a3e8a260b141f2acd587878fc50b3eda4466c5d"` | Image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag |
| image_exporter.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image_exporter.pullSecrets | list | `[]` | Optionally specify an array of imagePullSecrets. Secrets must be manually created in the namespace. e.g: pullSecrets:   - myRegistryKeySecretName  |
| nameOverride | string | `""` | String to partially override radar-push-endpoint.fullname template with a string (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override radar-push-endpoint.fullname template with a string |
| podSecurityContext | object | `{}` | Configure radar-push-endpoint pods' Security Context |
| securityContext | object | `{}` | Configure radar-push-endpoint containers' Security Context |
| service.type | string | `"ClusterIP"` | Kubernetes Service type |
| service.port | int | `8090` | radar-push-endpoint port |
| disable_tls | bool | `false` | Reconfigure Ingress to not force TLS |
| ingress.enabled | bool | `true` | Enable ingress controller resource |
| ingress.annotations | object | check values.yaml | Annotations that define default ingress class, certificate issuer and deny access to sensitive URLs |
| ingress.path | string | `"/push-endpoint/?(.*)"` | Path within the url structure. Regex capture feeding `rewrite-target` above. |
| ingress.pathType | string | `"ImplementationSpecific"` | Ingress Path type |
| ingress.ingressClassName | string | `"nginx"` | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+) |
| ingress.hosts | list | `["localhost"]` | Hosts to accept requests from |
| ingress.tls.secretName | string | `"radar-base-tls"` | Name of the secret that contains TLS certificates |
| resources.requests | object | `{"cpu":"100m","memory":"128Mi"}` | CPU/Memory resource requests |
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
| serviceMonitor.enabled | bool | `true` | Enable metrics to be collected via Prometheus-operator |
| hpa.enabled | bool | `false` | Enable HPA |
| hpa.maxReplicas | string | `"5"` | Maximum number of replicas |
| hpa.targetCPU | string | `"80"` | Target CPU utilization percentage |
| hpa.targetMemory | string | `nil` | Target Memory utilization percentage |
| networkpolicy | object | check `values.yaml` | Network policy defines who can access this application and who this applications has access to |
| schemaRegistry | string | `"http://radar-kafka-schema-registry:8081"` | Schema Registry URL |
| max_requests | int | `1000` | Not used. To be confirmed |
| bootstrapServers | string | `"radar-kafka-kafka-bootstrap:9094"` | Kafka broker URLs |
| checkSourceId | bool | `true` | set to true, if sources in access token should be validated |
| adminProperties | object | `{"sasl.mechanism":"SCRAM-SHA-512","security.protocol":"SASL_PLAINTEXT"}` | Additional Kafka Admin Client settings as key value pairs. Read from https://kafka.apache.org/documentation/#adminclientconfigs. |
| adminProperties."security.protocol" | string | `"SASL_PLAINTEXT"` | Protocol used to communicate with brokers. Valid values are: PLAINTEXT, SSL, SASL_PLAINTEXT, SASL_SSL. |
| adminProperties."sasl.mechanism" | string | `"SCRAM-SHA-512"` | Mechanism used to authenticate with SASL. Valid values are: PLAIN, SCRAM-SHA-256, SCRAM-SHA-512. |
| producerProperties | object | `{"compression.type":"lz4","sasl.mechanism":"SCRAM-SHA-512","security.protocol":"SASL_PLAINTEXT"}` | Kafka producer properties as key value pairs. Read from https://kafka.apache.org/documentation/#producerconfigs. |
| producerProperties."security.protocol" | string | `"SASL_PLAINTEXT"` | Protocol used to communicate with brokers. Valid values are: PLAINTEXT, SSL, SASL_PLAINTEXT, SASL_SSL. |
| producerProperties."sasl.mechanism" | string | `"SCRAM-SHA-512"` | Mechanism used to authenticate with SASL. Valid values are: PLAIN, SCRAM-SHA-256, SCRAM-SHA-512. |
| serializationProperties | object | `{}` | Additional Kafka serialization settings, used in KafkaAvroSerializer. Read from [io.confluent.kafka.serializers.AbstractKafkaSchemaSetDeConfig]. |
| secret.admin.jaas | object | `{"key":"sasl.jaas.config","name":"shared-service-user"}` | Secret for the Kafka SASL JAAS configuration |
| secret.producer.jaas | object | `{"key":"sasl.jaas.config","name":"shared-service-user"}` | Secret for the Kafka SASL JAAS configuration |
| cc.enabled | bool | `false` | set to true, if requests should be forwarded to Confluent Cloud based brokers. |
| cc.apiKey | string | `"ccApikey"` | Confluent Cloud cluster API key |
| cc.apiSecret | string | `"ccApiSecret"` | Confluent Cloud cluster API secret |
| cc.schemaRegistryApiKey | string | `"srApiKey"` | Confluent Cloud schema registry API key |
| cc.schemaRegistryApiSecret | string | `"srApiSecret"` | Confluent Cloud schema registry API secret |
| garmin.enabled | bool | `true` | Whether to enable Garmin endpoints |
| garmin.oauthVersion | string | `""` | OAuth version to use: "oauth2" for PKCE flow, "oauth1" for legacy flow. Only understood by PushEndpoint builds that carry the Garmin OAuth2 migration; other builds reject the unknown key and refuse to start, so leave this empty to omit it from the config entirely. |
| garmin.consumerKey | string | `"consumerKey"` | Consumer key for you application in Garmin Health API developer portal |
| garmin.consumerSecret | string | `"consumerSecret"` | Consumer secret for you application in Garmin Health API developer portal |
| garmin.userRepositoryClass | string | `"org.radarbase.push.integration.garmin.user.GarminServiceUserRepository"` | The user repository to use for getting list of users and their authorization information |
| garmin.userRepositoryUrl | string | `"http://radar-rest-sources-backend:8080/rest-sources/backend"` | The base url of the user repository if the repository is http(s) based. |
| garmin.userRepositoryClientId | string | `"radar_push_endpoint"` | The client ID to access the user repository if the repository requires authorization |
| garmin.userRepositoryClientSecret | string | `"secret"` | The client secret to access the user repository if the repository requires authorization |
| garmin.userRepositoryTokenUrl | string | `"http://management-portal:8080/managementportal/oauth/token"` | The token URL for authentication (Usually the management portal token url). Make sure to avoid trailing slash (/) in the url. |
| garmin.backfill.enabled | bool | `true` | Whether to enable Garmin backfill requests |
| garmin.backfill.activitiesEnabled | bool | `true` | Whether to enable Garmin backfill requests for activities |
| garmin.backfill.activityDetailsEnabled | bool | `true` | Whether to enable Garmin backfill requests for activity details |
| garmin.backfill.bodyCompositionsEnabled | bool | `true` | Whether to enable Garmin backfill requests for body composition |
| garmin.backfill.dailiesEnabled | bool | `true` | Whether to enable Garmin backfill requests for dailies |
| garmin.backfill.epochSummariesEnabled | bool | `true` | Whether to enable Garmin backfill requests for epoch summaries |
| garmin.backfill.pulseOXEnabled | bool | `true` | Whether to enable Garmin backfill requests for pulse oximeter |
| garmin.backfill.sleepsEnabled | bool | `true` | Whether to enable Garmin backfill requests for sleep |
| garmin.backfill.stressEnabled | bool | `true` | Whether to enable Garmin backfill requests for stress |
| garmin.backfill.userMetricsEnabled | bool | `true` | Whether to enable Garmin backfill requests for user metrics |
| garmin.backfill.moveIQEnabled | bool | `true` | Whether to enable Garmin backfill requests for moveIQ |
| garmin.backfill.respirationEnabled | bool | `true` | Whether to enable Garmin backfill requests for respiration |
| garmin.backfill.bloodPressureEnabled | bool | `false` | Whether to enable blood pressure backfill requests |
| garmin.backfill.healthSnapshotEnabled | bool | `false` | Whether to enable health snapshot backfill requests |
| garmin.backfill.heartRateVariabilityEnabled | bool | `false` | Whether to enable heart rate variability backfill requests |
| googlehealth.enabled | bool | `false` | Whether to enable the Google Health API integration (webhook receiver, subscriber registration and backfill) |
| googlehealth.userRepositoryClass | string | `"org.radarbase.push.integration.google.user.GoogleHealthServiceUserRepository"` | The user repository to use for getting list of users and their authorization information |
| googlehealth.userRepositoryUrl | string | `"http://radar-rest-sources-backend:8080/rest-sources/backend/"` | The base url of the user repository (the Rest Source Auth backend) |
| googlehealth.userRepositoryClientId | string | `"radar_pushendpoint"` | The client ID to access the user repository |
| googlehealth.userRepositoryClientSecret | string | `"secret"` | The client secret to access the user repository |
| googlehealth.userRepositoryTokenUrl | string | `"http://radar-rest-sources-backend:8080/rest-sources/backend/token/"` | The token URL to authenticate against the user repository |
| googlehealth.apiBaseUrl | string | `"https://health.googleapis.com/v4"` | Base URL of the Google Health API |
| googlehealth.googleCloudProjectId | string | `""` | Google Cloud project that owns the Health API subscriber. Required when `googlehealth.enabled` is true. |
| googlehealth.subscriberId | string | `"radar-pep"` | Subscriber id registered with Google. MUST be unique per deployment (e.g. radar-pep-stage) and MUST match `googleHealth.subscriberId` in the radar-rest-sources-backend chart, which hangs the per-user subscriptions off this subscriber. |
| googlehealth.subscriberEndpointUri | string | `""` | Publicly reachable URL Google delivers webhook PINGs to, e.g. https://<serverName>/push-endpoint/googlehealth/notifications |
| googlehealth.subscriberSecret | string | `""` | 32+ byte random string. Google echoes it back as the Authorization header on every PING. |
| googlehealth.subscriptionCreatePolicy | string | `"MANUAL"` | How Google creates per-user subscriptions for this subscriber (MANUAL or AUTOMATIC). Keep MANUAL: the Rest Source Auth backend creates and deletes the subscriptions explicitly. |
| googlehealth.serviceAccount.path | string | `"/etc/google/gha-service-account.json"` | Path the Google service-account JSON is mounted at inside the container. Also passed as GOOGLE_HEALTH_SERVICE_ACCOUNT_PATH. Without a readable key, subscriber registration does not run. |
| googlehealth.serviceAccount.key | string | `""` | Inline service-account JSON, rendered into this chart's Secret under the `ghaServiceAccountKey` key. Supply it with `helm upgrade --set-file googlehealth.serviceAccount.key=<sa.json>` rather than pasting it into values.yaml, so the credential never reaches git. Defaults to `{}` so the key always exists and can be replaced later by editing the Secret directly, followed by a `kubectl rollout restart` since subPath mounts do not refresh in place. |
| googlehealth.triggerDataTypes | list | `["steps","heart-rate","heart-rate-variability","daily-resting-heart-rate","respiratory-rate-sleep-summary","daily-sleep-temperature-derivations","sleep","exercise","floors","sedentary-period","activity-level"]` | Data types the subscriber subscribes to, i.e. the ones that generate PINGs. MUST stay identical to `googleHealth.dataTypes` in the radar-rest-sources-backend chart, which subscribes each user to the same set — a type listed there but not here never yields a webhook trigger. |
| googlehealth.enabledDataTypes | list | `["steps","heart-rate","heart-rate-variability","oxygen-saturation","total-calories","daily-resting-heart-rate","respiratory-rate-sleep-summary","daily-sleep-temperature-derivations","sleep","exercise","electrocardiogram","irregular-rhythm-notification","floors","sedentary-period","activity-level"]` | All data types fetched and produced to Kafka. Superset of `triggerDataTypes`; non-trigger types are caught up via the offset cursor rather than by a PING. |
| googlehealth.exerciseTcxEnabled | bool | `true` | Whether to fetch the TCX route/track detail attached to exercise sessions |
| googlehealth.electrocardiogramEnabled | bool | `false` | Whether to collect electrocardiogram waveforms. Large payloads and no webhook, so off by default. |
| googlehealth.backfill.enabled | bool | `true` | Whether to enable historical backfill of Google Health data |
| googlehealth.backfill.maxThreads | int | `4` | Number of threads used by the backfill workers |
| googlehealth.backfill.chunkSizeDays | int | `7` | Size in days of a single backfill request window |
| googlehealth.backfill.iterationIntervalMinutes | int | `10` | Minutes between two backfill iterations |
| googlehealth.backfill.lockPrefix | string | `"radar-push-googlehealth/lock"` | Key prefix for the redis locks used to coordinate backfill across replicas |
| redis.url | string | `"redis://radar-redis-replication-master:6379"` | The redis server URL. Redis is used to keep track of garmin backfill progress and any other key value properties. |
| podDisruptionBudget.enabled | bool | `false` | Enable Pod Disruption Budget |
| podDisruptionBudget.minAvailable | int | `1` | Minimum number of pods that must be available during disruptions |
| podDisruptionBudget.maxUnavailable | string | `nil` | Maximum number of pods that can be unavailable during disruptions |
