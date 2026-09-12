

# radar-airflow

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

A Helm chart for Airflow used by RADAR-base

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Heet Sankesara | <heet.sankesara@kcl.ac.uk> | <https://phidatalab.org/team/heet-sankesara/> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-airflow>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../external/airflow | airflow | 1.20.0 |
| https://radar-base.github.io/radar-helm-charts | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| airflow.airflowHome | string | `"/opt/airflow"` |  |
| airflow.defaultAirflowRepository | string | `"apache/airflow"` |  |
| airflow.defaultAirflowTag | string | `"3.1.8"` |  |
| airflow.airflowVersion | string | `"3.1.8"` |  |
| airflow.executor | string | `"KubernetesExecutor"` |  |
| airflow.nodeSelector | object | `{}` |  |
| airflow.affinity | object | `{}` |  |
| airflow.tolerations | list | `[]` |  |
| airflow.topologySpreadConstraints | list | `[]` |  |
| airflow.labels | object | `{}` |  |
| airflow.imagePullSecrets | list | `[]` |  |
| airflow.ingress.apiServer.enabled | bool | `true` |  |
| airflow.ingress.apiServer.annotations."cert-manager.io/cluster-issuer" | string | `"self-signed-issuer"` |  |
| airflow.ingress.apiServer.path | string | `"/"` |  |
| airflow.ingress.apiServer.pathType | string | `"ImplementationSpecific"` |  |
| airflow.ingress.apiServer.hosts[0].name | string | `"airflow.localhost"` |  |
| airflow.ingress.apiServer.hosts[0].tls.enabled | bool | `true` |  |
| airflow.ingress.apiServer.hosts[0].tls.secretName | string | `"airflow-tls"` |  |
| airflow.ingress.flower.enabled | bool | `false` |  |
| airflow.ingress.statsd.enabled | bool | `false` |  |
| airflow.ingress.pgbouncer.enabled | bool | `false` |  |
| airflow.env | list | `[]` |  |
| airflow.volumes | list | `[]` |  |
| airflow.volumeMounts | list | `[]` |  |
| airflow.secret | list | `[]` |  |
| airflow.enableBuiltInSecretEnvVars.AIRFLOW__CORE__FERNET_KEY | bool | `true` |  |
| airflow.enableBuiltInSecretEnvVars.AIRFLOW__DATABASE__SQL_ALCHEMY_CONN | bool | `true` |  |
| airflow.enableBuiltInSecretEnvVars.AIRFLOW_CONN_AIRFLOW_DB | bool | `true` |  |
| airflow.enableBuiltInSecretEnvVars.AIRFLOW__API__SECRET_KEY | bool | `true` |  |
| airflow.enableBuiltInSecretEnvVars.AIRFLOW__API_AUTH__JWT_SECRET | bool | `true` |  |
| airflow.enableBuiltInSecretEnvVars.AIRFLOW__WEBSERVER__SECRET_KEY | bool | `true` |  |
| airflow.enableBuiltInSecretEnvVars.AIRFLOW__CELERY__RESULT_BACKEND | bool | `true` |  |
| airflow.enableBuiltInSecretEnvVars.AIRFLOW__CELERY__BROKER_URL | bool | `true` |  |
| airflow.enableBuiltInSecretEnvVars.AIRFLOW__ELASTICSEARCH__HOST | bool | `true` |  |
| airflow.enableBuiltInSecretEnvVars.AIRFLOW__OPENSEARCH__HOST | bool | `true` |  |
| airflow.data.metadataSecretName | string | `nil` |  |
| airflow.data.resultBackendSecretName | string | `nil` |  |
| airflow.data.brokerUrlSecretName | string | `nil` |  |
| airflow.data.metadataConnection.user | string | `"postgres"` |  |
| airflow.data.metadataConnection.pass | string | `"postgres"` |  |
| airflow.data.metadataConnection.protocol | string | `"postgresql"` |  |
| airflow.data.metadataConnection.host | string | `nil` |  |
| airflow.data.metadataConnection.port | int | `5432` |  |
| airflow.data.metadataConnection.db | string | `"postgres"` |  |
| airflow.data.metadataConnection.sslmode | string | `"disable"` |  |
| airflow.data.metadataConnection.secretAnnotations | object | `{}` |  |
| airflow.data.resultBackendConnection | string | `nil` |  |
| airflow.data.resultBackendConnectionSecretAnnotations | object | `{}` |  |
| airflow.data.brokerUrl | string | `nil` |  |
| airflow.data.brokerUrlSecretAnnotations | object | `{}` |  |
| airflow.workers.replicas | int | `1` |  |
| airflow.workers.kubernetes.resources | object | `{}` |  |
| airflow.scheduler.enabled | bool | `true` |  |
| airflow.scheduler.replicas | int | `1` |  |
| airflow.createUserJob.enabled | bool | `true` |  |
| airflow.createUserJob.defaultUser.role | string | `"Admin"` |  |
| airflow.createUserJob.defaultUser.username | string | `"admin"` |  |
| airflow.createUserJob.defaultUser.email | string | `"admin@example.com"` |  |
| airflow.createUserJob.defaultUser.firstName | string | `"admin"` |  |
| airflow.createUserJob.defaultUser.lastName | string | `"user"` |  |
| airflow.createUserJob.defaultUser.password | string | `"admin"` |  |
| airflow.apiServer.enabled | bool | `true` |  |
| airflow.apiServer.replicas | int | `1` |  |
| airflow.apiServer.hpa.enabled | bool | `false` |  |
| airflow.apiServer.hpa.minReplicaCount | int | `1` |  |
| airflow.apiServer.hpa.maxReplicaCount | int | `5` |  |
| airflow.apiServer.hpa.metrics[0].type | string | `"Resource"` |  |
| airflow.apiServer.hpa.metrics[0].resource.name | string | `"cpu"` |  |
| airflow.apiServer.hpa.metrics[0].resource.target.type | string | `"Utilization"` |  |
| airflow.apiServer.hpa.metrics[0].resource.target.averageUtilization | int | `50` |  |
| airflow.apiServer.hpa.behavior | object | `{}` |  |
| airflow.triggerer.enabled | bool | `true` |  |
| airflow.triggerer.replicas | int | `1` |  |
| airflow.dagProcessor.enabled | string | `nil` |  |
| airflow.dagProcessor.dagBundleConfigList[0].name | string | `"dags-folder"` |  |
| airflow.dagProcessor.dagBundleConfigList[0].classpath | string | `"airflow.dag_processing.bundles.local.LocalDagBundle"` |  |
| airflow.dagProcessor.dagBundleConfigList[0].kwargs | object | `{}` |  |
| airflow.dagProcessor.replicas | int | `1` |  |
| airflow.flower.enabled | bool | `false` |  |
| airflow.statsd.configMapAnnotations | object | `{}` |  |
| airflow.statsd.enabled | bool | `true` |  |
| airflow.pgbouncer.enabled | bool | `false` |  |
| airflow.pgbouncer.replicas | int | `1` |  |
| airflow.pgbouncer.revisionHistoryLimit | string | `nil` |  |
| airflow.pgbouncer.command[0] | string | `"pgbouncer"` |  |
| airflow.pgbouncer.command[1] | string | `"-u"` |  |
| airflow.pgbouncer.command[2] | string | `"nobody"` |  |
| airflow.pgbouncer.command[3] | string | `"/etc/pgbouncer/pgbouncer.ini"` |  |
| airflow.pgbouncer.args | string | `nil` |  |
| airflow.pgbouncer.auth_type | string | `"scram-sha-256"` |  |
| airflow.pgbouncer.auth_file | string | `"/etc/pgbouncer/users.txt"` |  |
| airflow.pgbouncer.mountConfigSecret | bool | `true` |  |
| airflow.pgbouncer.annotations | object | `{}` |  |
| airflow.pgbouncer.podAnnotations | object | `{}` |  |
| airflow.pgbouncer.certificatesSecretAnnotations | object | `{}` |  |
| airflow.pgbouncer.serviceAccount.automountServiceAccountToken | bool | `true` |  |
| airflow.pgbouncer.serviceAccount.create | bool | `true` |  |
| airflow.pgbouncer.serviceAccount.name | string | `nil` |  |
| airflow.pgbouncer.serviceAccount.annotations | object | `{}` |  |
| airflow.pgbouncer.extraNetworkPolicies | list | `[]` |  |
| airflow.pgbouncer.metadataPoolSize | int | `10` |  |
| airflow.pgbouncer.resultBackendPoolSize | int | `5` |  |
| airflow.pgbouncer.maxClientConn | int | `100` |  |
| airflow.pgbouncer.configSecretName | string | `nil` |  |
| airflow.pgbouncer.configSecretAnnotations | object | `{}` |  |
| airflow.pgbouncer.podDisruptionBudget.enabled | bool | `false` |  |
| airflow.pgbouncer.podDisruptionBudget.config.maxUnavailable | int | `1` |  |
| airflow.pgbouncer.resources | object | `{}` |  |
| airflow.pgbouncer.service.extraAnnotations | object | `{}` |  |
| airflow.pgbouncer.service.clusterIp | string | `nil` |  |
| airflow.pgbouncer.verbose | int | `0` |  |
| airflow.pgbouncer.logDisconnections | int | `0` |  |
| airflow.pgbouncer.logConnections | int | `0` |  |
| airflow.pgbouncer.sslmode | string | `"prefer"` |  |
| airflow.pgbouncer.ciphers | string | `"normal"` |  |
| airflow.pgbouncer.ssl.ca | string | `nil` |  |
| airflow.pgbouncer.ssl.cert | string | `nil` |  |
| airflow.pgbouncer.ssl.key | string | `nil` |  |
| airflow.pgbouncer.extraIniMetadata | string | `nil` |  |
| airflow.pgbouncer.extraIniResultBackend | string | `nil` |  |
| airflow.pgbouncer.extraIni | string | `nil` |  |
| airflow.pgbouncer.extraVolumes | list | `[]` |  |
| airflow.pgbouncer.extraVolumeMounts | list | `[]` |  |
| airflow.pgbouncer.extraContainers | list | `[]` |  |
| airflow.pgbouncer.nodeSelector | object | `{}` |  |
| airflow.pgbouncer.affinity | object | `{}` |  |
| airflow.pgbouncer.tolerations | list | `[]` |  |
| airflow.pgbouncer.topologySpreadConstraints | list | `[]` |  |
| airflow.pgbouncer.priorityClassName | string | `nil` |  |
| airflow.pgbouncer.uid | int | `65534` |  |
| airflow.pgbouncer.securityContexts.pod | object | `{}` |  |
| airflow.pgbouncer.securityContexts.container | object | `{}` |  |
| airflow.pgbouncer.containerLifecycleHooks.preStop.exec.command[0] | string | `"/bin/sh"` |  |
| airflow.pgbouncer.containerLifecycleHooks.preStop.exec.command[1] | string | `"-c"` |  |
| airflow.pgbouncer.containerLifecycleHooks.preStop.exec.command[2] | string | `"killall -INT pgbouncer && sleep 120"` |  |
| airflow.pgbouncer.metricsExporterSidecar.resources | object | `{}` |  |
| airflow.pgbouncer.metricsExporterSidecar.sslmode | string | `"disable"` |  |
| airflow.pgbouncer.metricsExporterSidecar.statsSecretName | string | `nil` |  |
| airflow.pgbouncer.metricsExporterSidecar.statsSecretKey | string | `nil` |  |
| airflow.pgbouncer.metricsExporterSidecar.statsSecretAnnotations | object | `{}` |  |
| airflow.pgbouncer.metricsExporterSidecar.securityContexts.container | object | `{}` |  |
| airflow.pgbouncer.metricsExporterSidecar.containerLifecycleHooks | object | `{}` |  |
| airflow.pgbouncer.metricsExporterSidecar.livenessProbe.initialDelaySeconds | int | `10` |  |
| airflow.pgbouncer.metricsExporterSidecar.livenessProbe.periodSeconds | int | `10` |  |
| airflow.pgbouncer.metricsExporterSidecar.livenessProbe.timeoutSeconds | int | `1` |  |
| airflow.pgbouncer.metricsExporterSidecar.readinessProbe.initialDelaySeconds | int | `10` |  |
| airflow.pgbouncer.metricsExporterSidecar.readinessProbe.periodSeconds | int | `10` |  |
| airflow.pgbouncer.metricsExporterSidecar.readinessProbe.timeoutSeconds | int | `1` |  |
| airflow.pgbouncer.metricsExporterSidecar.extraVolumeMounts | list | `[]` |  |
| airflow.pgbouncer.labels | object | `{}` |  |
| airflow.pgbouncer.env | list | `[]` |  |
| airflow.redis.enabled | bool | `true` |  |
| airflow.redis.terminationGracePeriodSeconds | int | `600` |  |
| airflow.redis.annotations | object | `{}` |  |
| airflow.redis.serviceAccount.automountServiceAccountToken | bool | `true` |  |
| airflow.redis.serviceAccount.create | bool | `true` |  |
| airflow.redis.serviceAccount.name | string | `nil` |  |
| airflow.redis.serviceAccount.annotations | object | `{}` |  |
| airflow.redis.service.type | string | `"ClusterIP"` |  |
| airflow.redis.service.clusterIP | string | `nil` |  |
| airflow.redis.service.nodePort | string | `nil` |  |
| airflow.redis.persistence.enabled | bool | `true` |  |
| airflow.redis.persistence.size | string | `"1Gi"` |  |
| airflow.redis.persistence.storageClassName | string | `nil` |  |
| airflow.redis.persistence.annotations | object | `{}` |  |
| airflow.redis.persistence.existingClaim | string | `nil` |  |
| airflow.redis.persistence.persistentVolumeClaimRetentionPolicy | string | `nil` |  |
| airflow.redis.resources | object | `{}` |  |
| airflow.redis.passwordSecretName | string | `nil` |  |
| airflow.redis.password | string | `nil` |  |
| airflow.redis.passwordSecretAnnotations | object | `{}` |  |
| airflow.redis.safeToEvict | bool | `true` |  |
| airflow.redis.nodeSelector | object | `{}` |  |
| airflow.redis.affinity | object | `{}` |  |
| airflow.redis.tolerations | list | `[]` |  |
| airflow.redis.topologySpreadConstraints | list | `[]` |  |
| airflow.redis.priorityClassName | string | `nil` |  |
| airflow.redis.uid | int | `0` |  |
| airflow.redis.securityContext | object | `{}` |  |
| airflow.redis.securityContexts.pod | object | `{}` |  |
| airflow.redis.securityContexts.container | object | `{}` |  |
| airflow.redis.containerLifecycleHooks | object | `{}` |  |
| airflow.redis.labels | object | `{}` |  |
| airflow.redis.podAnnotations | object | `{}` |  |
| airflow.ports.flowerUI | int | `5555` |  |
| airflow.ports.airflowUI | int | `8080` |  |
| airflow.ports.workerLogs | int | `8793` |  |
| airflow.ports.triggererLogs | int | `8794` |  |
| airflow.ports.redisDB | int | `6379` |  |
| airflow.ports.statsdIngest | int | `9125` |  |
| airflow.ports.statsdScrape | int | `9102` |  |
| airflow.ports.pgbouncer | int | `6543` |  |
| airflow.ports.pgbouncerScrape | int | `9127` |  |
| airflow.ports.apiServer | int | `8080` |  |
| airflow.cleanup.enabled | bool | `false` |  |
| airflow.cleanup.schedule | string | `"*/15 * * * *"` |  |
| airflow.cleanup.command | string | `nil` |  |
| airflow.cleanup.args[0] | string | `"bash"` |  |
| airflow.cleanup.args[1] | string | `"-c"` |  |
| airflow.cleanup.args[2] | string | `"exec airflow kubernetes cleanup-pods --namespace={{ .Release.Namespace }}"` |  |
| airflow.cleanup.jobAnnotations | object | `{}` |  |
| airflow.cleanup.nodeSelector | object | `{}` |  |
| airflow.cleanup.affinity | object | `{}` |  |
| airflow.cleanup.tolerations | list | `[]` |  |
| airflow.cleanup.topologySpreadConstraints | list | `[]` |  |
| airflow.cleanup.priorityClassName | string | `nil` |  |
| airflow.cleanup.podAnnotations | object | `{}` |  |
| airflow.cleanup.labels | object | `{}` |  |
| airflow.cleanup.resources | object | `{}` |  |
| airflow.cleanup.serviceAccount.automountServiceAccountToken | bool | `true` |  |
| airflow.cleanup.serviceAccount.create | bool | `true` |  |
| airflow.cleanup.serviceAccount.name | string | `nil` |  |
| airflow.cleanup.serviceAccount.annotations | object | `{}` |  |
| airflow.cleanup.securityContext | object | `{}` |  |
| airflow.cleanup.env | list | `[]` |  |
| airflow.cleanup.securityContexts.pod | object | `{}` |  |
| airflow.cleanup.securityContexts.container | object | `{}` |  |
| airflow.cleanup.containerLifecycleHooks | object | `{}` |  |
| airflow.cleanup.failedJobsHistoryLimit | string | `nil` |  |
| airflow.cleanup.successfulJobsHistoryLimit | string | `nil` |  |
| airflow.config.core.dags_folder | string | `"{{ include \"airflow_dags\" . }}"` |  |
| airflow.config.core.load_examples | string | `"False"` |  |
| airflow.config.core.executor | string | `"{{ .Values.executor }}"` |  |
| airflow.config.core.auth_manager | string | `"airflow.providers.fab.auth_manager.fab_auth_manager.FabAuthManager"` |  |
| airflow.config.logging.remote_logging | string | `"{{- ternary \"True\" \"False\" (or .Values.elasticsearch.enabled .Values.opensearch.enabled) }}"` |  |
| airflow.config.logging.colored_console_log | string | `"False"` |  |
| airflow.config.metrics.statsd_on | string | `"{{ ternary \"True\" \"False\" .Values.statsd.enabled }}"` |  |
| airflow.config.metrics.statsd_port | int | `9125` |  |
| airflow.config.metrics.statsd_prefix | string | `"airflow"` |  |
| airflow.config.metrics.statsd_host | string | `"{{ printf \"%s-statsd\" (include \"airflow.fullname\" .) }}"` |  |
| airflow.config.fab.enable_proxy_fix | string | `"True"` |  |
| airflow.config.webserver.enable_proxy_fix | string | `"True"` |  |
| airflow.config.celery.flower_url_prefix | string | `"{{ ternary \"\" .Values.ingress.flower.path (eq .Values.ingress.flower.path \"/\") }}"` |  |
| airflow.config.celery.worker_concurrency | int | `16` |  |
| airflow.config.celery.sync_parallelism | string | `"{{ include \"cpu_count\" (((.Values.scheduler).resources).limits).cpu }}"` |  |
| airflow.config.scheduler.standalone_dag_processor | string | `"{{ ternary \"True\" \"False\" (or (semverCompare \">=3.0.0\" .Values.airflowVersion) (.Values.dagProcessor.enabled | default false)) }}"` |  |
| airflow.config.dag_processor.dag_bundle_config_list | string | `"{{ include \"dag_bundle_config_list\" . }}"` |  |
| airflow.config.elasticsearch.json_format | string | `"True"` |  |
| airflow.config.elasticsearch.log_id_template | string | `"{dag_id}_{task_id}_{execution_date}_{try_number}"` |  |
| airflow.config.elasticsearch_configs.max_retries | int | `3` |  |
| airflow.config.elasticsearch_configs.timeout | int | `30` |  |
| airflow.config.elasticsearch_configs.retry_timeout | string | `"True"` |  |
| airflow.config.kerberos.keytab | string | `"{{ .Values.kerberos.keytabPath }}"` |  |
| airflow.config.kerberos.reinit_frequency | string | `"{{ .Values.kerberos.reinitFrequency }}"` |  |
| airflow.config.kerberos.principal | string | `"{{ .Values.kerberos.principal }}"` |  |
| airflow.config.kerberos.ccache | string | `"{{ .Values.kerberos.ccacheMountPath }}/{{ .Values.kerberos.ccacheFileName }}"` |  |
| airflow.config.celery_kubernetes_executor.kubernetes_queue | string | `"kubernetes"` |  |
| airflow.config.kubernetes_executor.namespace | string | `"{{ .Release.Namespace }}"` |  |
| airflow.config.kubernetes_executor.pod_template_file | string | `"{{ include \"airflow_pod_template_file\" . }}/pod_template_file.yaml"` |  |
| airflow.config.kubernetes_executor.worker_container_repository | string | `"{{ .Values.images.airflow.repository | default .Values.defaultAirflowRepository }}"` |  |
| airflow.config.kubernetes_executor.worker_container_tag | string | `"{{ .Values.images.airflow.tag | default .Values.defaultAirflowTag }}"` |  |
| airflow.config.kubernetes_executor.multi_namespace_mode | string | `"{{ ternary \"True\" \"False\" .Values.multiNamespaceMode }}"` |  |
| airflow.dags.mountPath | string | `nil` |  |
| airflow.dags.persistence.annotations | object | `{}` |  |
| airflow.dags.persistence.enabled | bool | `false` |  |
| airflow.dags.persistence.size | string | `"1Gi"` |  |
| airflow.dags.persistence.storageClassName | string | `nil` |  |
| airflow.dags.persistence.accessMode | string | `"ReadWriteOnce"` |  |
| airflow.dags.persistence.existingClaim | string | `nil` |  |
| airflow.dags.persistence.subPath | string | `nil` |  |
| airflow.dags.gitSync.enabled | bool | `true` |  |
| airflow.dags.gitSync.repo | string | `"https://github.com/RADAR-base/radar-airflow-dynamic-config"` |  |
| airflow.dags.gitSync.branch | string | `"main"` |  |
| airflow.dags.gitSync.rev | string | `"HEAD"` |  |
| airflow.dags.gitSync.depth | int | `1` |  |
| airflow.dags.gitSync.maxFailures | int | `0` |  |
| airflow.dags.gitSync.subPath | string | `"airflow-dynamic-config/"` |  |
| airflow.dags.gitSync.period | string | `"5s"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
