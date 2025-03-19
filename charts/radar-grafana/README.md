

# radar-grafana

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 11.2.2-security-01](https://img.shields.io/badge/AppVersion-11.2.2--security--01-informational?style=flat-square)

A Helm chart for Graphana dashboard used by RADAR-base

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Keyvan Hedayati | <keyvan@thehyve.nl> | <https://www.thehyve.nl> |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../external/grafana | grafana | 8.3.7 |
| https://radar-base.github.io/radar-helm-charts | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| grafana.global.imageRegistry | string | `nil` | Overrides the Docker registry globally for all images |
| grafana.global.imagePullSecrets | list | `[]` |  |
| grafana.rbac.create | bool | `true` |  |
| grafana.rbac.pspEnabled | bool | `false` |  |
| grafana.rbac.pspUseAppArmor | bool | `false` |  |
| grafana.rbac.namespaced | bool | `false` |  |
| grafana.rbac.extraRoleRules | list | `[]` |  |
| grafana.rbac.extraClusterRoleRules | list | `[]` |  |
| grafana.serviceAccount.create | bool | `true` |  |
| grafana.serviceAccount.name | string | `nil` |  |
| grafana.serviceAccount.nameTest | string | `nil` |  |
| grafana.serviceAccount.labels | object | `{}` |  |
| grafana.serviceAccount.automountServiceAccountToken | bool | `false` |  |
| grafana.replicas | int | `1` |  |
| grafana.headlessService | bool | `false` |  |
| grafana.automountServiceAccountToken | bool | `true` |  |
| grafana.autoscaling.enabled | bool | `false` |  |
| grafana.autoscaling.minReplicas | int | `1` |  |
| grafana.autoscaling.maxReplicas | int | `5` |  |
| grafana.autoscaling.targetCPU | string | `"60"` |  |
| grafana.autoscaling.targetMemory | string | `""` |  |
| grafana.autoscaling.behavior | object | `{}` |  |
| grafana.podDisruptionBudget | object | `{}` |  |
| grafana.deploymentStrategy.type | string | `"RollingUpdate"` |  |
| grafana.readinessProbe.httpGet.path | string | `"/api/health"` |  |
| grafana.readinessProbe.httpGet.port | int | `3000` |  |
| grafana.livenessProbe.httpGet.path | string | `"/api/health"` |  |
| grafana.livenessProbe.httpGet.port | int | `3000` |  |
| grafana.livenessProbe.initialDelaySeconds | int | `60` |  |
| grafana.livenessProbe.timeoutSeconds | int | `30` |  |
| grafana.livenessProbe.failureThreshold | int | `10` |  |
| grafana.image.registry | string | `"docker.io"` | The Docker registry |
| grafana.image.repository | string | `"grafana/grafana"` | Docker image repository |
| grafana.image.tag | string | `""` |  |
| grafana.image.sha | string | `""` |  |
| grafana.image.pullPolicy | string | `"IfNotPresent"` |  |
| grafana.image.pullSecrets | list | `[]` |  |
| grafana.testFramework.enabled | bool | `true` |  |
| grafana.testFramework.image.registry | string | `"docker.io"` | The Docker registry |
| grafana.testFramework.image.repository | string | `"bats/bats"` |  |
| grafana.testFramework.image.tag | string | `"v1.4.1"` |  |
| grafana.testFramework.imagePullPolicy | string | `"IfNotPresent"` |  |
| grafana.testFramework.securityContext | object | `{}` |  |
| grafana.testFramework.resources | object | `{}` |  |
| grafana.dnsPolicy | string | `nil` |  |
| grafana.dnsConfig | object | `{}` |  |
| grafana.securityContext.runAsNonRoot | bool | `true` |  |
| grafana.securityContext.runAsUser | int | `472` |  |
| grafana.securityContext.runAsGroup | int | `472` |  |
| grafana.securityContext.fsGroup | int | `472` |  |
| grafana.containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| grafana.containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| grafana.containerSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| grafana.createConfigmap | bool | `true` |  |
| grafana.extraConfigmapMounts | list | `[]` |  |
| grafana.extraEmptyDirMounts | list | `[]` |  |
| grafana.extraLabels | object | `{}` |  |
| grafana.downloadDashboardsImage.registry | string | `"docker.io"` | The Docker registry |
| grafana.downloadDashboardsImage.repository | string | `"curlimages/curl"` |  |
| grafana.downloadDashboardsImage.tag | string | `"7.85.0"` |  |
| grafana.downloadDashboardsImage.sha | string | `""` |  |
| grafana.downloadDashboardsImage.pullPolicy | string | `"IfNotPresent"` |  |
| grafana.downloadDashboards.env.GF_DASHBOARDS_DEFAULT_HOME_DASHBOARD_PATH | string | `"/var/lib/grafana/dashboards/allprojects/home.json"` |  |
| grafana.downloadDashboards.envFromSecret | string | `""` |  |
| grafana.downloadDashboards.resources | object | `{}` |  |
| grafana.downloadDashboards.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| grafana.downloadDashboards.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| grafana.downloadDashboards.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| grafana.podPortName | string | `"grafana"` |  |
| grafana.gossipPortName | string | `"gossip"` |  |
| grafana.service.enabled | bool | `true` |  |
| grafana.service.type | string | `"ClusterIP"` |  |
| grafana.service.ipFamilyPolicy | string | `""` |  |
| grafana.service.ipFamilies | list | `[]` |  |
| grafana.service.loadBalancerIP | string | `""` |  |
| grafana.service.loadBalancerClass | string | `""` |  |
| grafana.service.loadBalancerSourceRanges | list | `[]` |  |
| grafana.service.port | int | `80` |  |
| grafana.service.targetPort | int | `3000` |  |
| grafana.service.annotations | object | `{}` |  |
| grafana.service.labels | object | `{}` |  |
| grafana.service.portName | string | `"service"` |  |
| grafana.service.appProtocol | string | `""` |  |
| grafana.serviceMonitor.enabled | bool | `false` |  |
| grafana.serviceMonitor.path | string | `"/metrics"` |  |
| grafana.serviceMonitor.labels | object | `{}` |  |
| grafana.serviceMonitor.interval | string | `"30s"` |  |
| grafana.serviceMonitor.scheme | string | `"http"` |  |
| grafana.serviceMonitor.tlsConfig | object | `{}` |  |
| grafana.serviceMonitor.scrapeTimeout | string | `"30s"` |  |
| grafana.serviceMonitor.relabelings | list | `[]` |  |
| grafana.serviceMonitor.metricRelabelings | list | `[]` |  |
| grafana.serviceMonitor.targetLabels | list | `[]` |  |
| grafana.extraExposePorts | list | `[]` |  |
| grafana.hostAliases | list | `[]` |  |
| grafana.ingress.enabled | bool | `true` |  |
| grafana.ingress.annotations."kubernetes.io/ingress.class" | string | `"nginx"` |  |
| grafana.ingress.annotations."cert-manager.io/cluster-issuer" | string | `"letsencrypt-prod"` |  |
| grafana.ingress.labels | object | `{}` |  |
| grafana.ingress.path | string | `"/"` |  |
| grafana.ingress.pathType | string | `"Prefix"` |  |
| grafana.ingress.hosts[0] | string | `"chart-example.local"` |  |
| grafana.ingress.extraPaths | list | `[]` |  |
| grafana.ingress.tls[0].secretName | string | `"radar-base-tls-dashboard"` |  |
| grafana.ingress.tls[0].hosts[0] | string | `"localhost"` |  |
| grafana.resources | object | `{}` |  |
| grafana.nodeSelector | object | `{}` |  |
| grafana.tolerations | list | `[]` |  |
| grafana.affinity | object | `{}` |  |
| grafana.topologySpreadConstraints | list | `[]` |  |
| grafana.extraInitContainers | list | `[]` |  |
| grafana.extraContainers | string | `""` |  |
| grafana.extraContainerVolumes | list | `[]` |  |
| grafana.persistence.type | string | `"pvc"` |  |
| grafana.persistence.enabled | bool | `true` |  |
| grafana.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| grafana.persistence.size | string | `"10Gi"` |  |
| grafana.persistence.finalizers[0] | string | `"kubernetes.io/pvc-protection"` |  |
| grafana.persistence.extraPvcLabels | object | `{}` |  |
| grafana.persistence.disableWarning | bool | `false` |  |
| grafana.persistence.inMemory.enabled | bool | `false` |  |
| grafana.persistence.lookupVolumeName | bool | `true` |  |
| grafana.initChownData.enabled | bool | `true` |  |
| grafana.initChownData.image.registry | string | `"docker.io"` | The Docker registry |
| grafana.initChownData.image.repository | string | `"library/busybox"` |  |
| grafana.initChownData.image.tag | string | `"1.31.1"` |  |
| grafana.initChownData.image.sha | string | `""` |  |
| grafana.initChownData.image.pullPolicy | string | `"IfNotPresent"` |  |
| grafana.initChownData.resources | object | `{}` |  |
| grafana.initChownData.securityContext.runAsNonRoot | bool | `false` |  |
| grafana.initChownData.securityContext.runAsUser | int | `0` |  |
| grafana.initChownData.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| grafana.initChownData.securityContext.capabilities.add[0] | string | `"CHOWN"` |  |
| grafana.adminUser | string | `"admin"` |  |
| grafana.admin.existingSecret | string | `""` |  |
| grafana.admin.userKey | string | `"admin-user"` |  |
| grafana.admin.passwordKey | string | `"admin-password"` |  |
| grafana.env.GF_USERS_DEFAULT_THEME | string | `"light"` |  |
| grafana.envValueFrom.POSTGRES_USER.secretKeyRef.name | string | `"radar-jdbc-connector-grafana-timescaledb-app"` |  |
| grafana.envValueFrom.POSTGRES_USER.secretKeyRef.key | string | `"username"` |  |
| grafana.envValueFrom.POSTGRES_PASSWORD.secretKeyRef.name | string | `"radar-jdbc-connector-grafana-timescaledb-app"` |  |
| grafana.envValueFrom.POSTGRES_PASSWORD.secretKeyRef.key | string | `"password"` |  |
| grafana.envValueFrom.POSTGRES_DB.secretKeyRef.name | string | `"radar-jdbc-connector-grafana-timescaledb-app"` |  |
| grafana.envValueFrom.POSTGRES_DB.secretKeyRef.key | string | `"dbname"` |  |
| grafana.envValueFrom.POSTGRES_HOST.secretKeyRef.name | string | `"radar-jdbc-connector-grafana-timescaledb-app"` |  |
| grafana.envValueFrom.POSTGRES_HOST.secretKeyRef.key | string | `"host"` |  |
| grafana.envFromSecret | string | `""` |  |
| grafana.envRenderSecret.POSTGRES_PASSWORD | string | `"pass"` |  |
| grafana.envFromSecrets | list | `[]` |  |
| grafana.envFromConfigMaps | list | `[]` |  |
| grafana.enableServiceLinks | bool | `true` |  |
| grafana.extraSecretMounts | list | `[]` |  |
| grafana.extraVolumeMounts | list | `[]` |  |
| grafana.extraVolumes | list | `[]` |  |
| grafana.lifecycleHooks | object | `{}` |  |
| grafana.plugins | list | `[]` |  |
| grafana.datasources."datasources.yaml".apiVersion | int | `1` |  |
| grafana.datasources."datasources.yaml".datasources[0].id | int | `1` |  |
| grafana.datasources."datasources.yaml".datasources[0].orgId | int | `1` |  |
| grafana.datasources."datasources.yaml".datasources[0].name | string | `"PostgreSQL"` |  |
| grafana.datasources."datasources.yaml".datasources[0].type | string | `"postgres"` |  |
| grafana.datasources."datasources.yaml".datasources[0].typeLogoUrl | string | `"public/app/plugins/datasource/postgres/img/postgresql_logo.svg"` |  |
| grafana.datasources."datasources.yaml".datasources[0].access | string | `"proxy"` |  |
| grafana.datasources."datasources.yaml".datasources[0].url | string | `"${POSTGRES_HOST}"` |  |
| grafana.datasources."datasources.yaml".datasources[0].secureJsonData.password | string | `"${POSTGRES_PASSWORD}"` |  |
| grafana.datasources."datasources.yaml".datasources[0].user | string | `"${POSTGRES_USER}"` |  |
| grafana.datasources."datasources.yaml".datasources[0].database | string | `"${POSTGRES_DB}"` |  |
| grafana.datasources."datasources.yaml".datasources[0].basicAuth | bool | `false` |  |
| grafana.datasources."datasources.yaml".datasources[0].isDefault | bool | `true` |  |
| grafana.datasources."datasources.yaml".datasources[0].jsonData.postgresVersion | int | `1200` |  |
| grafana.datasources."datasources.yaml".datasources[0].jsonData.timescaledb | bool | `true` |  |
| grafana.datasources."datasources.yaml".datasources[0].jsonData.sslmode | string | `"disable"` |  |
| grafana.datasources."datasources.yaml".datasources[0].readOnly | bool | `true` |  |
| grafana.alerting | object | `{}` |  |
| grafana.notifiers | object | `{}` |  |
| grafana.dashboardProviders."dashboardproviders.yaml".apiVersion | int | `1` |  |
| grafana.dashboardProviders."dashboardproviders.yaml".providers[0].name | string | `"allprojects"` |  |
| grafana.dashboardProviders."dashboardproviders.yaml".providers[0].orgId | int | `1` |  |
| grafana.dashboardProviders."dashboardproviders.yaml".providers[0].folder | string | `"All Projects"` |  |
| grafana.dashboardProviders."dashboardproviders.yaml".providers[0].type | string | `"file"` |  |
| grafana.dashboardProviders."dashboardproviders.yaml".providers[0].disableDeletion | bool | `false` |  |
| grafana.dashboardProviders."dashboardproviders.yaml".providers[0].editable | bool | `true` |  |
| grafana.dashboardProviders."dashboardproviders.yaml".providers[0].options.path | string | `"/var/lib/grafana/dashboards/allprojects"` |  |
| grafana.dashboards | object | `{}` |  |
| grafana.dashboardsConfigMaps | object | `{}` |  |
| grafana."grafana.ini".paths.data | string | `"/var/lib/grafana/"` |  |
| grafana."grafana.ini".paths.logs | string | `"/var/log/grafana"` |  |
| grafana."grafana.ini".paths.plugins | string | `"/var/lib/grafana/plugins"` |  |
| grafana."grafana.ini".paths.provisioning | string | `"/etc/grafana/provisioning"` |  |
| grafana."grafana.ini".analytics.check_for_updates | bool | `true` |  |
| grafana."grafana.ini".log.mode | string | `"console"` |  |
| grafana."grafana.ini".grafana_net.url | string | `"https://grafana.net"` |  |
| grafana."grafana.ini".server.domain | string | `"{{ if (and .Values.ingress.enabled .Values.ingress.hosts) }}{{ .Values.ingress.hosts | first }}{{ else }}''{{ end }}"` |  |
| grafana."grafana.ini".users.auto_assign_org | bool | `true` |  |
| grafana."grafana.ini".users.auto_assign_org_role | string | `"Editor"` |  |
| grafana."grafana.ini"."auth.generic_oauth".name | string | `"managementportal"` |  |
| grafana."grafana.ini"."auth.generic_oauth".enabled | bool | `true` |  |
| grafana."grafana.ini"."auth.generic_oauth".auth_url | string | `"http://localhost/managementportal/oauth/authorize"` |  |
| grafana."grafana.ini"."auth.generic_oauth".token_url | string | `"https://localhost/managementportal/oauth/token"` |  |
| grafana."grafana.ini"."auth.generic_oauth".api_url | string | `"http://management-portal:8080/managementportal/api/account"` |  |
| grafana."grafana.ini"."auth.generic_oauth".client_id | string | `"grafana_dashboard"` |  |
| grafana."grafana.ini"."auth.generic_oauth".oauth_allow_insecure_email_lookup | bool | `true` |  |
| grafana."grafana.ini"."auth.generic_oauth".empty_scopes | bool | `true` |  |
| grafana.ldap.enabled | bool | `false` |  |
| grafana.ldap.existingSecret | string | `""` |  |
| grafana.ldap.config | string | `""` |  |
| grafana.smtp.existingSecret | string | `""` |  |
| grafana.smtp.userKey | string | `"user"` |  |
| grafana.smtp.passwordKey | string | `"password"` |  |
| grafana.sidecar.image.registry | string | `"quay.io"` | The Docker registry |
| grafana.sidecar.image.repository | string | `"kiwigrid/k8s-sidecar"` |  |
| grafana.sidecar.image.tag | string | `"1.27.4"` |  |
| grafana.sidecar.image.sha | string | `""` |  |
| grafana.sidecar.imagePullPolicy | string | `"IfNotPresent"` |  |
| grafana.sidecar.resources | object | `{}` |  |
| grafana.sidecar.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| grafana.sidecar.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| grafana.sidecar.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| grafana.sidecar.enableUniqueFilenames | bool | `false` |  |
| grafana.sidecar.readinessProbe | object | `{}` |  |
| grafana.sidecar.livenessProbe | object | `{}` |  |
| grafana.sidecar.alerts.enabled | bool | `false` |  |
| grafana.sidecar.alerts.env | object | `{}` |  |
| grafana.sidecar.alerts.label | string | `"grafana_alert"` |  |
| grafana.sidecar.alerts.labelValue | string | `""` |  |
| grafana.sidecar.alerts.searchNamespace | string | `nil` |  |
| grafana.sidecar.alerts.watchMethod | string | `"WATCH"` |  |
| grafana.sidecar.alerts.resource | string | `"both"` |  |
| grafana.sidecar.alerts.reloadURL | string | `"http://localhost:3000/api/admin/provisioning/alerting/reload"` |  |
| grafana.sidecar.alerts.script | string | `nil` |  |
| grafana.sidecar.alerts.skipReload | bool | `false` |  |
| grafana.sidecar.alerts.initAlerts | bool | `false` |  |
| grafana.sidecar.alerts.extraMounts | list | `[]` |  |
| grafana.sidecar.alerts.sizeLimit | object | `{}` |  |
| grafana.sidecar.dashboards.enabled | bool | `false` |  |
| grafana.sidecar.dashboards.env | object | `{}` |  |
| grafana.sidecar.dashboards.envValueFrom | object | `{}` |  |
| grafana.sidecar.dashboards.SCProvider | bool | `true` |  |
| grafana.sidecar.dashboards.label | string | `"grafana_dashboard"` |  |
| grafana.sidecar.dashboards.labelValue | string | `""` |  |
| grafana.sidecar.dashboards.folder | string | `"/tmp/dashboards"` |  |
| grafana.sidecar.dashboards.defaultFolderName | string | `nil` |  |
| grafana.sidecar.dashboards.searchNamespace | string | `nil` |  |
| grafana.sidecar.dashboards.watchMethod | string | `"WATCH"` |  |
| grafana.sidecar.dashboards.resource | string | `"both"` |  |
| grafana.sidecar.dashboards.folderAnnotation | string | `nil` |  |
| grafana.sidecar.dashboards.reloadURL | string | `"http://localhost:3000/api/admin/provisioning/dashboards/reload"` |  |
| grafana.sidecar.dashboards.script | string | `nil` |  |
| grafana.sidecar.dashboards.skipReload | bool | `false` |  |
| grafana.sidecar.dashboards.provider.name | string | `"sidecarProvider"` |  |
| grafana.sidecar.dashboards.provider.orgid | int | `1` |  |
| grafana.sidecar.dashboards.provider.folder | string | `""` |  |
| grafana.sidecar.dashboards.provider.folderUid | string | `""` |  |
| grafana.sidecar.dashboards.provider.type | string | `"file"` |  |
| grafana.sidecar.dashboards.provider.disableDelete | bool | `false` |  |
| grafana.sidecar.dashboards.provider.allowUiUpdates | bool | `false` |  |
| grafana.sidecar.dashboards.provider.foldersFromFilesStructure | bool | `false` |  |
| grafana.sidecar.dashboards.extraMounts | list | `[]` |  |
| grafana.sidecar.dashboards.sizeLimit | object | `{}` |  |
| grafana.sidecar.datasources.enabled | bool | `false` |  |
| grafana.sidecar.datasources.env | object | `{}` |  |
| grafana.sidecar.datasources.envValueFrom | object | `{}` |  |
| grafana.sidecar.datasources.label | string | `"grafana_datasource"` |  |
| grafana.sidecar.datasources.labelValue | string | `""` |  |
| grafana.sidecar.datasources.searchNamespace | string | `nil` |  |
| grafana.sidecar.datasources.watchMethod | string | `"WATCH"` |  |
| grafana.sidecar.datasources.resource | string | `"both"` |  |
| grafana.sidecar.datasources.reloadURL | string | `"http://localhost:3000/api/admin/provisioning/datasources/reload"` |  |
| grafana.sidecar.datasources.script | string | `nil` |  |
| grafana.sidecar.datasources.skipReload | bool | `false` |  |
| grafana.sidecar.datasources.initDatasources | bool | `false` |  |
| grafana.sidecar.datasources.sizeLimit | object | `{}` |  |
| grafana.sidecar.plugins.enabled | bool | `false` |  |
| grafana.sidecar.plugins.env | object | `{}` |  |
| grafana.sidecar.plugins.label | string | `"grafana_plugin"` |  |
| grafana.sidecar.plugins.labelValue | string | `""` |  |
| grafana.sidecar.plugins.searchNamespace | string | `nil` |  |
| grafana.sidecar.plugins.watchMethod | string | `"WATCH"` |  |
| grafana.sidecar.plugins.resource | string | `"both"` |  |
| grafana.sidecar.plugins.reloadURL | string | `"http://localhost:3000/api/admin/provisioning/plugins/reload"` |  |
| grafana.sidecar.plugins.script | string | `nil` |  |
| grafana.sidecar.plugins.skipReload | bool | `false` |  |
| grafana.sidecar.plugins.initPlugins | bool | `false` |  |
| grafana.sidecar.plugins.sizeLimit | object | `{}` |  |
| grafana.sidecar.notifiers.enabled | bool | `false` |  |
| grafana.sidecar.notifiers.env | object | `{}` |  |
| grafana.sidecar.notifiers.label | string | `"grafana_notifier"` |  |
| grafana.sidecar.notifiers.labelValue | string | `""` |  |
| grafana.sidecar.notifiers.searchNamespace | string | `nil` |  |
| grafana.sidecar.notifiers.watchMethod | string | `"WATCH"` |  |
| grafana.sidecar.notifiers.resource | string | `"both"` |  |
| grafana.sidecar.notifiers.reloadURL | string | `"http://localhost:3000/api/admin/provisioning/notifications/reload"` |  |
| grafana.sidecar.notifiers.script | string | `nil` |  |
| grafana.sidecar.notifiers.skipReload | bool | `false` |  |
| grafana.sidecar.notifiers.initNotifiers | bool | `false` |  |
| grafana.sidecar.notifiers.sizeLimit | object | `{}` |  |
| grafana.namespaceOverride | string | `""` |  |
| grafana.revisionHistoryLimit | int | `10` |  |
| grafana.imageRenderer.deploymentStrategy | object | `{}` |  |
| grafana.imageRenderer.enabled | bool | `false` |  |
| grafana.imageRenderer.replicas | int | `1` |  |
| grafana.imageRenderer.autoscaling.enabled | bool | `false` |  |
| grafana.imageRenderer.autoscaling.minReplicas | int | `1` |  |
| grafana.imageRenderer.autoscaling.maxReplicas | int | `5` |  |
| grafana.imageRenderer.autoscaling.targetCPU | string | `"60"` |  |
| grafana.imageRenderer.autoscaling.targetMemory | string | `""` |  |
| grafana.imageRenderer.autoscaling.behavior | object | `{}` |  |
| grafana.imageRenderer.image.registry | string | `"docker.io"` | The Docker registry |
| grafana.imageRenderer.image.repository | string | `"grafana/grafana-image-renderer"` |  |
| grafana.imageRenderer.image.tag | string | `"latest"` |  |
| grafana.imageRenderer.image.sha | string | `""` |  |
| grafana.imageRenderer.image.pullPolicy | string | `"Always"` |  |
| grafana.imageRenderer.env.HTTP_HOST | string | `"0.0.0.0"` |  |
| grafana.imageRenderer.envValueFrom | object | `{}` |  |
| grafana.imageRenderer.serviceAccountName | string | `""` |  |
| grafana.imageRenderer.securityContext | object | `{}` |  |
| grafana.imageRenderer.containerSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| grafana.imageRenderer.containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| grafana.imageRenderer.containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| grafana.imageRenderer.containerSecurityContext.readOnlyRootFilesystem | bool | `true` |  |
| grafana.imageRenderer.podAnnotations | object | `{}` |  |
| grafana.imageRenderer.hostAliases | list | `[]` |  |
| grafana.imageRenderer.priorityClassName | string | `""` |  |
| grafana.imageRenderer.service.enabled | bool | `true` |  |
| grafana.imageRenderer.service.portName | string | `"http"` |  |
| grafana.imageRenderer.service.port | int | `8081` |  |
| grafana.imageRenderer.service.targetPort | int | `8081` |  |
| grafana.imageRenderer.service.appProtocol | string | `""` |  |
| grafana.imageRenderer.serviceMonitor.enabled | bool | `false` |  |
| grafana.imageRenderer.serviceMonitor.path | string | `"/metrics"` |  |
| grafana.imageRenderer.serviceMonitor.labels | object | `{}` |  |
| grafana.imageRenderer.serviceMonitor.interval | string | `"1m"` |  |
| grafana.imageRenderer.serviceMonitor.scheme | string | `"http"` |  |
| grafana.imageRenderer.serviceMonitor.tlsConfig | object | `{}` |  |
| grafana.imageRenderer.serviceMonitor.scrapeTimeout | string | `"30s"` |  |
| grafana.imageRenderer.serviceMonitor.relabelings | list | `[]` |  |
| grafana.imageRenderer.serviceMonitor.targetLabels | list | `[]` |  |
| grafana.imageRenderer.grafanaProtocol | string | `"http"` |  |
| grafana.imageRenderer.grafanaSubPath | string | `""` |  |
| grafana.imageRenderer.podPortName | string | `"http"` |  |
| grafana.imageRenderer.revisionHistoryLimit | int | `10` |  |
| grafana.imageRenderer.networkPolicy.limitIngress | bool | `true` |  |
| grafana.imageRenderer.networkPolicy.limitEgress | bool | `false` |  |
| grafana.imageRenderer.networkPolicy.extraIngressSelectors | list | `[]` |  |
| grafana.imageRenderer.resources | object | `{}` |  |
| grafana.imageRenderer.nodeSelector | object | `{}` |  |
| grafana.imageRenderer.tolerations | list | `[]` |  |
| grafana.imageRenderer.affinity | object | `{}` |  |
| grafana.imageRenderer.extraConfigmapMounts | list | `[]` |  |
| grafana.imageRenderer.extraSecretMounts | list | `[]` |  |
| grafana.imageRenderer.extraVolumeMounts | list | `[]` |  |
| grafana.imageRenderer.extraVolumes | list | `[]` |  |
| grafana.networkPolicy.enabled | bool | `false` |  |
| grafana.networkPolicy.ingress | bool | `true` |  |
| grafana.networkPolicy.allowExternal | bool | `true` |  |
| grafana.networkPolicy.explicitNamespacesSelector | object | `{}` |  |
| grafana.networkPolicy.egress.enabled | bool | `false` |  |
| grafana.networkPolicy.egress.blockDNSResolution | bool | `false` |  |
| grafana.networkPolicy.egress.ports | list | `[]` |  |
| grafana.networkPolicy.egress.to | list | `[]` |  |
| grafana.enableKubeBackwardCompatibility | bool | `false` |  |
| grafana.useStatefulSet | bool | `false` |  |
| grafana.extraObjects | list | `[]` |  |
| grafana.assertNoLeakedSecrets | bool | `false` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
