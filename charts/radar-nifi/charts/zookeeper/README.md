

# zookeeper

![Version: 9.2.7](https://img.shields.io/badge/Version-9.2.7-informational?style=flat-square) ![AppVersion: 3.8.0](https://img.shields.io/badge/AppVersion-3.8.0-informational?style=flat-square)

Apache ZooKeeper provides a reliable, centralized register of configuration data and services for distributed applications.

**Homepage:** <https://github.com/bitnami/charts/tree/master/bitnami/zookeeper>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Bitnami |  | <https://github.com/bitnami/charts> |

## Source Code

* <https://github.com/bitnami/bitnami-docker-zookeeper>
* <https://zookeeper.apache.org/>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | common | 1.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.imageRegistry | string | `""` |  |
| global.imagePullSecrets | list | `[]` |  |
| global.storageClass | string | `""` |  |
| kubeVersion | string | `""` |  |
| nameOverride | string | `""` |  |
| fullnameOverride | string | `""` |  |
| clusterDomain | string | `"cluster.local"` |  |
| extraDeploy | list | `[]` |  |
| commonLabels | object | `{}` |  |
| commonAnnotations | object | `{}` |  |
| namespaceOverride | string | `""` |  |
| diagnosticMode.enabled | bool | `false` |  |
| diagnosticMode.command[0] | string | `"sleep"` |  |
| diagnosticMode.args[0] | string | `"infinity"` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"bitnamilegacy/zookeeper"` |  |
| image.tag | string | `"3.8.0-debian-11-r5"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.pullSecrets | list | `[]` |  |
| image.debug | bool | `false` |  |
| auth.enabled | bool | `false` |  |
| auth.clientUser | string | `""` |  |
| auth.clientPassword | string | `""` |  |
| auth.serverUsers | string | `""` |  |
| auth.serverPasswords | string | `""` |  |
| auth.existingSecret | string | `""` |  |
| tickTime | int | `2000` |  |
| initLimit | int | `10` |  |
| syncLimit | int | `5` |  |
| preAllocSize | int | `65536` |  |
| snapCount | int | `100000` |  |
| maxClientCnxns | int | `60` |  |
| maxSessionTimeout | int | `40000` |  |
| heapSize | int | `1024` |  |
| fourlwCommandsWhitelist | string | `"srvr, mntr, ruok"` |  |
| minServerId | int | `1` |  |
| listenOnAllIPs | bool | `false` |  |
| autopurge.snapRetainCount | int | `3` |  |
| autopurge.purgeInterval | int | `0` |  |
| logLevel | string | `"ERROR"` |  |
| jvmFlags | string | `""` |  |
| dataLogDir | string | `""` |  |
| configuration | string | `""` |  |
| existingConfigmap | string | `""` |  |
| extraEnvVars | list | `[]` |  |
| extraEnvVarsCM | string | `""` |  |
| extraEnvVarsSecret | string | `""` |  |
| command[0] | string | `"/scripts/setup.sh"` |  |
| args | list | `[]` |  |
| replicaCount | int | `1` |  |
| containerPorts.client | int | `2181` |  |
| containerPorts.tls | int | `3181` |  |
| containerPorts.follower | int | `2888` |  |
| containerPorts.election | int | `3888` |  |
| livenessProbe.enabled | bool | `true` |  |
| livenessProbe.initialDelaySeconds | int | `30` |  |
| livenessProbe.periodSeconds | int | `10` |  |
| livenessProbe.timeoutSeconds | int | `5` |  |
| livenessProbe.failureThreshold | int | `6` |  |
| livenessProbe.successThreshold | int | `1` |  |
| livenessProbe.probeCommandTimeout | int | `2` |  |
| readinessProbe.enabled | bool | `true` |  |
| readinessProbe.initialDelaySeconds | int | `5` |  |
| readinessProbe.periodSeconds | int | `10` |  |
| readinessProbe.timeoutSeconds | int | `5` |  |
| readinessProbe.failureThreshold | int | `6` |  |
| readinessProbe.successThreshold | int | `1` |  |
| readinessProbe.probeCommandTimeout | int | `2` |  |
| startupProbe.enabled | bool | `false` |  |
| startupProbe.initialDelaySeconds | int | `30` |  |
| startupProbe.periodSeconds | int | `10` |  |
| startupProbe.timeoutSeconds | int | `1` |  |
| startupProbe.failureThreshold | int | `15` |  |
| startupProbe.successThreshold | int | `1` |  |
| customLivenessProbe | object | `{}` |  |
| customReadinessProbe | object | `{}` |  |
| customStartupProbe | object | `{}` |  |
| lifecycleHooks | object | `{}` |  |
| resources.limits | object | `{}` |  |
| resources.requests.memory | string | `"256Mi"` |  |
| resources.requests.cpu | string | `"250m"` |  |
| podSecurityContext.enabled | bool | `true` |  |
| podSecurityContext.fsGroup | int | `1001` |  |
| containerSecurityContext.enabled | bool | `true` |  |
| containerSecurityContext.runAsUser | int | `1001` |  |
| containerSecurityContext.runAsNonRoot | bool | `true` |  |
| hostAliases | list | `[]` |  |
| podLabels | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podAffinityPreset | string | `""` |  |
| podAntiAffinityPreset | string | `"soft"` |  |
| nodeAffinityPreset.type | string | `""` |  |
| nodeAffinityPreset.key | string | `""` |  |
| nodeAffinityPreset.values | list | `[]` |  |
| affinity | object | `{}` |  |
| nodeSelector | object | `{}` |  |
| tolerations | list | `[]` |  |
| topologySpreadConstraints | list | `[]` |  |
| podManagementPolicy | string | `"Parallel"` |  |
| priorityClassName | string | `""` |  |
| schedulerName | string | `""` |  |
| updateStrategy.type | string | `"RollingUpdate"` |  |
| updateStrategy.rollingUpdate | object | `{}` |  |
| extraVolumes | list | `[]` |  |
| extraVolumeMounts | list | `[]` |  |
| sidecars | list | `[]` |  |
| initContainers | list | `[]` |  |
| pdb.create | bool | `false` |  |
| pdb.minAvailable | string | `""` |  |
| pdb.maxUnavailable | int | `1` |  |
| service.type | string | `"ClusterIP"` |  |
| service.ports.client | int | `2181` |  |
| service.ports.tls | int | `3181` |  |
| service.ports.follower | int | `2888` |  |
| service.ports.election | int | `3888` |  |
| service.nodePorts.client | string | `""` |  |
| service.nodePorts.tls | string | `""` |  |
| service.disableBaseClientPort | bool | `false` |  |
| service.sessionAffinity | string | `"None"` |  |
| service.sessionAffinityConfig | object | `{}` |  |
| service.clusterIP | string | `""` |  |
| service.loadBalancerIP | string | `""` |  |
| service.loadBalancerSourceRanges | list | `[]` |  |
| service.externalTrafficPolicy | string | `"Cluster"` |  |
| service.annotations | object | `{}` |  |
| service.extraPorts | list | `[]` |  |
| service.headless.publishNotReadyAddresses | bool | `true` |  |
| service.headless.annotations | object | `{}` |  |
| networkPolicy.enabled | bool | `false` |  |
| networkPolicy.allowExternal | bool | `true` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `""` |  |
| serviceAccount.automountServiceAccountToken | bool | `true` |  |
| serviceAccount.annotations | object | `{}` |  |
| persistence.enabled | bool | `true` |  |
| persistence.existingClaim | string | `""` |  |
| persistence.storageClass | string | `""` |  |
| persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistence.size | string | `"8Gi"` |  |
| persistence.annotations | object | `{}` |  |
| persistence.selector | object | `{}` |  |
| persistence.dataLogDir.size | string | `"8Gi"` |  |
| persistence.dataLogDir.existingClaim | string | `""` |  |
| persistence.dataLogDir.selector | object | `{}` |  |
| volumePermissions.enabled | bool | `false` |  |
| volumePermissions.image.registry | string | `"docker.io"` |  |
| volumePermissions.image.repository | string | `"bitnamilegacy/bitnami-shell"` |  |
| volumePermissions.image.tag | string | `"11-debian-11-r4"` |  |
| volumePermissions.image.pullPolicy | string | `"IfNotPresent"` |  |
| volumePermissions.image.pullSecrets | list | `[]` |  |
| volumePermissions.resources.limits | object | `{}` |  |
| volumePermissions.resources.requests | object | `{}` |  |
| volumePermissions.containerSecurityContext.runAsUser | int | `0` |  |
| metrics.enabled | bool | `false` |  |
| metrics.containerPort | int | `9141` |  |
| metrics.service.type | string | `"ClusterIP"` |  |
| metrics.service.port | int | `9141` |  |
| metrics.service.annotations."prometheus.io/scrape" | string | `"true"` |  |
| metrics.service.annotations."prometheus.io/port" | string | `"{{ .Values.metrics.service.port }}"` |  |
| metrics.service.annotations."prometheus.io/path" | string | `"/metrics"` |  |
| metrics.serviceMonitor.enabled | bool | `false` |  |
| metrics.serviceMonitor.namespace | string | `""` |  |
| metrics.serviceMonitor.interval | string | `""` |  |
| metrics.serviceMonitor.scrapeTimeout | string | `""` |  |
| metrics.serviceMonitor.additionalLabels | object | `{}` |  |
| metrics.serviceMonitor.selector | object | `{}` |  |
| metrics.serviceMonitor.relabelings | list | `[]` |  |
| metrics.serviceMonitor.metricRelabelings | list | `[]` |  |
| metrics.serviceMonitor.honorLabels | bool | `false` |  |
| metrics.serviceMonitor.jobLabel | string | `""` |  |
| metrics.prometheusRule.enabled | bool | `false` |  |
| metrics.prometheusRule.namespace | string | `""` |  |
| metrics.prometheusRule.additionalLabels | object | `{}` |  |
| metrics.prometheusRule.rules | list | `[]` |  |
| tls.client.enabled | bool | `false` |  |
| tls.client.auth | string | `"none"` |  |
| tls.client.autoGenerated | bool | `false` |  |
| tls.client.existingSecret | string | `""` |  |
| tls.client.existingSecretKeystoreKey | string | `""` |  |
| tls.client.existingSecretTruststoreKey | string | `""` |  |
| tls.client.keystorePath | string | `"/opt/bitnami/zookeeper/config/certs/client/zookeeper.keystore.jks"` |  |
| tls.client.truststorePath | string | `"/opt/bitnami/zookeeper/config/certs/client/zookeeper.truststore.jks"` |  |
| tls.client.passwordsSecretName | string | `""` |  |
| tls.client.passwordsSecretKeystoreKey | string | `""` |  |
| tls.client.passwordsSecretTruststoreKey | string | `""` |  |
| tls.client.keystorePassword | string | `""` |  |
| tls.client.truststorePassword | string | `""` |  |
| tls.quorum.enabled | bool | `false` |  |
| tls.quorum.auth | string | `"none"` |  |
| tls.quorum.autoGenerated | bool | `false` |  |
| tls.quorum.existingSecret | string | `""` |  |
| tls.quorum.existingSecretKeystoreKey | string | `""` |  |
| tls.quorum.existingSecretTruststoreKey | string | `""` |  |
| tls.quorum.keystorePath | string | `"/opt/bitnami/zookeeper/config/certs/quorum/zookeeper.keystore.jks"` |  |
| tls.quorum.truststorePath | string | `"/opt/bitnami/zookeeper/config/certs/quorum/zookeeper.truststore.jks"` |  |
| tls.quorum.passwordsSecretName | string | `""` |  |
| tls.quorum.passwordsSecretKeystoreKey | string | `""` |  |
| tls.quorum.passwordsSecretTruststoreKey | string | `""` |  |
| tls.quorum.keystorePassword | string | `""` |  |
| tls.quorum.truststorePassword | string | `""` |  |
| tls.resources.limits | object | `{}` |  |
| tls.resources.requests | object | `{}` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
