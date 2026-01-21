# Kubecost

Kubecost provides real-time cost visibility and insights for Kubernetes clusters.

## Overview

This chart is an overlay for the official [kubecost cost-analyzer](https://github.com/kubecost/cost-analyzer-helm-chart) chart with custom resource limits configured for RADAR-K8s environments.

## Prerequisites

- Kubernetes 1.20+
- Helm 3.8+
- AWS credentials configured for Cost & Usage Report (CUR) access

## Installation

### Dev Cluster
```bash
cd charts/kubecost
helm dependency update
helm upgrade kubecost . -n kubecost --install -f values-dev.yaml
```

### Stage/Prod Clusters
```bash
# TODO: Create values-stage.yaml and values-prod.yaml
helm upgrade kubecost . -n kubecost --install -f values.yaml -f values-stage.yaml
```

## Configuration

### Key Parameters

| Parameter | Description | Default |
|-----------|-------------|---------|
| `kubecostModel.resources.limits.cpu` | CPU limit for cost analyzer | `200m` |
| `kubecostModel.resources.limits.memory` | Memory limit for cost analyzer | `3072Mi` |
| `prometheus.server.resources.limits.cpu` | CPU limit for Prometheus | `100m` |
| `prometheus.server.resources.limits.memory` | Memory limit for Prometheus | `256Mi` |
| `kubecostProductConfigs.athenaBucketName` | S3 bucket for AWS CUR data | `s3://aws-athena-query-results-phidatalab` |
| `kubecostProductConfigs.athenaRegion` | AWS region for Athena | `eu-west-2` |

### AWS Integration

Kubecost requires AWS Cost & Usage Report (CUR) integration to display accurate cloud costs. Ensure the following are configured:

1. AWS CUR exported to S3
2. Athena database created for CUR data
3. Kubernetes secret `cloud-service-key` with AWS credentials
4. EC2 Spot Instance data feed enabled (optional, for spot pricing)

## Accessing Kubecost
### Local Access (Port Forward)
```bash
kubectl port-forward -n kubecost svc/kubecost-cost-analyzer 9090:9090
```

Then visit: http://localhost:9090

**Note:** Keep the terminal running while accessing the UI.

## Resource Limits Rationale

Resource limits are based on actual usage analysis from dev-cluster-1:

- **Cost Analyzer**: 8m CPU / 2370Mi RAM actual → 200m / 3Gi limit (headroom for spikes)
- **Prometheus**: 11m CPU / 181Mi RAM actual → 100m / 256Mi limit
- **Forecasting**: 1m CPU / 145Mi RAM actual → 200m / 512Mi limit
- **Network Costs**: 9m CPU / 4Mi RAM actual → 100m / 256Mi limit per pod

## Maintainers

- Mani Thumu (mani.thumu@kcl.ac.uk)
- Yatharth Ranjan (yatharth.ranjan@kcl.ac.uk)

## References

- [Kubecost Documentation](https://docs.kubecost.com/)
- [Official Chart Repository](https://github.com/kubecost/cost-analyzer-helm-chart)