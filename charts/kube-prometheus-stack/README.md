

# kube-prometheus-stack
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/kube-prometheus-stack)](https://artifacthub.io/packages/helm/radar-base/kube-prometheus-stack)

![Version: 0.4.6](https://img.shields.io/badge/Version-0.4.6-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.77.1](https://img.shields.io/badge/AppVersion-v0.77.1-informational?style=flat-square)

A Helm chart for Prometheus operator stack. This chart is an overlay for original kube-prometheus-stack chart. It defines some the default values for namespaces to monitor, alert templates, Nginx configuration and authentication and a few extra charts for Grafana. For more details on how to customize those values refer to original chart.

**Homepage:** <https://prometheus-operator.dev>

## Source Code

* <https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack>

## Prerequisites
* Kubernetes 1.28+
* Kubectl 1.28+
* Helm 3.1.0+
* PV provisioner support in the underlying infrastructure

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://prometheus-community.github.io/helm-charts | kube-prometheus-stack | 65.3.2 |
