# Installation Guide for radar-iceberg-connector

This guide explains how to install and configure the RADAR Iceberg Connector Helm chart.

## Prerequisites

- Kubernetes cluster (1.19+)
- Helm 3.x
- Kafka cluster with SASL authentication
- Schema Registry
- S3-compatible object storage (MinIO, AWS S3, etc.)
- Iceberg REST catalog (Nessie recommended)

## Quick Start

### Step 1: Build Custom Docker Image (Recommended)

Build a custom Kafka Connect image with the Iceberg connector plugin:

```bash
cd charts/radar-iceberg-connector
docker build -t your-registry/kafka-connect-iceberg:7.8.0 -f Dockerfile.example .
docker push your-registry/kafka-connect-iceberg:7.8.0
```

### Step 2: Create a Values Override File

#### Option A: Using Confluent Platform (Default)

Create `my-values.yaml` for Confluent Platform with PLAINTEXT (default):

```yaml
image:
  repository: your-registry/kafka-connect-iceberg
  tag: 7.8.0

# Uses default cp-* service names with PLAINTEXT
# kafka:
#   url: PLAINTEXT://cp-kafka-headless:9092
# schemaRegistry:
#   url: http://cp-schema-registry:8081

# S3 configuration
bucketAccessKey: my-access-key
bucketSecretKey: my-secret-key

# Topics - Basic single table routing
topics: "topic1,topic2,topic3"

# Routing configuration (optional)
# For dynamic routing based on field value:
# icebergDynamicTablesEnabled: true
# icebergRouteField: "table_name"

# CDC/Upsert mode (optional)
# icebergUpsertModeEnabled: true
# icebergIdColumns: "id"

# Resource limits
resources:
  requests:
    cpu: 500m
    memory: 4Gi
  limits:
    cpu: 2000m
    memory: 8Gi
```

#### Option B: Using RADAR Kafka with SASL

Create `my-values.yaml` for RADAR Kafka with SASL authentication:

```yaml
image:
  repository: your-registry/kafka-connect-iceberg
  tag: 7.8.0

# Kafka configuration with SASL
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

# Schema Registry
schemaRegistry:
  url: http://radar-kafka-schema-registry:8081

# Iceberg configuration
icebergCatalogUrl: http://nessie:19120/api/v1
icebergCatalogType: rest
icebergWarehouse: s3a://my-iceberg-warehouse/
icebergNamespace: radar

# S3 configuration
s3Endpoint: http://minio:9000
s3Region: us-east-1
bucketAccessKey: my-access-key
bucketSecretKey: my-secret-key

# Topics (or enable auto-discovery)
topics: "topic1,topic2,topic3"
# OR
# initTopics:
#   enabled: true

# Resource limits
resources:
  requests:
    cpu: 500m
    memory: 4Gi
  limits:
    cpu: 2000m
    memory: 8Gi
```

### Step 3: Install the Chart

```bash
# Add RADAR Helm repository
helm repo add radar-base https://radar-base.github.io/radar-helm-charts
helm repo update

# Install with common dependency
helm dependency update charts/radar-iceberg-connector

# Install the chart
helm install radar-iceberg-connector \
  -f my-values.yaml \
  charts/radar-iceberg-connector \
  --namespace radar-platform \
  --create-namespace
```

### Step 4: Verify Installation

Check the deployment status:

```bash
# Check pod status
kubectl get pods -n radar-platform -l app.kubernetes.io/name=radar-iceberg-connector

# Check logs
kubectl logs -n radar-platform -l app.kubernetes.io/name=radar-iceberg-connector -f

# Check connector status via REST API
kubectl port-forward -n radar-platform svc/radar-iceberg-connector 8083:8083

# In another terminal
curl http://localhost:8083/connectors
curl http://localhost:8083/connectors/radar-iceberg-sink-connector/status
```

## Configuration Options

### Development Setup (Runtime Plugin Installation)

For development/testing only, you can enable runtime plugin installation:

```yaml
build:
  enabled: true
  icebergVersion: "1.6.1"
```

**Warning:** This significantly increases startup time and is NOT recommended for production.

### Production Setup

1. **Always use a custom-built image** with the Iceberg connector pre-installed
2. **Set appropriate resource limits** based on your data volume
3. **Configure monitoring** using the exposed metrics endpoint
4. **Use secrets** for sensitive credentials instead of plain values
5. **Enable network policies** for security

### High Availability

For production deployments with high availability:

```yaml
replicaCount: 2

resources:
  requests:
    cpu: 1000m
    memory: 6Gi
  limits:
    cpu: 4000m
    memory: 12Gi

affinity:
  podAntiAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      - labelSelector:
          matchLabels:
            app.kubernetes.io/name: radar-iceberg-connector
        topologyKey: kubernetes.io/hostname
```

## Troubleshooting

### Connector Not Starting

1. Check if the Iceberg plugin is loaded:
```bash
kubectl exec -n radar-platform <pod-name> -- ls -la /usr/share/confluent-hub-components/
```

2. Verify Kafka connectivity:
```bash
kubectl exec -n radar-platform <pod-name> -- curl -v telnet://kafka-cluster:9094
```

3. Check connector configuration:
```bash
kubectl exec -n radar-platform <pod-name> -- cat /etc/kafka-connect/sink-iceberg/sink-iceberg.properties
```

### Plugin Not Found

If you see "Connector class not found" errors:
- Ensure you're using a custom image with the Iceberg connector plugin
- Verify the `CONNECT_PLUGIN_PATH` environment variable includes `/usr/share/confluent-hub-components`
- Check that the JAR files are present in the plugin directory

### S3 Connection Issues

1. Verify S3 credentials:
```bash
kubectl get secret -n radar-platform radar-iceberg-connector -o yaml
```

2. Check S3 endpoint accessibility from within the pod:
```bash
kubectl exec -n radar-platform <pod-name> -- curl -v http://minio:9000
```

### Schema Evolution Failures

If schema evolution fails:
- Set `autoEvolveSchema: true` in values
- Verify Schema Registry is accessible
- Check that Avro schemas are compatible

## Monitoring

The connector exposes metrics on port 8083:

```bash
# Access metrics
kubectl port-forward -n radar-platform svc/radar-iceberg-connector 8083:8083
curl http://localhost:8083/metrics
```

## Upgrading

To upgrade to a new version:

```bash
helm upgrade radar-iceberg-connector \
  -f my-values.yaml \
  charts/radar-iceberg-connector \
  --namespace radar-platform
```

## Uninstalling

To remove the chart:

```bash
helm uninstall radar-iceberg-connector --namespace radar-platform
```

**Note:** This does not delete the Iceberg tables or data in S3. You must manually clean up those resources if desired.

