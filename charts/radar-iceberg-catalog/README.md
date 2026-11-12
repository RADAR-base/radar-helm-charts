

# radar-iceberg-catalog
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-iceberg-catalog)](https://artifacthub.io/packages/helm/radar-base/radar-iceberg-catalog)

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.12.2](https://img.shields.io/badge/AppVersion-0.12.2-informational?style=flat-square)

Apache Iceberg REST catalog for RADAR-base, wrapping Lakekeeper. Holds the pointer to every Iceberg table's current metadata and performs the atomic commit swap.

**Homepage:** <https://radar-base.org>

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-iceberg-catalog>

## Prerequisites
* Kubernetes 1.28+
* Kubectl 1.28+
* Helm 3.1.0+

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../external/lakekeeper | lakekeeper | 0.11.0 |
| https://radar-base.github.io/radar-helm-charts | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| nameOverride | string | `""` | String to partially override the fullname template (will prepend the release name) |
| fullnameOverride | string | `""` | String to fully override the fullname template |
| commonLabels | object | `{}` | Labels added to all resources of this chart |
| commonAnnotations | object | `{}` | Annotations added to all resources of this chart |
| warehouse.name | string | `"radar"` | Name of the Iceberg warehouse to create. Connectors and query engines reference this name as `iceberg.catalog.warehouse` / `iceberg.rest-catalog.warehouse`. |
| warehouse.bucket | string | `"radar-warehouse"` | Object-storage bucket holding the Iceberg data and metadata files. This MUST be a bucket of its own, separate from the `in/` archive and the output bucket, and it MUST NOT have lifecycle rules: Iceberg owns the lifetime of every file in it, and an external rule deleting "old" objects corrupts tables. |
| warehouse.endpoint | string | `"http://minio:9000"` | S3 endpoint. For in-cluster MinIO this is the MinIO service. |
| warehouse.region | string | `"local-01"` | Region. S3-compatible stores ignore it, but the AWS SDK requires a value. |
| warehouse.pathStyleAccess | bool | `true` | Use path-style addressing (`endpoint/bucket`). Required for MinIO. |
| warehouse.flavor | string | `"s3-compat"` | Storage flavour reported to Lakekeeper: `s3-compat` for MinIO, `aws` for real S3. |
| warehouse.stsEnabled | bool | `false` | Enable STS credential vending. Requires a store that implements STS. |
| warehouse.credentials.accessKey | string | `""` | Access key for the warehouse bucket. Ignored when `existingSecret` is set. |
| warehouse.credentials.secretKey | string | `""` | Secret key for the warehouse bucket. Ignored when `existingSecret` is set. |
| warehouse.credentials.existingSecret | string | `""` | Use a pre-existing Secret instead of creating one from the values above. Recommended: it keeps credentials out of values files. |
| warehouse.credentials.accessKeyKey | string | `"AWS_ACCESS_KEY_ID"` | Key within the Secret holding the access key. Named after the AWS SDK environment variable on purpose: Trino consumes this Secret with `envFrom`, which turns each key into an environment variable of the same name, and its Iceberg catalog properties then reference `${ENV:AWS_ACCESS_KEY_ID}`. |
| warehouse.credentials.secretKeyKey | string | `"AWS_SECRET_ACCESS_KEY"` | Key within the Secret holding the secret key. See `accessKeyKey`. |
| bootstrap.enabled | bool | `true` | Run a Job after install/upgrade that bootstraps the server and creates the warehouse. The Job is idempotent: an already-bootstrapped server or an existing warehouse is reported and treated as success. |
| bootstrap.acceptTermsOfUse | bool | `true` | Accept the Lakekeeper terms of use as part of bootstrapping |
| bootstrap.ttlSecondsAfterFinished | int | `600` | Seconds the finished Job is kept before Kubernetes removes it |
| bootstrap.backoffLimit | int | `6` | Number of retries before the Job is marked failed |
| bootstrap.maxWaitSeconds | int | `300` | Seconds to wait for the catalog to answer before giving up |
| bootstrap.image.registry | string | `"docker.io"` | Image registry for the bootstrap Job |
| bootstrap.image.repository | string | `"curlimages/curl"` | Image repository for the bootstrap Job. Needs `curl` and a shell. |
| bootstrap.image.tag | string | `"8.11.1"` | Image tag for the bootstrap Job |
| bootstrap.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy for the bootstrap Job |
| bootstrap.resources | object | `{"requests":{"cpu":"10m","memory":"32Mi"}}` | CPU/Memory resources for the bootstrap Job |
| lakekeeper | object | check `values.yaml` | Values passed through to the upstream Lakekeeper chart (external/lakekeeper). See its own README for the full set. |
| networkpolicy | object | check `values.yaml` | Network policy defines who can access this application and who this application has access to |
