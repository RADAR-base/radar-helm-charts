

# cc-schema-registry-proxy
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/cc-schema-registry-proxy)](https://artifacthub.io/packages/helm/radar-base/cc-schema-registry-proxy)

![Version: 0.4.3](https://img.shields.io/badge/Version-0.4.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0](https://img.shields.io/badge/AppVersion-1.0-informational?style=flat-square)

A Helm chart for Confluent Cloud schema registry proxy. This proxy service is used when RADAR-base platform is used with Confluent Cloud based schema registry. It forwards requests to schema registry with an additional basic authentication header with Confluent Cloud schema registry credentials. This service will be enabled if `cc.enabled = true`.

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/cc-schema-registry-proxy>

## Prerequisites
* Kubernetes 1.28+
* Kubectl 1.28+
* Helm 3.1.0+
* When `gatewayAPI.enabled=true`: the Gateway API CRDs and a Gateway Controller (e.g. NGINX Gateway Fabric) must already be installed in the cluster, and the shared parent Gateway `radar-base-k8s-gateway` must exist — it can be created via the [gateway-api](https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/gateway-api) chart

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://radar-base.github.io/radar-helm-charts | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `1` | Number of cc-schema-registry-proxy replicas to deploy |
| service.type | string | `"ExternalName"` | Kubernetes Service type, |
| service.externalName | string | `"schema-registry-domain"` | Domain name used for pointing to actual schema registry instance |
| service.port | int | `443` | Port number to connect to Confluent platform |
| disable_tls | bool | `false` | Reconfigure Ingress to not force TLS |
| ingress.enabled | bool | `true` | Enable ingress controller resource |
| ingress.annotations | object | check values.yaml | Annotations that define default ingress class, certificate issuer |
| ingress.path | string | `"/schema/?(.*)"` | Path within the url structure |
| ingress.pathType | string | `"ImplementationSpecific"` | Ingress Path type |
| ingress.ingressClassName | string | `"nginx"` | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+) |
| ingress.hosts | list | `["localhost"]` | Hosts to accept requests from |
| ingress.tls.secretName | string | `"radar-base-tls"` | TLS Secret Name |
| gatewayAPI.enabled | bool | `false` | Enable Gateway API HTTPRoute resource (alternative to ingress). Opt-in: requires the Gateway API CRDs and a Gateway controller to be installed. |
| gatewayAPI.annotations | object | `{}` | Annotations to add to the HTTPRoute |
| gatewayAPI.parentRef | object | `{"name":"radar-base-k8s-gateway","namespace":""}` | Parent Gateway that the HTTPRoute attaches to. The Gateway itself is a shared resource and must be created separately (not by this chart). |
| gatewayAPI.parentRef.name | string | `"radar-base-k8s-gateway"` | Name of the Gateway |
| gatewayAPI.parentRef.namespace | string | `""` | Namespace of the Gateway (defaults to the release namespace when empty) |
| gatewayAPI.hostnames | list | `["{{ .Values.serverName }}"]` | Hostnames the HTTPRoutes accept requests for (must intersect the Gateway listener hostnames). String values support Helm templating (tpl); defaults to serverName so deployments override it the same way as ingress.hosts. |
| gatewayAPI.https | object | `{"port":443,"sectionName":""}` | HTTPS listener on the Gateway that the main route attaches to |
| gatewayAPI.https.port | int | `443` | Listener port (empty attaches to all matching listeners) |
| gatewayAPI.https.sectionName | string | `""` | Listener sectionName on the Gateway (optional) |
| gatewayAPI.pathType | string | `"PathPrefix"` | Path match type (PathPrefix, Exact or RegularExpression) |
| gatewayAPI.path | string | `"/schema"` | Path to match within the URL structure |
| gatewayAPI.method | string | `"GET"` | HTTP method the route is restricted to (empty matches all methods) |
| gatewayAPI.filters | list | check values.yaml | Additional HTTPRoute filters (e.g. URLRewrite, RequestHeaderModifier) Equivalent to the ingress annotations: strips the /schema prefix (nginx.ingress.kubernetes.io/rewrite-target: /$1), sets the upstream Host header (upstream-vhost) and injects the Confluent Cloud basic-auth header (configuration-snippet). NOTE: like the ingress annotation, the credentials end up in the rendered resource. |
| gatewayAPI.backendTLS | object | `{"caCertificateRefs":[],"enabled":true,"hostname":"{{ .Values.service.externalName }}","wellKnownCACertificates":"System"}` | TLS from the gateway to the Confluent Cloud schema registry (equivalent to nginx.ingress.kubernetes.io/backend-protocol: https). Creates a BackendTLSPolicy targeting the Service. |
| gatewayAPI.backendTLS.enabled | bool | `true` | Create the BackendTLSPolicy |
| gatewayAPI.backendTLS.hostname | string | `"{{ .Values.service.externalName }}"` | SNI/certificate hostname to validate (defaults to the external schema registry domain) |
| gatewayAPI.backendTLS.wellKnownCACertificates | string | `"System"` | Well-known CA bundle used to validate the backend (System); ignored when caCertificateRefs is set |
| gatewayAPI.backendTLS.caCertificateRefs | list | `[]` | Custom CA ConfigMap references used to validate the backend (takes precedence over wellKnownCACertificates) |
| gatewayAPI.httpsRedirect | object | `{"enabled":true,"port":80,"sectionName":"","statusCode":301}` | HTTP->HTTPS redirect route (equivalent to nginx force-TLS behaviour) |
| gatewayAPI.httpsRedirect.enabled | bool | `true` | Enable a second HTTPRoute that 301-redirects HTTP traffic to HTTPS |
| gatewayAPI.httpsRedirect.port | int | `80` | HTTP listener port on the Gateway to attach the redirect to |
| gatewayAPI.httpsRedirect.sectionName | string | `""` | Listener sectionName on the Gateway (optional) |
| gatewayAPI.httpsRedirect.statusCode | int | `301` | Redirect HTTP status code |
| cc.schemaRegistryApiKey | string | `"srApiKey"` | Confluent cloud schema registry API key |
| cc.schemaRegistryApiSecret | string | `"srApiSecret"` | Confluent cloud schema registry API secret |
| serverName | string | `"localhost"` |  |
