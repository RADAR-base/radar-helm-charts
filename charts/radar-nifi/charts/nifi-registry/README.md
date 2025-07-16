

# nifi-registry

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.8.0](https://img.shields.io/badge/AppVersion-0.8.0-informational?style=flat-square)

A subproject of Apache NiFi to store and manage shared resources.

**Homepage:** <https://github.com/dysnix/charts/tree/master/dysnix/nifi-registry>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| daniel-yavorovich | <daniel@dysnix.com> |  |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `1` |  |
| image.repository | string | `"apache/nifi-registry"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.tag | string | `"0.8.0"` |  |
| initContainers.git.image | string | `"alpine/git"` |  |
| initContainers.git.tag | string | `"v2.26.2"` |  |
| initContainers.alpine.image | string | `"alpine"` |  |
| initContainers.alpine.tag | float | `3.6` |  |
| initContainers.extraEnvs | list | `[]` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| fullnameOverride | string | `""` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.name | string | `""` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.type | string | `"ClusterIP"` |  |
| service.port | int | `18080` |  |
| ingress.enabled | bool | `false` |  |
| ingress.annotations | object | `{}` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths | list | `[]` |  |
| ingress.tls | list | `[]` |  |
| persistence.enabled | bool | `true` |  |
| persistence.database.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.database.size | string | `"1Gi"` |  |
| persistence.flowStorage.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.flowStorage.size | string | `"1Gi"` |  |
| resources | object | `{}` |  |
| nodeSelector | object | `{}` |  |
| tolerations | list | `[]` |  |
| affinity | object | `{}` |  |
| flowProvider.git.enabled | bool | `false` |  |
| flowProvider.git.url | string | `nil` |  |
| flowProvider.git.remote | string | `"origin"` |  |
| flowProvider.git.user | string | `nil` |  |
| flowProvider.git.password | string | `nil` |  |
| flowProvider.git.config.enabled | bool | `false` |  |
| flowProvider.git.config.data | string | `""` |  |
| flowProvider.git.ssh.secretName | string | `nil` |  |
| flowProvider.git.ssh.known_hosts | string | `nil` |  |
| flowProvider.git.ssh.gitSshCommand | string | `"ssh -v"` |  |
| flowProvider.git.ssh.config | string | `"StrictHostKeyChecking accept-new\n"` |  |
| flowProvider.postgres.enabled | bool | `false` |  |
| flowProvider.postgres.driverURL | string | `"https://jdbc.postgresql.org/download/"` |  |
| flowProvider.postgres.fileName | string | `"postgresql-42.2.6.jar"` |  |
| flowProvider.postgres.driverClass | string | `"org.postgresql.Driver"` |  |
| flowProvider.postgres.url | string | `"jdbc:postgresql://localhost/nifireg"` |  |
| flowProvider.postgres.username | string | `"nifireg"` |  |
| flowProvider.postgres.password | string | `"nifireg"` |  |
| extraEnvs | list | `[]` |  |
| tests.images.busybox.image | string | `"busybox"` |  |
| tests.images.busybox.tag | string | `"1.33.1"` |  |
| security.enabled | bool | `false` |  |
| security.needClientAuth | bool | `true` |  |
| security.httpsHost | string | `"0.0.0.0"` |  |
| security.httpsPort | int | `18443` |  |
| security.admin | string | `"Initial Administrator"` |  |
| security.persistence.accessMode | string | `"ReadWriteOnce"` |  |
| security.persistence.size | string | `"1Gi"` |  |
| security.authConf | string | `nil` |  |
| certManager.enabled | bool | `false` |  |
| certManager.clientCommonName | string | `"Initial Administrator"` |  |
| certManager.clusterDomain | string | `"cluster.local"` |  |
| certManager.keystorePasswd | string | `"changeme"` |  |
| certManager.truststorePasswd | string | `"changeme"` |  |
| certManager.additionalDnsNames[0] | string | `"localhost"` |  |
| certManager.caSecrets | string | `nil` |  |
| certManager.replaceDefaultTrustStore | bool | `true` |  |
| certManager.refreshSeconds | int | `300` |  |
| certManager.resources.requests.cpu | string | `"100m"` |  |
| certManager.resources.requests.memory | string | `"128Mi"` |  |
| certManager.resources.limits.cpu | string | `"100m"` |  |
| certManager.resources.limits.memory | string | `"128Mi"` |  |
| certManager.certDuration | string | `"2160h"` |  |
| certManager.caDuration | string | `"87660h"` |  |
| oidc.enabled | bool | `false` |  |
| oidc.discoveryURL | string | `"https://oidc.server.example.com:8080/auth/realms/nifi/.well-known/openid-configuration"` |  |
| oidc.clientId | string | `"nifi"` |  |
| oidc.clientSecret | string | `"SomeRandomKeySetOnOIDCProvider"` |  |
| oidc.claimIdentifyingUser | string | `"email"` |  |
| oidc.connectTimeout | string | `"5 secs"` |  |
| oidc.readTimeout | string | `"5 secs"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
