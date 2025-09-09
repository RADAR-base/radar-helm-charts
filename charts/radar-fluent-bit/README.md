

# radar-fluent-bit
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-fluent-bit)](https://artifacthub.io/packages/helm/radar-base/radar-fluent-bit)

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 4.0.3](https://img.shields.io/badge/AppVersion-4.0.3-informational?style=flat-square)

RADAR-base chart for fluent-bit

## Prerequisites
* Kubernetes 1.28+
* Kubectl 1.28+
* Helm 3.1.0+
* PV provisioner support in the underlying infrastructure

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../external/fluent-bit | fluent-bit | 0.50.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| fluent-bit.config.filters | string | `"[FILTER]\n    Name grep\n    match *\n    Exclude log Elasticsearch built-in security features are not enabled\n\n[FILTER]\n    Name kubernetes\n    Match kube.*\n    Merge_Log On\n    Keep_Log On\n    Annotations On\n    Labels On\n    K8S-Logging.Parser On\n    K8S-Logging.Exclude On\n"` |  |
| fluent-bit.config.outputs | string | `"[OUTPUT]\n    Name gelf\n    Match kube.*\n    Host graylog-tcp\n    Port 12222\n    Mode tcp\n    gelf_short_message_key log\n    gelf_host_key stream\n    Retry_Limit False\n\n[OUTPUT]\n    Name gelf\n    Match host.*\n    Host graylog-tcp\n    Port 12222\n    Mode tcp\n    Gelf_Short_Message_Key MESSAGE\n    gelf_host_key stream\n    Retry_Limit False\n"` |  |
