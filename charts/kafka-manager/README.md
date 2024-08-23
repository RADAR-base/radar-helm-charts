

# Kafka Manager Helm Chart

[Kafka Manager](https://github.com/yahoo/kafka-manager) is a tool for managing [Apache Kafka](http://kafka.apache.org/).

## TL;DR;

```bash
$ helm install stable/kafka-manager
```

## Prerequisites

- Kubernetes 1.9+ with Beta APIs enabled

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm install --name my-release stable/kafka-manager
```

The command deploys Kafka Manager on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```bash
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the Kafka Manager chart and their default values.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| clusters | string | `nil` |  |
| applicationSecret | string | `""` |  |
| basicAuth.enabled | bool | `false` |  |
| basicAuth.username | string | `"admin"` |  |
| basicAuth.password | string | `""` |  |
| javaOptions | string | `""` |  |
| service.type | string | `"ClusterIP"` |  |
| service.port | int | `9000` |  |
| service.annotations | object | `{}` |  |
| resources.requests.cpu | string | `"100m"` |  |
| resources.requests.memory | string | `"400Mi"` |  |
| nodeSelector | object | `{}` |  |
| tolerations | list | `[]` |  |
| affinity | object | `{}` |  |
| zookeeper | object | `{"enabled":false,"env":{"ZK_HEAP_SIZE":"1G"},"persistence":{"enabled":false}}` | ---------------------------------------------------------------------------- |
| zkHosts | string | `"cp-zookeeper:2181"` |  |
| image.repository | string | `"radarbase/kafka-manager"` |  |
| image.tag | string | `nil` | Overrides the image tag whose default is the chart appVersion. |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| imagePullSecrets | list | `[]` | Docker registry secret names as an array |
| disable_tls | bool | `false` | Disable TLS (reconfigures Ingress and sets URLs to use HTTP) |
| ingress.enabled | bool | `true` | Enable ingress controller resource |
| ingress.annotations | object | check values.yaml | Annotations that define default ingress class, certificate issuer |
| ingress.path | string | `"/kafkamanager/"` | Path within the url structure |
| ingress.pathType | string | `"ImplementationSpecific"` |  |
| ingress.hosts | list | `["localhost"]` | Hosts to accept requests from |
| ingress.tls.secretName | string | `"radar-base-tls"` | TLS Secret Name |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
$ helm install stable/kafka-manager --name my-release \
    --set ingress.enabled=true
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
$ helm install stable/kafka-manager --name my-release -f values.yaml
```

> **Tip**: You can use the default [values.yaml](values.yaml)
