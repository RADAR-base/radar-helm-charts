

# s3-proxy
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/s3-proxy)](https://artifacthub.io/packages/helm/radar-base/s3-proxy)

![Version: 0.5.2](https://img.shields.io/badge/Version-0.5.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.3.0](https://img.shields.io/badge/AppVersion-2.3.0-informational?style=flat-square)

A Helm chart for S3 Proxy. It uses https://hub.docker.com/r/andrewgaul/s3proxy to proxy S3 API requests to any supported cloud provider. For more examples see Find some example configurations at https://github.com/gaul/s3proxy/wiki/Storage-backend-examples.

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

## Source Code

* <https://github.com/gaul/s3proxy>

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
| replicaCount | int | `1` | Number of s3-proxy replicas to deploy |
| image.registry | string | `"docker.io"` | Image registry |
| image.repository | string | `"andrewgaul/s3proxy"` | Image repository |
| image.tag | string | `"sha-85b0f98"` | Image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| image.digest | string | `""` | Image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.pullSecrets | list | `[]` | Optionally specify an array of imagePullSecrets. Secrets must be manually created in the namespace. e.g: pullSecrets:   - myRegistryKeySecretName  |
| nameOverride | string | `""` | String to partially override s3-proxy.fullname template with a string (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override s3-proxy.fullname template with a string |
| podSecurityContext | object | `{}` | Configure s3-proxy pods' Security Context |
| securityContext | object | `{}` | Configure s3-proxy containers' Security Context |
| service.type | string | `"ClusterIP"` | Kubernetes Service type |
| service.port | int | `80` | s3-proxy port |
| resources.requests | object | `{"cpu":"100m","memory":"128Mi"}` | CPU/Memory resource requests |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| tolerations | list | `[]` | Toleration labels for pod assignment |
| affinity | object | `{}` | Affinity labels for pod assignment |
| extraEnvVars | list | `[]` | Extra environment variables |
| customLivenessProbe | object | `{}` | Custom livenessProbe that overrides the default one |
| livenessProbe.enabled | bool | `true` | Enable livenessProbe |
| livenessProbe.initialDelaySeconds | int | `15` | Initial delay seconds for livenessProbe |
| livenessProbe.periodSeconds | int | `60` | Period seconds for livenessProbe |
| livenessProbe.timeoutSeconds | int | `3` | Timeout seconds for livenessProbe |
| livenessProbe.successThreshold | int | `1` | Success threshold for livenessProbe |
| livenessProbe.failureThreshold | int | `3` | Failure threshold for livenessProbe |
| customReadinessProbe | object | `{}` | Custom readinessProbe that overrides the default one |
| readinessProbe.enabled | bool | `true` | Enable readinessProbe |
| readinessProbe.initialDelaySeconds | int | `15` | Initial delay seconds for readinessProbe |
| readinessProbe.periodSeconds | int | `60` | Period seconds for readinessProbe |
| readinessProbe.timeoutSeconds | int | `3` | Timeout seconds for readinessProbe |
| readinessProbe.successThreshold | int | `1` | Success threshold for readinessProbe |
| readinessProbe.failureThreshold | int | `3` | Failure threshold for readinessProbe |
| networkpolicy | object | check `values.yaml` | Network policy defines who can access this application and who this applications has access to |
| s3.identity | string | `nil` | Credentials used to access this proxy |
| s3.credential | string | `""` | Credentials used to access this proxy |
| target | object | Check below | Where requests should be proxied to |
| target.provider | string | `nil` | Target provider |
| target.endpoint | string | `nil` | Target endpoint |
| target.identity | string | `nil` | Target identity |
| target.credential | string | `""` | Target credential |
| target.api | string | `nil` | Target Swift / Keystone API |
| target.region | string | `nil` | Singular region |
| target.regions | string | `nil` | Multiple regions (keystone) |
| target.filesystem.basedir | string | `"/data"` | Base directory for filesystem provider |
| target.azureblob.auth | string | `"azureKey"` | Authentication method for Azure |
| target.keystone.version | string | `nil` | Keystone (Swift) version |
| target.keystone.credentialType | string | `nil` | Keystone (Swift) credential type |
| target.keystone.scope | string | `nil` | Keystone (Swift) scope |
| target.keystone.projectDomainName | string | `nil` | Keystone (Swift) project domain name |
