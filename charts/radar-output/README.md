



# radar-output
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-output)](https://artifacthub.io/packages/helm/radar-base/radar-output)


![Version: 0.4.1](https://img.shields.io/badge/Version-0.4.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.3.1](https://img.shields.io/badge/AppVersion-2.3.1-informational?style=flat-square) 

A Helm chart for RADAR-base output restructure service. This application reads data from intermediate storage and restructure the data into project-> subject-id-> data topic -> data split per hour. This service offers few options to choose the source and target of the pipeline.

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Keyvan Hedayati | <keyvan@thehyve.nl> | <https://www.thehyve.nl> |
| Joris Borgdorff | <joris@thehyve.nl> | <https://www.thehyve.nl/experts/joris-borgdorff> |
| Nivethika Mahasivam | <nivethika@thehyve.nl> | <https://www.thehyve.nl/experts/nivethika-mahasivam> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-output>
* <https://github.com/RADAR-base/radar-output-restructure>

## Prerequisites
* Kubernetes 1.22+
* Kubectl 1.22+
* Helm 3.1.0+



## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `1` | Number of radar-output replicas to deploy |
| image.repository | string | `"radarbase/radar-output-restructure"` | radar-output image repository |
| image.tag | string | `"2.3.1"` | radar-output image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
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
| extraEnvVars | list | `[]` | Extra environment variables |
| networkpolicy | object | check `values.yaml` | Network policy defines who can access this application and who this applications has access to |
| javaOpts | string | `"-Xms400m -Xmx3g"` |  |
| existingSecret | string | `nil` | Existing secret for storing S3 or Azure credentials. |
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
| worker.interval | int | `90` | Scanning interval (seconds) |
| worker.cacheSize | int | `300` | Maximum number of files and converters to keep open while processing |
| worker.cacheOffsetsSize | int | `500000` | Maximum number of offsets in cache. |
| worker.minimumFileAge | int | `900` | Minimum amount of time in seconds since a file was last modified for it to be considered for processing. |
| worker.maxFilesPerTopic | int | `20` | Maximum number of files to process in a single poll operation. Reduce to get more parallel workloads, increase to avoid idling too much if the individual file sizes are very small. |
| worker.numThreads | int | `2` | Number of threads to do processing on |
| cleaner.age | int | `7` | Number of days after which a source file is considered old |
| cleaner.interval | int | `86400` | Interval in seconds between cleanups |
| paths.input | string | `"topics"` | Relative path to intermediate storage root to browse for data |
| paths.output | string | `"output"` | Relative path to output storage to write data |
| paths.factory | string | `"org.radarbase.output.path.FormattedPathFactory"` | Output path construction factory |
| paths.properties | object | `{}` | Additional properties. For details see https://github.com/RADAR-base/radar-output-restructure/blob/master/restructure.yml |
| topics | object | `{"questionnaire_response":{"pathProperties":{"format":"${projectId}/${userId}/${topic}/${value:name}/${filename}","plugins":"fixed value"}}}` | Individual topic configuration |
| topics.questionnaire_response.pathProperties.format | string | `"${projectId}/${userId}/${topic}/${value:name}/${filename}"` | Alternative path output of the questionnaire_response topic |
| topics.questionnaire_response.pathProperties.plugins | string | `"fixed value"` | Alternative path plugins of the questionnaire_response topic |
| deduplication.enable | bool | `true` | Whether to enable deduplication |
| compression.type | string | `"gzip"` | Compression type to use for output files. Can be one of: gzip, zip, none |

## Cost Considerations

If you are using paid S3 services (like AWS S3), then you might want to update the following values to reduce the involved costs -

1. `worker.interval` - Increase this value to reduce the number of times the worker runs. This will reduce the number of times the worker will check for new files in the S3 bucket. The default value is 90 seconds. You can increase this value to 900 seconds (15 minutes) or more depending on your use case. Make sure to increase the `worker.maxFilesPerTopic` value to match the number of files you expect to be processed in the given interval.
2. `worker.cacheSize` - Increase this value to reduce S3 costs. This will increase local storage and memory requirements of radar-output.
3. `paths.properties.format`- Change the output path format to `${project}/${user}/${topic}/${time:YYYYmmdd}${attempt}${extension}` to only create one file per day.
4. `deduplication.enable` - Set this to false. This will reduce the number of requests and memory used by the output converter, but it may increase the storage size and will require analysts to remove duplicates at a later time.
