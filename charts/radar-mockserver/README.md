

# radar-mockserver
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-mockserver)](https://artifacthub.io/packages/helm/radar-base/radar-mockserver)

![Version: 0.1.3](https://img.shields.io/badge/Version-0.1.3-informational?style=flat-square) ![AppVersion: 5.15.0](https://img.shields.io/badge/AppVersion-5.15.0-informational?style=flat-square)

Chart to deploy MockServer to Kubernetes. MockServer enables easy mocking of any system you integrate with via HTTP or HTTPS with clients written in Java, JavaScript and Ruby.  MockServer also includes a proxy that introspects all proxied traffic including encrypted SSL traffic and supports Port Forwarding, Web Proxying (i.e. HTTP proxy), HTTPS Tunneling Proxying (using HTTP CONNECT) and SOCKS Proxying (i.e. dynamic port forwarding).

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

## Prerequisites
* Kubernetes 1.28+
* Kubectl 1.28+
* Helm 3.1.0+

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../external/mockserver | mockserver | 5.15.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| expectations | list | `[]` |  |
| mockserver.replicaCount | int | `1` |  |
| mockserver.releasenameOverride | string | `""` |  |
| mockserver.app.logLevel | string | `"INFO"` |  |
| mockserver.app.serverPort | string | `"1080"` |  |
| mockserver.app.mountedConfigMapName | string | `"mockserver-config"` |  |
| mockserver.app.mountedLibsConfigMapName | string | `"mockserver-config"` |  |
| mockserver.app.propertiesFileName | string | `"mockserver.properties"` |  |
| mockserver.app.readOnlyRootFilesystem | bool | `false` |  |
| mockserver.app.serviceAccountName | string | `"default"` |  |
| mockserver.app.runAsUser | int | `65534` |  |
| mockserver.image.repository | string | `"mockserver"` |  |
| mockserver.image.snapshot | bool | `false` |  |
| mockserver.image.pullPolicy | string | `"IfNotPresent"` |  |
| mockserver.service.annotations | object | `{}` |  |
| mockserver.service.clusterIP | string | `""` |  |
| mockserver.service.externalIPs | list | `[]` |  |
| mockserver.service.loadBalancerIP | string | `""` |  |
| mockserver.service.loadBalancerSourceRanges | list | `[]` |  |
| mockserver.service.type | string | `"NodePort"` |  |
| mockserver.service.port | int | `1080` |  |
| mockserver.service.nodePort | string | `""` |  |
| mockserver.service.test.image | string | `"radial/busyboxplus:curl"` |  |
| mockserver.ingress.enabled | bool | `false` |  |
| mockserver.ingress.className | string | `""` |  |
| mockserver.ingress.annotations | object | `{}` |  |
| mockserver.ingress.hosts[0].host | string | `"mockserver.local"` |  |
| mockserver.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| mockserver.ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| mockserver.ingress.tls | list | `[]` |  |
| mockserver.podAnnotations | object | `{}` |  |
| mockserver.resources | object | `{}` |  |
| mockserver.nodeSelector | object | `{}` |  |
| mockserver.tolerations | list | `[]` |  |
| mockserver.affinity | object | `{}` |  |
