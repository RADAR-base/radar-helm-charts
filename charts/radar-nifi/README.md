

# radar-nifi

![Version: 3.0.0](https://img.shields.io/badge/Version-3.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.16.0](https://img.shields.io/badge/AppVersion-1.16.0-informational?style=flat-square)

A Helm chart for Kubernetes

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../external/nifi-cluster | nifi-cluster | 1.14.1 |
| file://../../external/nifikop | nifikop | 1.14.1 |
| https://radar-base.github.io/radar-helm-charts | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| serverName | string | `"localhost"` |  |
| advertised_protocol | string | `"https"` |  |
| nifikop.enabled | bool | `true` | Deploy the nifikop operator. |
| auth.oidc | object | `{"enabled":false}` | OpenID Connect configuration (not functional at the moment, included for reference). |
| auth.singleUser | object | `{"password":"changemechangeme","username":"admin"}` | Single user authentication configuration |
| auth.singleUser.password | string | `"changemechangeme"` | Password for the single admin user. Make sure it's at least 12 characters long.' |
| nifi-secret-properties | string | check `values.yaml` | Nifi Cluster configuration |
| nifi-properties."nifi.web.proxy.context.path" | string | `"/"` |  |
| nifi-properties."nifi.web.proxy.scheme" | string | `"{{ .Values.advertised_protocol }}"` |  |
| nifi-properties."nifi.web.http.network.interface.default" | string | `"eth0"` |  |
| nifi-properties."nifi.web.http.network.interface.lo" | string | `"lo"` |  |
| nifi-properties."nifi.nar.library.autoload.directory" | string | `"../extensions"` |  |
| nifi-cluster.cluster.nodeUserIdentityTemplate | string | `"node-%d-nifikop"` |  |
| nifi-cluster.cluster.image.tag | string | `"2.5.0"` |  |
| nifi-cluster.cluster.manager | string | `"kubernetes"` |  |
| nifi-cluster.cluster.bootstrapProperties.overrideConfigs | string | `"java.arg.4=-Djava.net.preferIPv4Stack=true\njava.arg.log4shell=-Dlog4j2.formatMsgNoLookups=true\n# Java 8 Tuning see https://community.hortonworks.com/articles/7882/hdfnifi-best-practices-for-setting-up-a-high-perfo.html for references\njava.arg.7=-XX:ReservedCodeCacheSize=256m\njava.arg.8=-XX:+UseCodeCacheFlushing\n"` |  |
| nifi-cluster.cluster.bootstrapProperties.nifiJvmMemory | string | `"2g"` |  |
| nifi-cluster.cluster.nifiProperties.overrideConfigMap.name | string | `"radar-nifi-properties"` |  |
| nifi-cluster.cluster.nifiProperties.overrideConfigMap.data | string | `"nifi.properties"` |  |
| nifi-cluster.cluster.nifiProperties.overrideSecretConfig.name | string | `"radar-nifi-secret-properties"` |  |
| nifi-cluster.cluster.nifiProperties.overrideSecretConfig.data | string | `"nifi-secret.properties"` |  |
| nifi-cluster.cluster.nifiProperties.webProxyHosts | list | `["nifi.localhost:8443"]` | Must follow the full public address of the Nifi cluster, including port and context path. |
| nifi-cluster.cluster.singleUserConfiguration.enabled | bool | `true` |  |
| nifi-cluster.cluster.singleUserConfiguration.authorizerEnabled | bool | `true` |  |
| nifi-cluster.cluster.singleUserConfiguration.secretRef.name | string | `"nifi-single-user-credentials"` |  |
| nifi-cluster.cluster.singleUserConfiguration.secretRef.namespace | string | `"default"` |  |
| nifi-cluster.cluster.listenersConfig.internalListeners[0].type | string | `"https"` |  |
| nifi-cluster.cluster.listenersConfig.internalListeners[0].name | string | `"https"` |  |
| nifi-cluster.cluster.listenersConfig.internalListeners[0].containerPort | int | `8443` |  |
| nifi-cluster.cluster.listenersConfig.internalListeners[1].type | string | `"cluster"` |  |
| nifi-cluster.cluster.listenersConfig.internalListeners[1].name | string | `"cluster"` |  |
| nifi-cluster.cluster.listenersConfig.internalListeners[1].containerPort | int | `6007` |  |
| nifi-cluster.cluster.listenersConfig.internalListeners[2].type | string | `"s2s"` |  |
| nifi-cluster.cluster.listenersConfig.internalListeners[2].name | string | `"s2s"` |  |
| nifi-cluster.cluster.listenersConfig.internalListeners[2].containerPort | int | `10000` |  |
| nifi-cluster.cluster.listenersConfig.sslSecrets.tlsSecretName | string | `"radar-nifi-tls"` |  |
| nifi-cluster.cluster.listenersConfig.sslSecrets.create | bool | `true` |  |
| nifi-cluster.cluster.nifiClusterTaskSpec.retryDurationMinutes | int | `10` |  |
| nifi-cluster.cluster.nodeConfigGroups.default_group.fsGroup | int | `1337` |  |
| nifi-cluster.cluster.nodeConfigGroups.default_group.isNode | bool | `true` |  |
| nifi-cluster.cluster.nodeConfigGroups.default_group.resourcesRequirements.limits.cpu | int | `2` |  |
| nifi-cluster.cluster.nodeConfigGroups.default_group.resourcesRequirements.limits.memory | string | `"3Gi"` |  |
| nifi-cluster.cluster.nodeConfigGroups.default_group.resourcesRequirements.requests.cpu | int | `1` |  |
| nifi-cluster.cluster.nodeConfigGroups.default_group.resourcesRequirements.requests.memory | string | `"2Gi"` |  |
| nifi-cluster.cluster.nodeConfigGroups.default_group.serviceAccountName | string | `"radar-nifi-nifi-cluster"` |  |
| nifi-cluster.cluster.nodeConfigGroups.default_group.storageConfigs[0].mountPath | string | `"/opt/nifi/flowfile_repository"` |  |
| nifi-cluster.cluster.nodeConfigGroups.default_group.storageConfigs[0].name | string | `"flowfile-repository"` |  |
| nifi-cluster.cluster.nodeConfigGroups.default_group.storageConfigs[0].pvcSpec.accessModes[0] | string | `"ReadWriteOnce"` |  |
| nifi-cluster.cluster.nodeConfigGroups.default_group.storageConfigs[0].pvcSpec.resources.requests.storage | string | `"10Gi"` |  |
| nifi-cluster.cluster.nodeConfigGroups.default_group.storageConfigs[1].mountPath | string | `"/opt/nifi/nifi-current/conf"` |  |
| nifi-cluster.cluster.nodeConfigGroups.default_group.storageConfigs[1].name | string | `"conf"` |  |
| nifi-cluster.cluster.nodeConfigGroups.default_group.storageConfigs[1].pvcSpec.accessModes[0] | string | `"ReadWriteOnce"` |  |
| nifi-cluster.cluster.nodeConfigGroups.default_group.storageConfigs[1].pvcSpec.resources.requests.storage | string | `"500m"` |  |
| nifi-cluster.cluster.nodeConfigGroups.default_group.storageConfigs[2].mountPath | string | `"/opt/nifi/content_repository"` |  |
| nifi-cluster.cluster.nodeConfigGroups.default_group.storageConfigs[2].name | string | `"content-repository-default"` |  |
| nifi-cluster.cluster.nodeConfigGroups.default_group.storageConfigs[2].pvcSpec.accessModes[0] | string | `"ReadWriteOnce"` |  |
| nifi-cluster.cluster.nodeConfigGroups.default_group.storageConfigs[2].pvcSpec.resources.requests.storage | string | `"10Gi"` |  |
| nifi-cluster.cluster.nodeConfigGroups.default_group.storageConfigs[3].mountPath | string | `"/opt/nifi/provenance_repository"` |  |
| nifi-cluster.cluster.nodeConfigGroups.default_group.storageConfigs[3].name | string | `"provenance-repository-default"` |  |
| nifi-cluster.cluster.nodeConfigGroups.default_group.storageConfigs[3].pvcSpec.accessModes[0] | string | `"ReadWriteOnce"` |  |
| nifi-cluster.cluster.nodeConfigGroups.default_group.storageConfigs[3].pvcSpec.resources.requests.storage | string | `"10Gi"` |  |
| nifi-cluster.cluster.nodeConfigGroups.default_group.storageConfigs[4].mountPath | string | `"/opt/nifi/data"` |  |
| nifi-cluster.cluster.nodeConfigGroups.default_group.storageConfigs[4].name | string | `"data"` |  |
| nifi-cluster.cluster.nodeConfigGroups.default_group.storageConfigs[4].pvcSpec.accessModes[0] | string | `"ReadWriteOnce"` |  |
| nifi-cluster.cluster.nodeConfigGroups.default_group.storageConfigs[4].pvcSpec.resources.requests.storage | string | `"5Gi"` |  |
| nifi-cluster.cluster.nodes[0].id | int | `0` |  |
| nifi-cluster.cluster.nodes[0].labels.nifi_node_group | string | `"default_group"` |  |
| nifi-cluster.cluster.nodes[0].nodeConfigGroup | string | `"default_group"` |  |
| nifi-cluster.cluster.propagateLabels | bool | `false` |  |
| nifi-cluster.cluster.service.headlessEnabled | bool | `true` |  |
| nifi-cluster.cluster.maximumTimerDrivenThreadCount | int | `40` |  |
| nifi-cluster.ingress.enabled | bool | `false` |  |
| ingress.enabled | bool | `true` |  |
| ingress.annotations."nginx.ingress.kubernetes.io/backend-protocol" | string | `"HTTPS"` |  |
| ingress.annotations."nginx.ingress.kubernetes.io/affinity" | string | `"cookie"` |  |
| ingress.annotations."nginx.ingress.kubernetes.io/session-cookie-name" | string | `"route"` |  |
| ingress.annotations."nginx.ingress.kubernetes.io/session-cookie-hash" | string | `"sha1"` |  |
| ingress.annotations."cert-manager.io/cluster-issuer" | string | `"self-signed-issuer"` |  |
| ingress.hostname | string | `"nifi.{{ $.Values.serverName }}"` |  |
| ingress.ingressClassName | string | `"nginx"` |  |
| ingress.path | string | `"/"` |  |
| ingress.pathType | string | `"ImplementationSpecific"` |  |
| ingress.backend | string | `"{{ include \"common.names.fullname\" . }}-nifi-cluster-headless"` |  |
| ingress.tls | bool | `true` |  |
| ingress.existingSecret | string | `"radar-nifi-tls"` |  |
| flowLoader | object | `{"configMap":{"data":""},"enabled":false}` | Flow loader Job configuration (not functional at the moment, included for reference). Set enabled=true to run a one-shot Job that loads a flow into NiFi after startup. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
