

# radar-self-enrolment-ui

![Version: 0.0.2](https://img.shields.io/badge/Version-0.0.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.1](https://img.shields.io/badge/AppVersion-0.0.1-informational?style=flat-square)

A Helm chart for ORY Kratos's example ui for Kubernetes

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `1` | Number of replicas in deployment |
| revisionHistoryLimit | int | `5` | Number of revisions kept in history |
| image.repository | string | `"ghcr.io/radar-base/radar-self-enrolment-ui"` |  |
| image.tag | string | `"dev"` | Image version |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| fullnameOverride | string | `""` |  |
| config.csrfCookieName | string | `""` |  |
| config.secrets | object | `{}` |  |
| service.type | string | `"ClusterIP"` |  |
| service.loadBalancerIP | string | `""` | The load balancer IP |
| service.nodePort | string | `""` |  |
| service.port | int | `80` |  |
| service.name | string | `"http"` | The service port name. Useful to set a custom service port name if it must follow a scheme (e.g. Istio) |
| secret.enabled | bool | `true` | switch to false to prevent creating the secret |
| secret.nameOverride | string | `""` | Provide custom name of existing secret, or custom name of secret to be created |
| secret.secretAnnotations | object | `{"helm.sh/hook":"pre-install, pre-upgrade","helm.sh/hook-delete-policy":"before-hook-creation","helm.sh/hook-weight":"0","helm.sh/resource-policy":"keep"}` | Annotations to be added to secret. Annotations are added only when secret is being created. Existing secret will not be modified. |
| secret.hashSumEnabled | bool | `true` | switch to false to prevent checksum annotations being maintained and propogated to the pods |
| ingress.enabled | bool | `false` |  |
| ingress.className | string | `""` |  |
| ingress.annotations | object | `{}` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| securityContext.readOnlyRootFilesystem | bool | `false` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `10000` |  |
| securityContext.runAsGroup | int | `10000` |  |
| securityContext.allowPrivilegeEscalation | bool | `false` |  |
| securityContext.privileged | bool | `false` |  |
| securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| securityContext.seLinuxOptions.level | string | `"s0:c123,c456"` |  |
| podSecurityContext.fsGroupChangePolicy | string | `"OnRootMismatch"` |  |
| podSecurityContext.runAsNonRoot | bool | `true` |  |
| podSecurityContext.runAsUser | int | `10000` |  |
| podSecurityContext.fsGroup | int | `10000` |  |
| podSecurityContext.runAsGroup | int | `10000` |  |
| podSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| deployment.resources | object | `{}` |  |
| deployment.extraEnv | list | `[]` | Array of extra envs to be passed to the deployment. Kubernetes format is expected - name: FOO   value: BAR |
| deployment.extraVolumes | list | `[]` | If you want to mount external volume For example, mount a secret containing Certificate root CA to verify database TLS connection. |
| deployment.extraVolumeMounts | list | `[]` |  |
| deployment.nodeSelector | object | `{}` | Node labels for pod assignment. |
| deployment.tolerations | list | `[]` | Configure node tolerations. |
| deployment.topologySpreadConstraints | list | `[]` | Configure pod topologySpreadConstraints. |
| deployment.dnsConfig | object | `{}` | Configure pod dnsConfig. |
| deployment.labels | object | `{}` |  |
| deployment.annotations | object | `{}` |  |
| deployment.automountServiceAccountToken | bool | `false` |  |
| deployment.terminationGracePeriodSeconds | int | `60` |  |
| affinity | object | `{}` |  |
| kratosPublicUrl | string | `"http://kratos:4433"` | Set this to ORY Kratos's public URL |
| hydraAdminUrl | string | `"http://hydra:4445"` | Set this to ORY Hydra's Admin URL |
| hydraPublicUrl | string | `"http://hydra:4444"` | Set this to ORY Hydra's public URL |
| basePath | string | `""` | The basePath |
| jwksUrl | string | `"http://hydra:4445/admin/keys/hydra.jwt.access-token"` | The jwksUrl |
| projectName | string | `"SecureApp"` |  |
| test.busybox | object | `{"repository":"busybox","tag":1}` | use a busybox image from another repository |
| customLivenessProbe | object | `{}` | Custom livenessProbe that overrides the default one |
| livenessProbe.enabled | bool | `true` | Enable livenessProbe |
| livenessProbe.initialDelaySeconds | int | `3` | Initial delay seconds for livenessProbe |
| livenessProbe.periodSeconds | int | `300` | Period seconds for livenessProbe |
| livenessProbe.timeoutSeconds | int | `10` | Timeout seconds for livenessProbe |
| livenessProbe.successThreshold | int | `1` | Success threshold for livenessProbe |
| livenessProbe.failureThreshold | int | `3` | Failure threshold for livenessProbe |
| customReadinessProbe | object | `{}` | Custom readinessProbe that overrides the default one |
| readinessProbe.enabled | bool | `true` | Enable readinessProbe |
| readinessProbe.initialDelaySeconds | int | `5` | Initial delay seconds for readinessProbe |
| readinessProbe.periodSeconds | int | `10` | Period seconds for readinessProbe |
| readinessProbe.timeoutSeconds | int | `10` | Timeout seconds for readinessProbe |
| readinessProbe.successThreshold | int | `1` | Success threshold for readinessProbe |
| readinessProbe.failureThreshold | int | `3` | Failure threshold for readinessProbe |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.8.1](https://github.com/norwoodj/helm-docs/releases/v1.8.1)
