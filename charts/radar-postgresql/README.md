

# radar-postgresql
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-postgresql)](https://artifacthub.io/packages/helm/radar-base/radar-postgresql)
> **:exclamation: This Helm Chart is deprecated!**

![Version: 0.1.3](https://img.shields.io/badge/Version-0.1.3-informational?style=flat-square) ![AppVersion: 11.16.0](https://img.shields.io/badge/AppVersion-11.16.0-informational?style=flat-square)

PostgreSQL (Postgres) is an open source object-relational database known for reliability and data integrity. ACID-compliant, it supports foreign keys, joins, views, triggers and stored procedures.

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

## Prerequisites
* Kubernetes 1.28+
* Kubectl 1.28+
* Helm 3.1.0+

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../external/postgresql | postgresql | 12.1.9 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| postgresql.image.repository | string | `"bitnami/postgresql"` |  |
| postgresql.image.tag | string | `"11.16.0"` |  |
| postgresql.global.postgresql.auth.postgresPassword | string | `""` |  |
| postgresql.auth.postgresPassword | string | `""` |  |
| postgresql.auth.username | string | `""` |  |
| postgresql.auth.password | string | `""` |  |
| postgresql.auth.database | string | `"managementportal"` |  |
| postgresql.replication.applicationName | string | `"radar"` |  |
| postgresql.primary.initdb.scripts."multi-db-init.sh" | string | `"#!/bin/bash\nset -e\nset -u\nexport PGPASSWORD=\"$POSTGRESQL_PASSWORD\"\n\nfunction create_user_and_database() {\n  export PGPASSWORD=\"$POSTGRESQL_PASSWORD\"\n  local database=$1\n  local database_exist=$(psql -U postgres -tAc \"SELECT 1 FROM pg_database WHERE datname='$database';\")\n  if [[ \"$database_exist\" == 1 ]]; then\n    echo \"Database $database already exists\"\n  else\n    echo \"Database $database does not exist\"\n    echo \"  Creating database '$database' for user postgres\"\n    psql -U postgres -v ON_ERROR_STOP=1  <<-EOSQL\n    CREATE DATABASE \"$database\";\n    GRANT ALL PRIVILEGES ON DATABASE $database TO postgres;\nEOSQL\n  fi\n}\n\nif [ -n \"$POSTGRES_MULTIPLE_DATABASES\" ]; then\n  echo \"Multiple database creation requested: $POSTGRES_MULTIPLE_DATABASES\"\n  for db in $(echo $POSTGRES_MULTIPLE_DATABASES | tr ',' ' '); do\n    create_user_and_database $db\n  done\n  echo \"Databases created\"\nfi\n"` |  |
| postgresql.primary.extraEnvVars | list | `[]` |  |
| postgresql.primary.podAnnotations."backup.velero.io/backup-volumes" | string | `"data"` |  |
| postgresql.primary.podAnnotations."post.hook.backup.velero.io/command" | string | `"[\"/bin/fsfreeze\", \"--unfreeze\", \"/bitnami/postgresql\"]"` |  |
| postgresql.primary.podAnnotations."post.hook.backup.velero.io/container" | string | `"fsfreeze"` |  |
| postgresql.primary.podAnnotations."pre.hook.backup.velero.io/command" | string | `"[\"/bin/fsfreeze\", \"--freeze\", \"/bitnami/postgresql\"]"` |  |
| postgresql.primary.podAnnotations."pre.hook.backup.velero.io/container" | string | `"fsfreeze"` |  |
| postgresql.primary.sidecars[0].name | string | `"fsfreeze"` |  |
| postgresql.primary.sidecars[0].image | string | `"busybox"` |  |
| postgresql.primary.sidecars[0].securityContext.privileged | bool | `true` |  |
| postgresql.primary.sidecars[0].volumeMounts[0].mountPath | string | `"/bitnami/postgresql"` |  |
| postgresql.primary.sidecars[0].volumeMounts[0].name | string | `"data"` |  |
| postgresql.primary.sidecars[0].volumeMounts[0].readOnly | bool | `false` |  |
| postgresql.primary.sidecars[0].command[0] | string | `"/bin/sh"` |  |
| postgresql.primary.sidecars[0].command[1] | string | `"-c"` |  |
| postgresql.primary.sidecars[0].command[2] | string | `"sleep infinity"` |  |
| postgresql.primary.persistence.enabled | bool | `true` |  |
| postgresql.primary.persistence.existingClaim | string | `""` |  |
| postgresql.primary.persistence.mountPath | string | `"/bitnami/postgresql"` |  |
| postgresql.primary.persistence.size | string | `"8Gi"` |  |
| postgresql.volumePermissions.enabled | bool | `true` |  |
| postgresql.metrics.enabled | bool | `true` |  |
