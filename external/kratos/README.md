

# kratos

![Version: 0.43.2](https://img.shields.io/badge/Version-0.43.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.1.0](https://img.shields.io/badge/AppVersion-v1.1.0-informational?style=flat-square)

A ORY Kratos Helm chart for Kubernetes

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `1` | Number of replicas in deployment |
| strategy.type | string | `"RollingUpdate"` |  |
| strategy.rollingUpdate.maxSurge | string | `"25%"` |  |
| strategy.rollingUpdate.maxUnavailable | string | `"25%"` |  |
| image.repository | string | `"oryd/kratos"` | ORY KRATOS image |
| image.tag | string | `"v1.1.0"` | ORY KRATOS VERSION Alternative format: image: oryd/kratos:v0.6.3-alpha.1 |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| fullnameOverride | string | `""` |  |
| service.admin.enabled | bool | `true` |  |
| service.admin.type | string | `"ClusterIP"` |  |
| service.admin.loadBalancerIP | string | `""` | Load balancer IP |
| service.admin.nodePort | string | `""` |  |
| service.admin.port | int | `80` |  |
| service.admin.name | string | `"http"` | The service port name. Useful to set a custom service port name if it must follow a scheme (e.g. Istio) |
| service.admin.labels | object | `{}` | Provide custom labels. Use the same syntax as for annotations. |
| service.admin.annotations | object | `{}` | If you do want to specify annotations, uncomment the following lines, adjust them as necessary, and remove the curly braces after 'annotations:'. |
| service.admin.metricsPath | string | `"/admin/metrics/prometheus"` | Path to the metrics endpoint |
| service.public.enabled | bool | `true` |  |
| service.public.type | string | `"ClusterIP"` |  |
| service.public.loadBalancerIP | string | `""` | Load balancer IP |
| service.public.nodePort | string | `""` |  |
| service.public.port | int | `80` |  |
| service.public.name | string | `"http"` | The service port name. Useful to set a custom service port name if it must follow a scheme (e.g. Istio) |
| service.public.labels | object | `{}` | Provide custom labels. Use the same syntax as for annotations. |
| service.public.annotations | object | `{}` | If you do want to specify annotations, uncomment the following lines, adjust them as necessary, and remove the curly braces after 'annotations:'. |
| service.courier.enabled | bool | `true` |  |
| service.courier.type | string | `"ClusterIP"` |  |
| service.courier.port | int | `80` | Service Port |
| service.courier.containerPort | int | `4434` | Container Port |
| service.courier.name | string | `"http-metrics"` | The service port name. Useful to set a custom service port name if it must follow a scheme (e.g. Istio) |
| service.courier.labels | object | `{}` | Provide custom labels. Use the same syntax as for annotations. |
| service.courier.annotations | object | `{}` | Provide custom annotations. |
| service.courier.metricsPath | string | `"/metrics/prometheus"` | Path to the metrics endpoint |
| secret.enabled | bool | `true` | switch to false to prevent creating the secret |
| secret.nameOverride | string | `""` | Provide custom name of existing secret, or custom name of secret to be created |
| secret.secretAnnotations | object | `{"helm.sh/hook":"pre-install, pre-upgrade","helm.sh/hook-delete-policy":"before-hook-creation","helm.sh/hook-weight":"0","helm.sh/resource-policy":"keep"}` | Annotations to be added to secret. Annotations are added only when secret is being created. Existing secret will not be modified. |
| secret.hashSumEnabled | bool | `true` | switch to false to prevent checksum annotations being maintained and propogated to the pods |
| ingress.admin.enabled | bool | `false` |  |
| ingress.admin.className | string | `""` |  |
| ingress.admin.annotations | object | `{}` |  |
| ingress.admin.hosts[0].host | string | `"kratos.admin.local.com"` |  |
| ingress.admin.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.admin.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.admin.tls | list | `[]` |  |
| ingress.public.enabled | bool | `false` |  |
| ingress.public.className | string | `""` |  |
| ingress.public.annotations | object | `{}` |  |
| ingress.public.hosts[0].host | string | `"kratos.public.local.com"` |  |
| ingress.public.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.public.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.public.tls | list | `[]` |  |
| kratos.development | bool | `false` |  |
| kratos.automigration | object | `{"customArgs":[],"customCommand":[],"enabled":false,"resources":{},"type":"job"}` | Enables database migration |
| kratos.automigration.type | string | `"job"` | Configure the way to execute database migration. Possible values: job, initContainer When set to job, the migration will be executed as a job on release or upgrade. When set to initContainer, the migration will be executed when Kratos pod is created Defaults to job |
| kratos.automigration.customCommand | list | `[]` | Ability to override the entrypoint of the automigration container (e.g. to source dynamic secrets or export environment dynamic variables) |
| kratos.automigration.customArgs | list | `[]` | Ability to override arguments of the entrypoint. Can be used in-depended of customCommand eg: - sleep 5;   - kratos |
| kratos.automigration.resources | object | `{}` | resource requests and limits for the automigration initcontainer |
| kratos.identitySchemas | object | `{}` | You can add multiple identity schemas here. You can pass JSON schema using `--set-file` Helm CLI argument. |
| kratos.emailTemplates | object | `{}` | You can customize the emails Kratos is sending (also uncomment config.courier.template_override_path below) |
| kratos.config.courier.smtp | object | `{}` |  |
| kratos.config.serve.public.port | int | `4433` |  |
| kratos.config.serve.admin.port | int | `4434` |  |
| kratos.config.secrets | object | `{}` |  |
| deployment.lifecycle | object | `{}` |  |
| deployment.livenessProbe | object | `{"failureThreshold":5,"initialDelaySeconds":5,"periodSeconds":10}` | Configure the livenessProbe parameters |
| deployment.readinessProbe | object | `{"failureThreshold":5,"initialDelaySeconds":5,"periodSeconds":10}` | Configure the readinessProbe parameters |
| deployment.startupProbe | object | `{"failureThreshold":60,"periodSeconds":1,"successThreshold":1,"timeoutSeconds":1}` | Configure the startupProbe parameters |
| deployment.customLivenessProbe | object | `{}` | Configure a custom livenessProbe. This overwrites the default object |
| deployment.customReadinessProbe | object | `{}` | Configure a custom readinessProbe. This overwrites the default object |
| deployment.customStartupProbe | object | `{}` | Configure a custom startupProbe. This overwrites the default object |
| deployment.extraArgs | list | `[]` | Array of extra arguments to be passed down to the deployment. Kubernetes args format is expected - --foo - --sqa-opt-out |
| deployment.extraEnv | list | `[]` | Array of extra envs to be passed to the deployment. Kubernetes format is expected - name: FOO   value: BAR |
| deployment.extraVolumes | list | `[]` | If you want to mount external volume For example, mount a secret containing Certificate root CA to verify database TLS connection. |
| deployment.extraVolumeMounts | list | `[]` |  |
| deployment.extraInitContainers | string | `""` | If you want to add extra init containers. These are processed before the migration init container. |
| deployment.extraContainers | string | `""` | If you want to add extra sidecar containers. |
| deployment.resources | object | `{}` | Set desired resource parameters  We usually recommend not to specify default resources and to leave this as a conscious  choice for the user. This also increases chances charts run on environments with little  resources, such as Minikube. If you do want to specify resources, uncomment the following  lines, adjust them as necessary, and remove the curly braces after 'resources:'. |
| deployment.priorityClassName | string | `""` | Pod priority https://kubernetes.io/docs/concepts/configuration/pod-priority-preemption/ |
| deployment.nodeSelector | object | `{}` | Node labels for pod assignment. |
| deployment.tolerations | list | `[]` | Configure node tolerations. |
| deployment.affinity | object | `{}` | Configure node affinity |
| deployment.topologySpreadConstraints | list | `[]` | Configure pod topologySpreadConstraints. |
| deployment.dnsConfig | object | `{}` | Configure pod dnsConfig. |
| deployment.labels | object | `{}` |  |
| deployment.annotations | object | `{}` |  |
| deployment.serviceAccount | object | `{"annotations":{},"create":true,"name":""}` | Specify the serviceAccountName value. In some situations it is needed to provide specific permissions to Kratos deployments. Like for example installing Kratos on a cluster with a PosSecurityPolicy and Istio. Uncomment if it is needed to provide a ServiceAccount for the Kratos deployment. |
| deployment.serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| deployment.serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| deployment.serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| deployment.automountServiceAccountToken | bool | `false` |  |
| deployment.terminationGracePeriodSeconds | int | `60` |  |
| deployment.podMetadata | object | `{"annotations":{},"labels":{}}` | Specify pod metadata, this metadata is added directly to the pod, and not higher objects |
| deployment.podMetadata.labels | object | `{}` | Extra pod level labels |
| deployment.podMetadata.annotations | object | `{}` | Extra pod level annotations |
| deployment.automigration | object | `{"extraEnv":[]}` | Parameters for the automigration initContainer |
| deployment.automigration.extraEnv | list | `[]` | Array of extra envs to be passed to the initContainer. Kubernetes format is expected - name: FOO   value: BAR |
| deployment.revisionHistoryLimit | int | `5` | Number of revisions kept in history |
| deployment.podSecurityContext.fsGroupChangePolicy | string | `"OnRootMismatch"` |  |
| deployment.podSecurityContext.runAsNonRoot | bool | `true` |  |
| deployment.podSecurityContext.runAsUser | int | `65534` |  |
| deployment.podSecurityContext.fsGroup | int | `65534` |  |
| deployment.podSecurityContext.runAsGroup | int | `65534` |  |
| deployment.podSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| statefulSet.resources | object | `{}` |  |
| statefulSet.extraArgs | list | `[]` | Array of extra arguments to be passed down to the StatefulSet. Kubernetes args format is expected |
| statefulSet.extraEnv | list | `[]` |  |
| statefulSet.extraVolumes | list | `[]` | If you want to mount external volume For example, mount a secret containing Certificate root CA to verify database TLS connection. |
| statefulSet.extraVolumeMounts | list | `[]` |  |
| statefulSet.extraInitContainers | string | `""` | If you want to add extra init containers. These are processed before the migration init container. |
| statefulSet.extraContainers | string | `""` | If you want to add extra sidecar containers. |
| statefulSet.annotations | object | `{}` |  |
| statefulSet.labels | object | `{}` | The secret specified here will be used to load environment variables with envFrom. This allows arbitrary environment variables to be provided to the application which is useful for sensitive values which should not be in a configMap. This secret is not created by the helm chart and must already exist in the namespace. https://kubernetes.io/docs/tasks/inject-data-application/distribute-credentials-secure/#configure-all-key-value-pairs-in-a-secret-as-container-environment-variables environmentSecretsName: |
| statefulSet.priorityClassName | string | `""` | Pod priority https://kubernetes.io/docs/concepts/configuration/pod-priority-preemption/ |
| statefulSet.nodeSelector | object | `{}` | Node labels for pod assignment. |
| statefulSet.tolerations | list | `[]` | Configure node tolerations. |
| statefulSet.affinity | object | `{}` | Configure node affinity |
| statefulSet.topologySpreadConstraints | list | `[]` | Configure pod topologySpreadConstraints. |
| statefulSet.dnsConfig | object | `{}` | Configure pod dnsConfig. |
| statefulSet.log.format | string | `"json"` |  |
| statefulSet.log.level | string | `"trace"` |  |
| statefulSet.podMetadata.labels | object | `{}` | Extra pod level labels |
| statefulSet.podMetadata.annotations | object | `{}` | Extra pod level annotations |
| statefulSet.revisionHistoryLimit | int | `5` | Number of revisions kept in history |
| statefulSet.terminationGracePeriodSeconds | int | `60` |  |
| statefulSet.podSecurityContext.fsGroupChangePolicy | string | `"OnRootMismatch"` |  |
| statefulSet.podSecurityContext.runAsNonRoot | bool | `true` |  |
| statefulSet.podSecurityContext.runAsUser | int | `65534` |  |
| statefulSet.podSecurityContext.fsGroup | int | `65534` |  |
| statefulSet.podSecurityContext.runAsGroup | int | `65534` |  |
| statefulSet.podSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| securityContext.readOnlyRootFilesystem | bool | `true` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `65534` |  |
| securityContext.runAsGroup | int | `65534` |  |
| securityContext.allowPrivilegeEscalation | bool | `false` |  |
| securityContext.privileged | bool | `false` |  |
| securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| securityContext.seLinuxOptions.level | string | `"s0:c123,c456"` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.maxReplicas | int | `3` |  |
| autoscaling.targetCPU | object | `{}` |  |
| autoscaling.targetMemory | object | `{}` |  |
| autoscaling.behavior | object | `{}` | Set custom behavior https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/#configurable-scaling-behavior |
| job.annotations | object | `{"helm.sh/hook":"pre-install, pre-upgrade","helm.sh/hook-delete-policy":"before-hook-creation,hook-succeeded","helm.sh/hook-weight":"1"}` | If you do want to specify annotations, uncomment the following lines, adjust them as necessary, and remove the curly braces after 'annotations:'. |
| job.extraContainers | string | `""` | If you want to add extra sidecar containers. |
| job.extraInitContainers | string | `""` | If you want to add extra init containers. |
| job.extraEnv | list | `[]` | Array of extra envs to be passed to the job. This takes precedence over deployment variables. Kubernetes format is expected - name: FOO   value: BAR |
| job.nodeSelector | object | `{}` | Node labels for pod assignment. |
| job.resources | object | `{}` | resource requests and limits for the job |
| job.tolerations | list | `[]` | Configure node tolerations. |
| job.lifecycle | string | `""` | If you want to add lifecycle hooks. |
| job.automountServiceAccountToken | bool | `false` | Set automounting of the SA token |
| job.shareProcessNamespace | bool | `false` | Set sharing process namespace |
| job.serviceAccount | object | `{"annotations":{"helm.sh/hook":"pre-install, pre-upgrade","helm.sh/hook-delete-policy":"before-hook-creation","helm.sh/hook-weight":"0"},"create":true,"name":""}` | Specify the serviceAccountName value. In some situations it is needed to provide specific permissions to Kratos deployments Like for example installing Kratos on a cluster with a PosSecurityPolicy and Istio. Uncomment if it is needed to provide a ServiceAccount for the Kratos deployment. |
| job.serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| job.serviceAccount.annotations | object | `{"helm.sh/hook":"pre-install, pre-upgrade","helm.sh/hook-delete-policy":"before-hook-creation","helm.sh/hook-weight":"0"}` | Annotations to add to the service account |
| job.serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| job.podMetadata | object | `{"annotations":{},"labels":{}}` | Specify pod metadata, this metadata is added directly to the pod, and not higher objects |
| job.podMetadata.labels | object | `{}` | Extra pod level labels |
| job.podMetadata.annotations | object | `{}` | Extra pod level annotations |
| job.spec.backoffLimit | int | `10` | Set job back off limit |
| courier | object | `{"enabled":true}` | Configuration of the courier |
| watcher.enabled | bool | `false` |  |
| watcher.image | string | `"oryd/k8s-toolbox:0.0.5"` |  |
| watcher.mountFile | string | `""` | Path to mounted file, which wil be monitored for changes. eg: /etc/secrets/my-secret/foo |
| watcher.podMetadata | object | `{"annotations":{},"labels":{}}` | Specify pod metadata, this metadata is added directly to the pod, and not higher objects |
| watcher.podMetadata.labels | object | `{}` | Extra pod level labels |
| watcher.podMetadata.annotations | object | `{}` | Extra pod level annotations |
| watcher.watchLabelKey | string | `"ory.sh/watcher"` | Label key used for managing applications |
| watcher.revisionHistoryLimit | int | `5` | Number of revisions kept in history |
| watcher.automountServiceAccountToken | bool | `true` |  |
| watcher.resources | object | `{}` |  |
| cleanup | object | `{"batchSize":100,"enabled":false,"keepLast":"6h","sleepTables":"1m0s"}` | SQL cleanup cron job configuration |
| cleanup.enabled | bool | `false` | Enable cleanup of stale database rows by periodically running the cleanup sql command |
| cleanup.batchSize | int | `100` | Configure how many records are cleaned per run |
| cleanup.sleepTables | string | `"1m0s"` | Configure how long to wait between each table cleanup |
| cleanup.keepLast | string | `"6h"` | Configure the youngest records to keep |
| cronjob.cleanup.schedule | string | `"0 */1 * * *"` | Configure how often the cron job is ran |
| cronjob.cleanup.customArgs | list | `[]` | Configure the arguments of the entrypoint, overriding the default value |
| cronjob.cleanup.extraEnv | list | `[]` | Array of extra envs to be passed to the cronjob. This takes precedence over deployment variables. Kubernetes format is expected - name: FOO   value: BAR |
| cronjob.cleanup.labels | object | `{}` | Set custom cron job level labels |
| cronjob.cleanup.annotations | object | `{}` | Set custom cron job level annotations |
| cronjob.cleanup.podMetadata | object | `{"annotations":{},"labels":{}}` | Specify pod metadata, this metadata is added directly to the pod, and not higher objects |
| cronjob.cleanup.podMetadata.labels | object | `{}` | Extra pod level labels |
| cronjob.cleanup.podMetadata.annotations | object | `{}` | Extra pod level annotations |
| cronjob.cleanup.nodeSelector | object | `{}` | Configure node labels for pod assignment |
| cronjob.cleanup.tolerations | list | `[]` | Configure node tolerations |
| cronjob.cleanup.affinity | object | `{}` | Configure node affinity |
| cronjob.cleanup.resources | object | `{"limits":{},"requests":{}}` | We usually recommend not to specify default resources and to leave this as a conscious choice for the user.  This also increases chances charts run on environments with little  resources, such as Minikube. If you do want to specify resources, uncomment the following  lines, adjust them as necessary, and remove the curly braces after 'resources:'.  limits:    cpu: 100m    memory: 128Mi  requests:    cpu: 100m  memory: 128Mi |
| pdb.enabled | bool | `false` |  |
| pdb.spec.minAvailable | string | `""` |  |
| pdb.spec.maxUnavailable | string | `""` |  |
| serviceMonitor.enabled | bool | `false` | switch to true to enable creating the ServiceMonitor |
| serviceMonitor.scheme | string | `"http"` | HTTP scheme to use for scraping. |
| serviceMonitor.scrapeInterval | string | `"60s"` | Interval at which metrics should be scraped |
| serviceMonitor.scrapeTimeout | string | `"30s"` | Timeout after which the scrape is ended |
| serviceMonitor.labels | object | `{}` | Provide additional labels to the ServiceMonitor ressource metadata |
| serviceMonitor.tlsConfig | object | `{}` | TLS configuration to use when scraping the endpoint |
| configmap.hashSumEnabled | bool | `true` | switch to false to prevent checksum annotations being maintained and propogated to the pods |
| configmap.annotations | object | `{}` | If you do want to specify annotations for configmap, uncomment the following lines, adjust them as necessary, and remove the curly braces after 'annotations:'. |
| test.busybox | object | `{"repository":"busybox","tag":1}` | use a busybox image from another repository |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.3](https://github.com/norwoodj/helm-docs/releases/v1.11.3)
