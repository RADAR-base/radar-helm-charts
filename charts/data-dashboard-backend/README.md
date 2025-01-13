

# data-dashboard-backend

![Version: 0.4.0](https://img.shields.io/badge/Version-0.4.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.2.2](https://img.shields.io/badge/AppVersion-0.2.2-informational?style=flat-square)

API for data in the data dashboard

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Keyvan Hedayati | <keyvan@thehyve.nl> | <https://www.thehyve.nl> |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

## Source Code

* <https://github.com/thehyve/radar-data-dashboard-backend>

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
| replicaCount | int | `1` | Number of replicas to deploy |
| image.registry | string | `"docker.io"` | Image registry |
| image.repository | string | `"radarbase/radar-data-dashboard-backend"` | Image repository |
| image.tag | string | `nil` | Image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| image.digest | string | `""` | Image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.pullSecrets | list | `[]` | Optionally specify an array of imagePullSecrets. Secrets must be manually created in the namespace. e.g: pullSecrets:   - myRegistryKeySecretName |
| nameOverride | string | `""` | String to partially override fullname template with a string (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override fullname template with a string |
| podSecurityContext | object | `{}` | Configure pod's Security Context |
| securityContext | object | `{}` | Configure container's Security Context |
| service.type | string | `"ClusterIP"` | Kubernetes Service type |
| service.port | int | `9000` | data-dashboard-backend port |
| disable_tls | bool | `false` | Reconfigure Ingress to not force TLS |
| ingress.enabled | bool | `true` | Enable ingress controller resource |
| ingress.ingressClassName | string | `"nginx"` | Ingress class name |
| ingress.annotations | object | check values.yaml | Annotations that define default ingress class, certificate issuer |
| ingress.path | string | `"/dashboard-data"` | Path within the url structure |
| ingress.pathType | string | `"ImplementationSpecific"` |  |
| ingress.hosts | list | `["localhost"]` | Hosts to accept requests from |
| ingress.tls.secretName | string | `"radar-base-tls"` |  |
| resources | object | `{}` |  |
| autoscaling.enabled | bool | `false` | Enable horizontal autoscaling |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| networkpolicy | object | check `values.yaml` | Network policy defines who can access this application and who this applications has access to |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| tolerations | list | `[]` | Toleration labels for pod assignment |
| affinity | object | `{}` | Affinity labels for pod assignment |
| existingSecret | string | `""` |  |
| javaOpts | string | `"-Xmx550m"` | Standard JAVA_OPTS that should be passed to this service |
| managementPortal.url | string | `"http://management-portal:8080/managementportal"` | ManagementPortal URL |
| managementPortal.clientId | string | `"radar_data_dashboard_backend"` | ManagementPortal OAuth 2.0 client ID, having grant type client_credentials |
| managementPortal.clientSecret | string | `"secret"` | ManagementPortal OAuth 2.0 client secret |
| jwtResourceName | string | `"res_DataDashboardAPI"` | JWT Resource name to use for this service in ManagementPortal |
| jdbc.driver | string | `"org.postgresql.Driver"` | JDBC Driver to connect to the database. |
| jdbc.url | string | `"jdbc:postgresql://postgresql:5432/data-dashboard"` | JDBC Connection url of the database. |
| jdbc.user | string | `"postgres"` | Username of the database |
| jdbc.password | string | `"secret"` | Password of the user |
| jdbc.dialect | string | `"org.hibernate.dialect.PostgreSQLDialect"` | Hibernate dialect to use for JDBC Connection |
| jdbc.properties."hibernate.globally_quoted_identifiers" | bool | `true` | Must be _true_ for compatibility with table created by jdbc-connector |
| jdbc.properties."hibernate.physical_naming_strategy" | string | `"org.radarbase.datadashboard.api.domain.model.CamelCaseToUppercaseColumnNamingStrategy"` | Must be _CamelCaseToUppercaseColumnNamingStrategy_ for compatibility with table created by jdbc-connector |
