

# radar-output

![Version: 0.3.0](https://img.shields.io/badge/Version-0.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.2.0](https://img.shields.io/badge/AppVersion-2.2.0-informational?style=flat-square)

A Helm chart for RADAR-base output restructure service. This application reads data from intermediate storage and restructure the data into project-> subject-id-> data topic -> data split per hour. This service offers few options to choose the source and target of the pipeline.

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Keyvan Hedayati | <keyvan@thehyve.nl> | <https://www.thehyve.nl> |
| Joris Borgdorff | <joris@thehyve.nl> | <https://www.thehyve.nl/experts/joris-borgdorff> |
| Nivethika Mahasivam | <nivethika@thehyve.nl> | <https://www.thehyve.nl/experts/nivethika-mahasivam> |

## Source Code

* <https://github.com/RADAR-base/radar-output-restructure>

## Prerequisites
* Kubernetes 1.17+
* Kubectl 1.17+
* Helm 3.1.0+

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `1` | Number of radar-output replicas to deploy |
| image.repository | string | `"radarbase/radar-output-restructure"` | radar-output image repository |
| image.tag | string | `"2.2.0"` | radar-output image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| image.pullPolicy | string | `"IfNotPresent"` | radar-output image pull policy |
| imagePullSecrets | list | `[]` | Docker registry secret names as an array |
| nameOverride | string | `""` | String to partially override radar-output.fullname template with a string (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override radar-output.fullname template with a string |
| podSecurityContext | object | `{}` | Configure radar-output pods' Security Context |
| securityContext | object | `{}` | Configure radar-output containers' Security Context |
| resources.limits | object | `{"cpu":"1000m"}` | CPU/Memory resource limits |
| resources.requests | object | `{"cpu":"100m","memory":"2Gi"}` | CPU/Memory resource requests |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| tolerations | list | `[]` | Toleration labels for pod assignment |
| affinity | object | `{}` | Affinity labels for pod assignment |
| javaOpts | string | `"-Xms400m -Xmx3g"` |  |
| source.type | string | `"s3"` | Type of the intermediate storage of the RADAR-base pipeline e.g. s3, hdfs |
| source.s3.endpoint | string | `"http://minio:9000"` | s3 endpoint of the intermediate storage |
| source.s3.accessToken | string | `"access_key"` | s3 access-key of the intermediate storage |
| source.s3.secretKey | string | `"secret"` | s3 secret-key of the intermediate storage |
| source.s3.bucket | string | `"radar-intermediate-storage"` | s3 bucket name of the intermediate storage |
| source.s3.connectTimeout | string | `nil` | s3 HTTP connect timeout in seconds |
| source.s3.writeTimeout | string | `nil` | s3 HTTP write timeout in seconds |
| source.s3.readTimeout | string | `nil` | s3 HTTP read timeout in seconds |
| source.azure.endpoint | string | `""` | Azure endpoint of the intermediate storage |
| source.azure.username | string | `""` | Azure username to access the s3 endpoint when using personal login |
| source.azure.password | string | `""` | Azure password when using personal login |
| source.azure.accountName | string | `""` | Azure account name when using shared access tokens |
| source.azure.accountKey | string | `""` | Azure account key when using shared access tokens |
| source.azure.sasToken | string | `""` | Azure SAS(shared access signature) token when using shared access tokens |
| source.azure.container | string | `""` | Azure blob container name |
| source.azure.connectTimeout | string | `nil` | Azure HTTP connect timeout in seconds |
| source.azure.responseTimeout | string | `nil` | Azure HTTP response timeout in seconds |
| source.azure.writeTimeout | string | `nil` | Azure HTTP write timeout in seconds |
| source.azure.readTimeout | string | `nil` | Azure HTTP read timeout in seconds |
| target.type | string | `"s3"` | Type of the output storage of the RADAR-base pipeline e.g. s3, local |
| target.s3.endpoint | string | `"http://minio:9000"` | s3 endpoint of the output storage |
| target.s3.accessToken | string | `"access_key"` | s3 access-key of the output storage |
| target.s3.secretKey | string | `"secret"` | s3 secret-key of the output storage |
| target.s3.bucket | string | `"radar-output-storage"` | s3 bucket name of the output storage |
| target.s3.connectTimeout | string | `nil` | s3 HTTP connect timeout in seconds |
| target.s3.writeTimeout | string | `nil` | s3 HTTP write timeout in seconds |
| target.s3.readTimeout | string | `nil` | s3 HTTP read timeout in seconds |
| target.azure.endpoint | string | `""` | Azure endpoint of the output storage |
| target.azure.username | string | `""` | Azure username to access the s3 endpoint when using personal login |
| target.azure.password | string | `""` | Azure password when using personal login |
| target.azure.accountName | string | `""` | Azure account name when using shared access tokens |
| target.azure.accountKey | string | `""` | Azure account key when using shared access tokens |
| target.azure.sasToken | string | `""` | Azure SAS(shared access signature) token when using shared access tokens |
| target.azure.container | string | `""` | Azure blob container name |
| target.azure.connectTimeout | string | `nil` | Azure HTTP connect timeout in seconds |
| target.azure.responseTimeout | string | `nil` | Azure HTTP response timeout in seconds |
| target.azure.writeTimeout | string | `nil` | Azure HTTP write timeout in seconds |
| target.azure.readTimeout | string | `nil` | Azure HTTP read timeout in seconds |
| redis.uri | string | `"redis://redis-master:6379"` | URL of the redis database |
| worker.cacheSize | int | `300` | Maximum number of files and converters to keep open while processing |
| worker.cacheOffsetsSize | int | `500000` | Maximum number of offsets in cache. |
| worker.minimumFileAge | int | `900` | Minimum amount of time in seconds since a file was last modified for it to be considered for processing. |
| worker.numThreads | int | `2` | Number of threads to do processing on |
| cleaner.age | int | `7` | Number of days after which a source file is considered old |
| paths.input | string | `"topics"` | Relative path to intermediate storage root to browse for data |
| paths.output | string | `"output"` | Relative path to output storage to write data |
| paths.factory | string | `"org.radarbase.output.path.FormattedPathFactory"` | Output path construction factory |
| paths.properties | object | `{}` | Additional properties. For details see https://github.com/RADAR-base/radar-output-restructure/blob/master/restructure.yml |
| topics | object | `{}` | Individual topic configuration |
