

# radar-kafka
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-kafka)](https://artifacthub.io/packages/helm/radar-base/radar-kafka)

![Version: 0.4.2](https://img.shields.io/badge/Version-0.4.2-informational?style=flat-square) ![AppVersion: 3.9.0](https://img.shields.io/badge/AppVersion-3.9.0-informational?style=flat-square)

Apache Kafka for RADAR-base using the Strimzi Operator

**Homepage:** <https://radar-base.org>

# Kafka and Schema registry operators

This chart deploys a Kafka cluster through the Strimzi Kafka operator that is a dependency to this chart. Configuration for the Strimzi operator chart is passed via the `strimzi-kafka-operator` key in the `values.yaml` file.
Consult the [documentation](https://strimzi.io/documentation/) of the Strimzi Kafka operator for more information on how to configure this service.

In addition, this chart deploys a Confluent Schema Registry connected to the Kafka cluster through the Strimzi Registry operator that is a dependency to this chart. Configuration for this chart is passed via the `strimzi-registry-operator` key in the `values.yaml` file.
Consult the [documentation](https://github.com/lsst-sqre/strimzi-registry-operator) of the Stimzi Registry operator for more information on how to configure this service.

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts>

## Prerequisites
* Kubernetes 1.28+
* Kubectl 1.28+
* Helm 3.1.0+
* When `gatewayAPI.enabled=true`: the Gateway API CRDs and a Gateway Controller (e.g. NGINX Gateway Fabric) must already be installed in the cluster, and the shared parent Gateway `radar-base-k8s-gateway` must exist — it can be created via the [gateway-api](https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/gateway-api) chart

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../external/strimzi-kafka-operator | strimzi-kafka-operator | 0.46.0 |
| file://../../external/strimzi-registry-operator | strimzi-registry-operator | 2.1.0 |
| https://radar-base.github.io/radar-helm-charts | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| server_name | string | `"localhost"` | domain name of the server |
| disable_tls | bool | `false` |  |
| dev_deployment | bool | `false` | Deploy with minimal replicas, replicationFactor and without PVCs (a.k.a ephemeral mode) |
| nameOverride | string | `""` | String to partially override radar-kafka.fullname template with a string (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override radar-kafka.fullname template with a string |
| metrics | object | `{"enabled":true,"kafkaExporter":{"enableSaramaLogging":true,"groupRegex":".*","resources":{},"topicRegex":".*"},"podMonitor":{"interval":"30s","scrapeTimeout":"30s"},"prometheusRules":{"consumerGroupLagDelta":20000}}` | Enable metrics to be collected via Prometheus-operator |
| metrics.enabled | bool | `true` | Enable monitoring of metrics |
| metrics.kafkaExporter | object | `{"enableSaramaLogging":true,"groupRegex":".*","resources":{},"topicRegex":".*"}` | Values for Prometheus JMX Exporter attached to Kafka pods ref: https://strimzi.io/docs/operators/latest/deploying#proc-metrics-kafka-deploy-options-str |
| metrics.kafkaExporter.groupRegex | string | `".*"` | Regex that selects consumer groups for KafkaExporter errors/warnings. |
| metrics.podMonitor | object | `{"interval":"30s","scrapeTimeout":"30s"}` | Prometheus scrap config for Kafka pods. These settings do not affect scrape of Strimzi operators. |
| metrics.prometheusRules | object | `{"consumerGroupLagDelta":20000}` | Custom parameters to selected prometheus rules |
| metrics.prometheusRules.consumerGroupLagDelta | int | `20000` | Threshold of backpressure (number of messages not handled by consumer group) warning for consumer groups. |
| strimzi-kafka-operator | object | check `values.yaml` | Values for kafka operator ref: https://strimzi.io/docs/operators/latest/deploying#assembly-operators-str |
| strimzi-registry-operator | object | `{"clusterName":"radar","operatorNamespace":"default"}` | Values for schema registry operator ref: https://github.com/lsst-sqre/strimzi-registry-operator |
| strimzi-registry-operator.clusterName | string | `"radar"` | Keep in sync with 'fullnameOverride' |
| strimzi-registry-operator.operatorNamespace | string | `"default"` | Keep in sync with namespace used by deployment |
| kafka | object | `{"cruiseControl":{"addRebalanceTemplate":true,"enabled":false,"goals":[],"javaOptions":{"-Xms":"128m","-Xmx":"256m"},"resources":{},"skipHardGoalCheck":true},"insyncReplicas":2,"javaOptions":{"-Xms":"512m","-Xmx":"1G"},"metadataVersion":"3.9-IV0","nodePool":{"jvmOptions":{"-Xms":"512m","-Xmx":"1G"},"resources":{}},"partitions":9,"podSecurityContext":{},"replicas":3,"replicationFactor":3,"resources":{"requests":{}},"securityContext":{},"storage":{"size":"10Gi"},"topicOperator":{"jvmOptions":{"-Xms":"64m","-Xmx":"128m"},"resources":{}},"userOperator":{"jvmOptions":{"-Xms":"64m","-Xmx":"128m"},"resources":{}}}` | Values for Kafka cluster deployed by Strimzi kafka operator |
| kafka.replicas | int | `3` | Number of Kafka brokers |
| kafka.replicationFactor | int | `3` | Number of replicas for Kafka topics |
| kafka.insyncReplicas | int | `2` | Number of in-sync kafka broker replicas |
| kafka.partitions | int | `9` | Number of topic data partitions. Rule of thumb: 3 times the number of brokers. Headroom is used for future upscale of brokers. ref: https://learn.conduktor.io/kafka/kafka-topics-choosing-the-replication-factor-and-partitions-count/ |
| kafka.metadataVersion | string | `"3.9-IV0"` | Metadata API version. Keep in sync with appVersion |
| kafka.storage | object | `{"size":"10Gi"}` | Storage size for Kafka pods |
| kafka.javaOptions | object | `{"-Xms":"512m","-Xmx":"1G"}` | JVM options for Kafka pods |
| kafka.cruiseControl | object | `{"addRebalanceTemplate":true,"enabled":false,"goals":[],"javaOptions":{"-Xms":"128m","-Xmx":"256m"},"resources":{},"skipHardGoalCheck":true}` | Config for the Cruise Control rebalancer (https://github.com/linkedin/cruise-control) |
| kafka.cruiseControl.enabled | bool | `false` | Deploy the Cruise Control rebalancer operator. |
| kafka.cruiseControl.addRebalanceTemplate | bool | `true` | Add a KafkaRebalance template CRD. Note that this does not automatically rebalance the cluster. For rebalancing, you need to create a KafkaRebalance resource using the template. |
| kafka.cruiseControl.goals | list | `[]` | Goals for the Cruise Control rebalancer. If left empty, the default goals are used (see: https://github.com/linkedin/cruise-control#goals). |
| kafka.cruiseControl.skipHardGoalCheck | bool | `true` | Skip hard goal check by Cruise Control rebalancer. |
| kafka.cruiseControl.javaOptions | object | `{"-Xms":"128m","-Xmx":"256m"}` | JVM options for Cruise Control pods |
| kafka.podSecurityContext | object | `{}` | Security Context for Kafka pods ref: https://strimzi.io/docs/operators/latest/deploying#assembly-security-providers-str |
| kafka.securityContext | object | `{}` | Security Context for Kafka containers ref: https://strimzi.io/docs/operators/latest/deploying#assembly-security-providers-str |
| gatewayAPI | object | `{"annotations":{},"backendRef":{"port":8081},"enabled":false,"filters":[{"type":"URLRewrite","urlRewrite":{"path":{"replacePrefixMatch":"/","type":"ReplacePrefixMatch"}}}],"hostnames":["{{ .Values.server_name }}"],"https":{"port":443,"sectionName":""},"httpsRedirect":{"enabled":true,"port":80,"sectionName":"","statusCode":301},"method":"GET","parentRef":{"name":"radar-base-k8s-gateway","namespace":""},"path":"/schema","pathType":"PathPrefix"}` | Gateway API HTTPRoute for the schema registry (alternative to schema-registry.ingress). Opt-in: requires the Gateway API CRDs and a Gateway controller to be installed. |
| gatewayAPI.enabled | bool | `false` | Enable Gateway API HTTPRoute resource for the schema registry |
| gatewayAPI.annotations | object | `{}` | Annotations to add to the HTTPRoute |
| gatewayAPI.parentRef | object | `{"name":"radar-base-k8s-gateway","namespace":""}` | Parent Gateway that the HTTPRoute attaches to. The Gateway itself is a shared resource and must be created separately (not by this chart). |
| gatewayAPI.parentRef.name | string | `"radar-base-k8s-gateway"` | Name of the Gateway |
| gatewayAPI.parentRef.namespace | string | `""` | Namespace of the Gateway (defaults to the release namespace when empty) |
| gatewayAPI.hostnames | list | `["{{ .Values.server_name }}"]` | Hostnames the HTTPRoutes accept requests for (must intersect the Gateway listener hostnames). String values support Helm templating (tpl); defaults to server_name so deployments override it the same way as schema-registry.ingress.hosts. |
| gatewayAPI.https | object | `{"port":443,"sectionName":""}` | HTTPS listener on the Gateway that the main route attaches to |
| gatewayAPI.https.port | int | `443` | Listener port (empty attaches to all matching listeners) |
| gatewayAPI.https.sectionName | string | `""` | Listener sectionName on the Gateway (optional) |
| gatewayAPI.pathType | string | `"PathPrefix"` | Path match type (PathPrefix, Exact or RegularExpression) |
| gatewayAPI.path | string | `"/schema"` | Path to match within the URL structure |
| gatewayAPI.method | string | `"GET"` | HTTP method the route is restricted to (empty matches all methods). Equivalent to the ingress configuration-snippet `limit_except GET { deny all; }`. |
| gatewayAPI.filters | list | check values.yaml | Additional HTTPRoute filters (e.g. URLRewrite, RequestHeaderModifier). Equivalent to the ingress annotation: strips the /schema prefix (nginx.ingress.kubernetes.io/rewrite-target: /$1). |
| gatewayAPI.backendRef | object | `{"port":8081}` | Backend Service reference for the schema registry Service created by strimzi-registry-operator (the named "schema-registry" port on that Service). |
| gatewayAPI.backendRef.port | int | `8081` | Port number of the schema registry Service (Confluent Schema Registry REST API default) |
| gatewayAPI.httpsRedirect | object | `{"enabled":true,"port":80,"sectionName":"","statusCode":301}` | HTTP->HTTPS redirect route (equivalent to nginx force-TLS behaviour) |
| gatewayAPI.httpsRedirect.enabled | bool | `true` | Enable a second HTTPRoute that 301-redirects HTTP traffic to HTTPS |
| gatewayAPI.httpsRedirect.port | int | `80` | HTTP listener port on the Gateway to attach the redirect to |
| gatewayAPI.httpsRedirect.sectionName | string | `""` | Listener sectionName on the Gateway (optional) |
| gatewayAPI.httpsRedirect.statusCode | int | `301` | Redirect HTTP status code |
| schema-registry | object | check `values.yaml` | Values for schema registry deployed by strimzi-registry-operator ref: https://github.com/lsst-sqre/strimzi-registry-operator |
