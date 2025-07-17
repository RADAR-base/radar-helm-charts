

# radar-nifi

![Version: 2.0.0](https://img.shields.io/badge/Version-2.0.0-informational?style=flat-square) ![AppVersion: 2.3.0](https://img.shields.io/badge/AppVersion-2.3.0-informational?style=flat-square)

Apache NiFi is a software project from the Apache Software Foundation designed to automate the flow of data between software systems.

**Homepage:** <https://nifi.apache.org/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Heet | <heet.sankesara@kcl.ac.uk> | <https://github.com/Hsankesara> |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
|  | ca | 1.0.1 |
| https://charts.bitnami.com/bitnami | zookeeper | 9.2.7 |
| https://charts.helm.sh/stable | openldap | ~1.2.4 |
| https://dysnix.github.io/charts/ | registry(nifi-registry) | 1.0.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `1` |  |
| image.repository | string | `"apache/nifi"` |  |
| image.tag | string | `"2.3.0"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| securityContext.runAsUser | int | `1000` |  |
| securityContext.fsGroup | int | `1000` |  |
| sts.podManagementPolicy | string | `"Parallel"` |  |
| sts.AntiAffinity | string | `"soft"` |  |
| sts.useHostNetwork | string | `nil` |  |
| sts.hostPort | string | `nil` |  |
| sts.pod.annotations."security.alpha.kubernetes.io/sysctls" | string | `"net.ipv4.ip_local_port_range=10000 65000"` |  |
| sts.serviceAccount.create | bool | `true` |  |
| sts.serviceAccount.annotations | object | `{}` |  |
| sts.hostAliases | list | `[]` |  |
| sts.startupProbe.enabled | bool | `false` |  |
| sts.startupProbe.failureThreshold | int | `60` |  |
| sts.startupProbe.periodSeconds | int | `10` |  |
| properties.sensitiveKey | string | `"changeMechangeMe"` |  |
| properties.algorithm | string | `"NIFI_PBKDF2_AES_GCM_256"` |  |
| properties.externalSecure | bool | `false` |  |
| properties.isNode | bool | `true` |  |
| properties.httpsPort | int | `8443` |  |
| properties.webProxyHost | string | `nil` |  |
| properties.clusterPort | int | `6007` |  |
| properties.zkClientEnsembleTracker | bool | `false` |  |
| properties.clusterNodeConnectionTimeout | string | `"10 sec"` |  |
| properties.clusterNodeReadTimeout | string | `"10 sec"` |  |
| properties.clusterHeartbeatInterval | string | `"5 sec"` |  |
| properties.clusterHeartbeatMiscibleMax | int | `10` |  |
| properties.zookeeperConnectTimeout | string | `"3 secs"` |  |
| properties.zookeeperSessionTimeout | string | `"3 secs"` |  |
| properties.archiveMaxRetentionPeriod | string | `"3 days"` |  |
| properties.archiveMaxUsagePercentage | string | `"85%"` |  |
| properties.provenanceStorage | string | `"8 GB"` |  |
| properties.provenanceMaxStorageTime | string | `"10 days"` |  |
| properties.flowArchiveMaxTime | string | `"30 days"` |  |
| properties.flowArchiveMaxStorage | string | `"500 MB"` |  |
| properties.QueueBackpressureCount | int | `1000` |  |
| properties.QueueBackpressureSize | string | `"1 GB"` |  |
| properties.provenanceBufferSize | int | `100000` |  |
| properties.questdbPersistNodeDays | int | `14` |  |
| properties.questdbPersistComponentDays | int | `3` |  |
| properties.webMaxRequestsPerSecond | int | `30000` |  |
| properties.webMaxAccessTokenRequestsPerSecond | int | `25` |  |
| properties.analyticsPredictEnabled | bool | `false` |  |
| properties.siteToSite.port | int | `10000` |  |
| properties.safetyValve."nifi.web.http.network.interface.default" | string | `"eth0"` |  |
| properties.safetyValve."nifi.web.http.network.interface.lo" | string | `"lo"` |  |
| properties.clusterStateProvider | string | `"kubernetes-provider"` |  |
| auth.admin | string | `"CN=admin, OU=NIFI"` |  |
| auth.SSL.keystorePasswd | string | `"changeMe"` |  |
| auth.SSL.truststorePasswd | string | `"changeMe"` |  |
| auth.singleUser.username | string | `"username"` |  |
| auth.singleUser.password | string | `"changemechangeme"` |  |
| auth.clientAuth.enabled | bool | `false` |  |
| auth.ldap.enabled | bool | `false` |  |
| auth.ldap.host | string | `nil` |  |
| auth.ldap.searchBase | string | `nil` |  |
| auth.ldap.admin | string | `nil` |  |
| auth.ldap.pass | string | `nil` |  |
| auth.ldap.searchFilter | string | `"(objectClass=*)"` |  |
| auth.ldap.userIdentityAttribute | string | `"cn"` |  |
| auth.ldap.authStrategy | string | `"SIMPLE"` |  |
| auth.ldap.identityStrategy | string | `"USE_DN"` |  |
| auth.ldap.authExpiration | string | `"12 hours"` |  |
| auth.ldap.userSearchScope | string | `"ONE_LEVEL"` |  |
| auth.ldap.groupSearchScope | string | `"ONE_LEVEL"` |  |
| auth.oidc.enabled | bool | `false` |  |
| auth.oidc.discoveryUrl | string | `nil` |  |
| auth.oidc.clientId | string | `nil` |  |
| auth.oidc.clientSecret | string | `nil` |  |
| auth.oidc.claimIdentifyingUser | string | `"email"` |  |
| auth.oidc.admin | string | `"nifi@example.com"` |  |
| auth.oidc.tokenRefreshWindow | string | `"60 secs"` |  |
| auth.oidc.claimGroups | string | `"admin"` |  |
| auth.oidc.preferredJwsAlgorithm | string | `nil` |  |
| auth.oidc.additionalScopes | string | `nil` |  |
| openldap.enabled | bool | `false` |  |
| openldap.persistence.enabled | bool | `true` |  |
| openldap.env.LDAP_ORGANISATION | string | `nil` |  |
| openldap.env.LDAP_DOMAIN | string | `nil` |  |
| openldap.env.LDAP_BACKEND | string | `"hdb"` |  |
| openldap.env.LDAP_TLS | string | `"true"` |  |
| openldap.env.LDAP_TLS_ENFORCE | string | `"false"` |  |
| openldap.env.LDAP_REMOVE_CONFIG_AFTER_SETUP | string | `"false"` |  |
| openldap.adminPassword | string | `nil` |  |
| openldap.configPassword | string | `nil` |  |
| openldap.customLdifFiles."1-default-users.ldif" | string | `"# You can find an example ldif file at https://github.com/cetic/fadi/blob/master/examples/basic/example.ldif"` |  |
| headless.type | string | `"ClusterIP"` |  |
| headless.annotations."service.alpha.kubernetes.io/tolerate-unready-endpoints" | string | `"true"` |  |
| service.type | string | `"ClusterIP"` |  |
| service.httpsPort | int | `8443` |  |
| service.sessionAffinity | string | `"ClientIP"` |  |
| service.sessionAffinityConfig.clientIP.timeoutSeconds | int | `10800` |  |
| service.annotations | object | `{}` |  |
| service.processors.enabled | bool | `false` |  |
| service.processors.ports[0].name | string | `"processor01"` |  |
| service.processors.ports[0].port | int | `7001` |  |
| service.processors.ports[0].targetPort | int | `7001` |  |
| service.processors.ports[1].name | string | `"processor02"` |  |
| service.processors.ports[1].port | int | `7002` |  |
| service.processors.ports[1].targetPort | int | `7002` |  |
| containerPorts | list | `[]` |  |
| ingress.enabled | bool | `false` |  |
| ingress.annotations | object | `{}` |  |
| ingress.tls | list | `[]` |  |
| ingress.hosts | list | `[]` |  |
| ingress.path | string | `"/"` |  |
| jvmMemory | string | `"2g"` |  |
| sidecar.image | string | `"busybox"` |  |
| sidecar.tag | string | `"1.32.0"` |  |
| sidecar.imagePullPolicy | string | `"IfNotPresent"` |  |
| persistence.enabled | bool | `false` |  |
| persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistence.subPath.enabled | bool | `false` |  |
| persistence.subPath.name | string | `"data"` |  |
| persistence.subPath.size | string | `"30Gi"` |  |
| persistence.configStorage.size | string | `"100Mi"` |  |
| persistence.authconfStorage.size | string | `"100Mi"` |  |
| persistence.dataStorage.size | string | `"1Gi"` |  |
| persistence.flowfileRepoStorage.size | string | `"10Gi"` |  |
| persistence.contentRepoStorage.size | string | `"10Gi"` |  |
| persistence.provenanceRepoStorage.size | string | `"10Gi"` |  |
| persistence.logStorage.size | string | `"5Gi"` |  |
| resources | object | `{}` |  |
| logresources.requests.cpu | string | `"10m"` |  |
| logresources.requests.memory | string | `"10Mi"` |  |
| logresources.limits.cpu | string | `"50m"` |  |
| logresources.limits.memory | string | `"50Mi"` |  |
| affinity | object | `{}` |  |
| nodeSelector | object | `{}` |  |
| tolerations | list | `[]` |  |
| initContainers | object | `{}` |  |
| extraVolumeMounts | list | `[]` |  |
| extraVolumes | list | `[]` |  |
| extraContainers | list | `[]` |  |
| terminationGracePeriodSeconds | int | `30` |  |
| env | list | `[]` |  |
| envFrom | list | `[]` |  |
| extraOptions | list | `[]` |  |
| openshift.scc.enabled | bool | `false` |  |
| openshift.route.enabled | bool | `false` |  |
| ca.enabled | bool | `false` |  |
| ca.persistence.enabled | bool | `false` |  |
| ca.server | string | `""` |  |
| ca.service.port | int | `9090` |  |
| ca.token | string | `"sixteenCharacters"` |  |
| ca.admin.cn | string | `"admin"` |  |
| ca.serviceAccount.create | bool | `false` |  |
| ca.openshift.scc.enabled | bool | `false` |  |
| certManager.enabled | bool | `false` |  |
| certManager.clusterDomain | string | `"cluster.local"` |  |
| certManager.keystorePasswd | string | `"changeme"` |  |
| certManager.truststorePasswd | string | `"changeme"` |  |
| certManager.replaceDefaultTrustStore | bool | `false` |  |
| certManager.additionalDnsNames[0] | string | `"localhost"` |  |
| certManager.refreshSeconds | int | `300` |  |
| certManager.resources.requests.cpu | string | `"100m"` |  |
| certManager.resources.requests.memory | string | `"128Mi"` |  |
| certManager.resources.limits.cpu | string | `"100m"` |  |
| certManager.resources.limits.memory | string | `"128Mi"` |  |
| certManager.certDuration | string | `"2160h"` |  |
| certManager.caDuration | string | `"87660h"` |  |
| zookeeper | object | `{"enabled":false,"port":2181,"replicaCount":3,"url":""}` | ---------------------------------------------------------------------------- |
| registry | object | `{"enabled":false,"port":80,"url":""}` | ---------------------------------------------------------------------------- |
| metrics.prometheus.enabled | bool | `false` |  |
| metrics.prometheus.port | int | `9092` |  |
| metrics.prometheus.serviceMonitor.enabled | bool | `false` |  |
| metrics.prometheus.serviceMonitor.labels | object | `{}` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
