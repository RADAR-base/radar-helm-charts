# radar-iceberg-connector

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 7.8.4](https://img.shields.io/badge/AppVersion-7.8.4-informational?style=flat-square)

A Helm chart for RADAR-base Iceberg connector in standalone mode. This connector uses Iceberg sink connector to write Kafka data to Iceberg tables in object storage.

**Homepage:** <https://radar-base.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Yatharth Ranjan | <yatharthranjan89@gmail.com> | <https://www.radar-base.org/> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-iceberg-connector>
* <https://github.com/apache/iceberg>
* <https://iceberg.apache.org/docs/latest/kafka-connect/>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://radar-base.github.io/radar-helm-charts | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity labels for pod assignment |
| autoCreateTables | bool | `true` | Auto create Iceberg tables if they don't exist |
| autoEvolveSchema | bool | `true` | Auto evolve Iceberg table schema |
| bucketAccessKey | string | `"access_key"` | Access key of the target S3 bucket |
| bucketSecretKey | string | `"secret"` | Secret key of the target S3 bucket |
| catalogServer.url | string | `"http://catalog-server:9010"` | Catalog server URL |
| cc.apiKey | string | `"ccApikey"` | API Key of the Confluent Cloud cluster |
| cc.apiSecret | string | `"ccApiSecret"` | API secret of the Confluent Cloud cluster |
| cc.bootstrapServerurl | string | `""` | Confluent cloud based Kafka broker URL (if Confluent Cloud based Kafka cluster is used) |
| cc.enabled | bool | `false` | Set to true, if Confluent Cloud is used |
| cc.schemaRegistryApiKey | string | `"srApiKey"` | API Key of the Confluent Cloud Schema registry |
| cc.schemaRegistryApiSecret | string | `"srApiSecret"` | API Key of the Confluent Cloud Schema registry |
| cc.schemaRegistryUrl | string | `""` | Confluent cloud based Schema registry URL (if Confluent Cloud based Schema registry is used) |
| customLivenessProbe | object | `{}` | Custom livenessProbe that overrides the default one |
| customReadinessProbe | object | `{}` | Custom readinessProbe that overrides the default one |
| customStartupProbe | object | `{}` | Custom startupProbe that overrides the default one |
| extraEnvVars | list | `[]` | Additional environment variables to pass to the connector. These can be used to pass supported kafka and connect specific [configs](https://docs.confluent.io/platform/current/installation/docker/config-reference.html#kconnect-long-configuration) |
| fullnameOverride | string | `""` | String to fully override radar-iceberg-connector.fullname template with a string |
| icebergCatalogType | string | `"rest"` | Iceberg catalog type (rest, hive, hadoop, nessie) |
| icebergCatalogUrl | string | `"http://radar-nessie:19120/api/v1"` | Iceberg REST catalog URL |
| icebergNamespace | string | `"radar"` | Iceberg table namespace/database |
| icebergWarehouse | string | `"s3a://radar-iceberg-warehouse/"` | Iceberg warehouse location (S3 path) |
| image.digest | string | `""` | Image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.pullSecrets | list | `[]` | Optionally specify an array of imagePullSecrets. Secrets must be manually created in the namespace. e.g: pullSecrets:   - myRegistryKeySecretName  |
| image.registry | string | `"ghcr.io"` | Image registry |
| image.repository | string | `"radar-base/kafka-connect-iceberg"` | Image repository |
| image.tag | string | `""` | Image tag (immutable tags are recommended) Overrides the image tag whose default is the chart appVersion. |
| initTopics.enabled | bool | `true` | If true, fetch list of topics from catalog server |
| initTopics.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy to fetch topics with |
| initTopics.image.repository | string | `"linuxserver/yq"` | Image repository to fetch topics with |
| initTopics.image.tag | string | `"3.2.2"` | Image tag to fetch topics with |
| kafka.security.env | list | see `values.yaml` | Env vars set for authentication with Kafka brokers. Not applied when `cc.enabled` is true. |
| kafka.security.jaasSecret | object | `{"key":"sasl.jaas.config","name":"shared-service-user"}` | Secret for the Kafka SASL JAAS configuration. Not applied when `cc.enabled` is true. |
| kafka.url | string | `"SASL_PLAINTEXT://radar-kafka-kafka-bootstrap:9094"` | Kafka broker URLs |
| kafka_num_brokers | int | `3` | Number of deployed Kafka broker instances |
| kafkaHeapOpts | string | `"-Xms3g -Xmx4g"` | JVM Options |
| livenessProbe.enabled | bool | `true` | Enable livenessProbe |
| livenessProbe.failureThreshold | int | `3` | Failure threshold for livenessProbe |
| livenessProbe.initialDelaySeconds | int | `60` | Initial delay seconds for livenessProbe |
| livenessProbe.periodSeconds | int | `30` | Period seconds for livenessProbe |
| livenessProbe.successThreshold | int | `1` | Success threshold for livenessProbe |
| livenessProbe.timeoutSeconds | int | `5` | Timeout seconds for livenessProbe |
| maxTasks | int | `4` | Number of tasks in the connector |
| nameOverride | string | `""` | String to partially override radar-iceberg-connector.fullname template with a string (will prepend the release name) |
| networkpolicy | object | check `values.yaml` | Network policy defines who can access this application and who this applications has access to |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| podSecurityContext | object | `{}` | Configure radar-iceberg-connector pods' Security Context |
| readinessProbe.enabled | bool | `true` | Enable readinessProbe |
| readinessProbe.failureThreshold | int | `3` | Failure threshold for readinessProbe |
| readinessProbe.initialDelaySeconds | int | `30` | Initial delay seconds for readinessProbe |
| readinessProbe.periodSeconds | int | `30` | Period seconds for readinessProbe |
| readinessProbe.successThreshold | int | `1` | Success threshold for readinessProbe |
| readinessProbe.timeoutSeconds | int | `5` | Timeout seconds for readinessProbe |
| replicaCount | int | `1` | Number of radar-iceberg-connector replicas to deploy |
| resources.requests | object | `{"cpu":"100m","memory":"3Gi"}` | CPU/Memory resource requests |
| s3Endpoint | string | `"http://minio:9000"` | Target S3 endpoint url |
| s3Region | string | `"us-east-1"` | The AWS region to be used by the connector. Some compatibility layers require this. |
| schemaRegistry.url | string | `"http://radar-kafka-schema-registry:8081"` | Schema registry URL |
| securityContext | object | `{}` | Configure radar-iceberg-connector containers' Security Context |
| service.port | int | `8083` | radar-iceberg-connector port |
| service.type | string | `"ClusterIP"` | Kubernetes Service type |
| startupProbe.enabled | bool | `true` | Enable startupProbe |
| startupProbe.failureThreshold | int | `30` | Failure threshold for startupProbe |
| startupProbe.initialDelaySeconds | int | `10` | Initial delay seconds for startupProbe |
| startupProbe.periodSeconds | int | `10` | Period seconds for startupProbe |
| startupProbe.successThreshold | int | `1` | Success threshold for startupProbe |
| startupProbe.timeoutSeconds | int | `10` | Timeout seconds for startupProbe |
| tolerations | list | `[]` | Toleration labels for pod assignment |
| topics | string | `""` | List of topics to be consumed by the sink connector separated by comma. Topics defined in the catalog server will automatically be loaded if `initTopics.enabled` is true. |

## Configuration

This chart deploys a standalone Kafka Connect instance with the Apache Iceberg sink connector. The connector writes data from Kafka topics to Iceberg tables stored in object storage (e.g., MinIO, S3).

### Docker Image Configuration

This chart uses the Confluent Kafka Connect image (`confluentinc/cp-kafka-connect`) by default. You have two options for including the Iceberg connector:

#### Option 1: Build a Custom Image (Recommended for Production)

A reference `Dockerfile.example` is included in this chart directory. To build a custom image with the Iceberg connector:

```bash
cd charts/radar-iceberg-connector
docker build -t your-registry/kafka-connect-iceberg:7.8.0 -f Dockerfile.example .
docker push your-registry/kafka-connect-iceberg:7.8.0
```

The Dockerfile includes:
- Apache Iceberg Kafka Connect runtime (1.6.1)
- Iceberg AWS bundle for S3 support
- Proper plugin path configuration

Then use it in your values:

```yaml
image:
  repository: your-registry/kafka-connect-iceberg
  tag: 7.8.0
```

#### Option 2: Install Plugin at Runtime (Development Only)

For development/testing, enable runtime plugin installation:

```yaml
build:
  enabled: true
  icebergVersion: "1.6.1"
```

**Note:** This option increases startup time and is not recommended for production.

### Iceberg Configuration

The connector supports comprehensive configuration based on the [Apache Iceberg Kafka Connect documentation](https://iceberg.apache.org/docs/nightly/kafka-connect/#configuration).

#### Catalog Configuration

- `icebergCatalogUrl`: URL of the Iceberg REST catalog (e.g., Nessie) (`iceberg.catalog.uri`)
- `icebergCatalogType`: Type of catalog - `rest`, `hive`, `hadoop`, `nessie` (`iceberg.catalog.type`)
- `icebergCatalogImpl`: Catalog implementation class (`iceberg.catalog.catalog-impl`)
- `icebergWarehouse`: S3 path where Iceberg table data is stored (`iceberg.catalog.warehouse`)
- `icebergIoImpl`: FileIO implementation (`iceberg.catalog.io-impl`)
  - `org.apache.iceberg.aws.s3.S3FileIO` for S3/MinIO
  - `org.apache.iceberg.hadoop.HadoopFileIO` for HDFS
  - `org.apache.iceberg.gcp.gcs.GCSFileIO` for Google Cloud Storage
- `icebergCatalogCredential`: Catalog credential for authentication (`iceberg.catalog.credential`)
- `icebergCatalogProperties`: Additional catalog-specific properties as key-value map (`iceberg.catalog.*`)
- `icebergNamespace`: Database/namespace for Iceberg tables

#### Table Configuration

- `autoCreateTables`: Automatically create tables if they don't exist (`iceberg.tables.auto-create-enabled`)
- `autoEvolveSchema`: Automatically evolve schema when changes are detected (`iceberg.tables.evolve-schema-enabled`)
- `icebergSchemaForceOptional`: Force all schema fields to be optional (`iceberg.tables.schema-force-optional`)
- `icebergCtasEnabled`: Enable CTAS for auto-created tables (`iceberg.tables.ctas-enabled`)
- `icebergDefaultPartitionBy`: Default partition spec for auto-created tables (`iceberg.tables.default-partition-by`)
- `icebergDefaultCommitBranch`: Default commit branch for tables (`iceberg.tables.default-commit-branch`)
- `icebergWriteFormat`: Write format - `parquet` (default), `orc`, or `avro` (`iceberg.table.write-format`)

**Compression Configuration:**
- `icebergParquetCompressionCodec`: Parquet compression - `snappy`, `gzip`, `lz4`, `zstd`, `uncompressed`
- `icebergParquetCompressionLevel`: Parquet compression level (codec-specific)
- `icebergOrcCompressionCodec`: ORC compression codec
- `icebergAvroCompressionCodec`: Avro compression codec

#### Routing Configuration

- `icebergDynamicTablesEnabled`: Enable dynamic table routing (`iceberg.tables.dynamic-enabled`)
- `icebergRouteField`: Field name to use for routing records to tables (`iceberg.tables.route-field`)
- `icebergTableRouteRegex`: Map of table names to regex patterns for static routing

#### CDC/Upsert Configuration

- `icebergUpsertModeEnabled`: Enable CDC/upsert mode for handling updates and deletes (`iceberg.tables.upsert-mode-enabled`)
- `icebergIdColumns`: Comma-separated ID columns for upsert operations (`iceberg.tables.id-columns`)

#### Control Configuration

- `icebergControlTopic`: Control topic name for coordinating commits (default: `control-iceberg`)
- `icebergControlGroupId`: Control consumer group ID (default: `cg-control-iceberg`)
- `icebergCommitIntervalMs`: Commit interval in milliseconds (default: `60000`)
- `icebergCommitTimeoutMs`: Commit timeout in milliseconds (default: `120000`)
- `icebergCommitThreads`: Number of threads for committing (default: `4`)
- `icebergControlTopicPartitions`: Number of control topic partitions (default: `1`)
- `icebergControlTopicReplicationFactor`: Replication factor for control topic (default: `3`)
- `icebergControlAutoCommitEnabled`: Enable auto-commit on control events (default: `true`)

#### Hadoop Configuration (for HDFS/Hive catalogs)

- `icebergHadoopConfDir`: Path to Hadoop configuration directory (`iceberg.hadoop-conf-dir`)
- `icebergHadoopProperties`: Additional Hadoop properties as key-value map (`iceberg.hadoop.*`)

#### Advanced Configuration

- `icebergPerTableConfig`: Per-table specific configuration as nested map
  ```yaml
  icebergPerTableConfig:
    "default.events_list":
      write-format: "orc"
      route-regex: "list"
      commit-branch: "main"
  ```

### S3 Configuration

Configure S3-compatible object storage:

- `s3Endpoint`: S3 endpoint URL
- `s3Region`: AWS region
- `bucketAccessKey`: S3 access key
- `bucketSecretKey`: S3 secret key

### Kafka Configuration

Configure Kafka connection and security:

- `kafka.url`: Kafka bootstrap servers
- `kafka.security`: Authentication protocol configuration
- `schemaRegistry.url`: Schema registry URL

#### Default Configuration (Confluent Platform)

By default, the chart is configured for Confluent Platform (cp-*) services with PLAINTEXT:

```yaml
kafka:
  url: PLAINTEXT://cp-kafka-headless:9092
  security:
    env:
      - name: CONNECT_SECURITY_PROTOCOL
        value: PLAINTEXT
schemaRegistry:
  url: http://cp-schema-registry:8081
```

#### RADAR Kafka with SASL Authentication

For RADAR Kafka deployment with SASL authentication:

```yaml
kafka:
  url: SASL_PLAINTEXT://radar-kafka-kafka-bootstrap:9094
  security:
    env:
      - name: CONNECT_SECURITY_PROTOCOL
        value: SASL_PLAINTEXT
      - name: CONNECT_SASL_MECHANISM
        value: SCRAM-SHA-512
      - name: CONNECT_PRODUCER_SECURITY_PROTOCOL
        value: SASL_PLAINTEXT
      - name: CONNECT_PRODUCER_SASL_MECHANISM
        value: SCRAM-SHA-512
      - name: CONNECT_CONSUMER_SECURITY_PROTOCOL
        value: SASL_PLAINTEXT
      - name: CONNECT_CONSUMER_SASL_MECHANISM
        value: SCRAM-SHA-512
    jaasSecret:
      name: shared-service-user
      key: sasl.jaas.config
schemaRegistry:
  url: http://radar-kafka-schema-registry:8081
```

### Topics Configuration

Topics can be configured in two ways:

1. **Manual**: Set `topics` with comma-separated topic names
2. **Automatic**: Enable `initTopics.enabled` to fetch topics from the catalog server

### Routing Examples

#### Single Table

Write all records to a single table:

```yaml
topics: "events"
icebergNamespace: default.events
icebergDynamicTablesEnabled: false
```

#### Dynamic Routing

Route records to different tables based on a field value:

```yaml
topics: "events"
icebergDynamicTablesEnabled: true
icebergRouteField: "db_table"  # Records routed based on this field's value
autoCreateTables: true
```

#### Static Routing

Route records to specific tables based on regex patterns:

```yaml
topics: "events"
icebergNamespace: "default.events_list,default.events_create"
icebergRouteField: "type"
icebergTableRouteRegex:
  "default.events_list": "list"
  "default.events_create": "create"
```

### CDC/Upsert Mode

For handling Change Data Capture (CDC) events with updates and deletes:

```yaml
icebergUpsertModeEnabled: true
icebergIdColumns: "id"  # Primary key column(s)
autoEvolveSchema: true
```

### Advanced Examples

#### Partitioned Tables with Compression

```yaml
autoCreateTables: true
icebergDefaultPartitionBy: "hours(ts)"
icebergWriteFormat: parquet
icebergParquetCompressionCodec: "zstd"
icebergParquetCompressionLevel: "3"
```

#### Per-Table Configuration

Configure different settings for different tables:

```yaml
icebergPerTableConfig:
  "default.events_high_volume":
    write-format: "parquet"
    route-regex: "high_volume_.*"
    commit-branch: "main"
  "default.events_low_volume":
    write-format: "orc"
    route-regex: "low_volume_.*"
```

#### Hadoop/HDFS Configuration

For using HDFS storage:

```yaml
icebergCatalogType: hadoop
icebergIoImpl: org.apache.iceberg.hadoop.HadoopFileIO
icebergWarehouse: hdfs://namenode:8020/warehouse
icebergHadoopConfDir: /etc/hadoop/conf
icebergHadoopProperties:
  "iceberg.hadoop.fs.defaultFS": "hdfs://namenode:8020"
  "iceberg.hadoop.dfs.replication": "3"
```

#### REST Catalog with Custom Headers

```yaml
icebergCatalogType: rest
icebergCatalogUrl: https://my-catalog.example.com/api/v1
icebergCatalogCredential: "my-token"
icebergCatalogProperties:
  "iceberg.catalog.header.X-API-Key": "my-api-key"
  "iceberg.catalog.header.X-Tenant-ID": "my-tenant"
```

## Example Installation

### Basic Installation (Confluent Platform defaults)

```bash
helm install radar-iceberg-connector \
  --set bucketAccessKey=mykey \
  --set bucketSecretKey=mysecret \
  --set topics="topic1,topic2,topic3" \
  ./radar-iceberg-connector
```

### Installation with Custom Services

```bash
helm install radar-iceberg-connector \
  --set image.repository=your-registry/kafka-connect-iceberg \
  --set image.tag=7.8.0 \
  --set kafka.url=PLAINTEXT://my-kafka:9092 \
  --set schemaRegistry.url=http://my-schema-registry:8081 \
  --set s3Endpoint=http://my-minio:9000 \
  --set bucketAccessKey=mykey \
  --set bucketSecretKey=mysecret \
  --set icebergCatalogUrl=http://my-nessie:19120/api/v1 \
  --set topics="topic1,topic2,topic3" \
  ./radar-iceberg-connector
```

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)

