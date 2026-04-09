# radar-distributed-kafka

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 7.8.5](https://img.shields.io/badge/AppVersion-7.8.5-informational?style=flat-square)

A Helm chart for running distributed Kafka source connectors with per-source configuration blocks.

## Overview

This chart deploys one Kafka Connect deployment per connector entry in `connectors`.
Each connector entry has exactly one `type` and one source-specific configuration. This allows separate scaling, restarts and credentials per source config.

At pod startup, each deployment automatically registers (or updates) its connector through the local Kafka Connect REST API. This means every enabled item in `connectors` becomes an active connector without manual `curl` commands.

By default, the chart uses `confluentinc/cp-kafka-connect` as the runtime image. Ensure the required connector plugins (for example S3 source) are available in that image.

This chart can install plugins automatically via an init container before Kafka Connect starts. By default, it installs `confluentinc/kafka-connect-s3-source:latest` into a shared plugin directory and adds that directory to `CONNECT_PLUGIN_PATH`.

Currently supported connector types:

- `s3`: Amazon S3 Source Connector (also compatible with S3-compatible endpoints like MinIO)

The chart is structured to add more connector types in the future by extending connector-type specific sections in the templates.

## Values

See `values.yaml` for all configurable values and defaults.

## Example

```yaml
connectors:
  - name: s3-raw-bucket
    enabled: true
    type: s3
    topic: connect_s3_raw
    maxTasks: 1
    extraEnvVars:
      - name: CONNECT_LOG_LEVEL
        value: INFO
    s3:
      bucketName: radar-raw-bucket
      endpoint: https://s3.eu-west-1.amazonaws.com
      region: eu-west-1
      bucketAccessKey: ""
      bucketSecretKey: ""

pluginInstallation:
  enabled: true
  pluginPath: /opt/connect-plugins
  confluentHubPackages:
    - confluentinc/kafka-connect-s3-source:latest
```
