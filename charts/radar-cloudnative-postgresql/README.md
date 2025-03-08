

# radar-cloudnative-postgresql

![Version: 0.2.1](https://img.shields.io/badge/Version-0.2.1-informational?style=flat-square)

CloudNativePG postgresql helm chart for RADAR-base

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../external/cloudnative-pg/cluster | cluster | 0.2.1 |
| https://radar-base.github.io/radar-helm-charts | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| secrets | list | `[{"dbname":"managementportal","user":"managementportal"},{"dbname":"restsourceauthorizer","user":"restsourceauthorizer"},{"dbname":"appconfig","user":"appconfig"},{"dbname":"kratos","user":"kratos"},{"dbname":"hydra","user":"hydra"},{"dbname":"appserver","user":"appserver"},{"dbname":"uploadconnector","user":"uploadconnector"}]` | Random database password secrets will be created for these users. |
| cluster.type | string | `"postgresql"` |  |
| cluster.version.postgresql | string | `"16"` |  |
| cluster.mode | string | `"standalone"` |  |
| cluster.nameOverride | string | `"postgresql"` |  |
| cluster.recovery.method | string | `"import"` |  |
| cluster.recovery.import.type | string | `"monolith"` |  |
| cluster.recovery.import.databases[0] | string | `"managementportal"` |  |
| cluster.recovery.import.databases[1] | string | `"appconfig"` |  |
| cluster.recovery.import.databases[2] | string | `"kratos"` |  |
| cluster.recovery.import.databases[3] | string | `"hydra"` |  |
| cluster.recovery.import.databases[4] | string | `"restsourceauthorizer"` |  |
| cluster.recovery.import.source.host | string | `"postgresql"` |  |
| cluster.recovery.import.source.username | string | `"postgres"` |  |
| cluster.recovery.import.source.database | string | `"postgres"` |  |
| cluster.recovery.import.source.sslMode | string | `"prefer"` |  |
| cluster.recovery.import.source.passwordSecret.create | bool | `false` |  |
| cluster.recovery.import.source.passwordSecret.name | string | `"postgresql"` |  |
| cluster.recovery.import.source.passwordSecret.key | string | `"postgres-password"` |  |
| cluster.cluster.instances | int | `1` |  |
| cluster.cluster.imagePullPolicy | string | `"Always"` |  |
| cluster.cluster.storage.size | string | `"10Gi"` |  |
| cluster.cluster.monitoring.enabled | bool | `true` |  |
| cluster.cluster.initdb.database | string | `"managementportal"` |  |
| cluster.cluster.initdb.owner | string | `"managementportal"` |  |
| cluster.cluster.initdb.secret.name | string | `"cn-postgresql-managementportal"` |  |
| cluster.cluster.initdb.postInitSQL[0] | string | `"CREATE USER restsourceauthorizer"` |  |
| cluster.cluster.initdb.postInitSQL[1] | string | `"CREATE USER appconfig"` |  |
| cluster.cluster.initdb.postInitSQL[2] | string | `"CREATE USER kratos"` |  |
| cluster.cluster.initdb.postInitSQL[3] | string | `"CREATE USER hydra"` |  |
| cluster.cluster.initdb.postInitSQL[4] | string | `"CREATE USER appserver"` |  |
| cluster.cluster.initdb.postInitSQL[5] | string | `"CREATE USER uploadconnector"` |  |
| cluster.cluster.initdb.postInitSQL[6] | string | `"CREATE DATABASE restsourceauthorizer OWNER restsourceauthorizer"` |  |
| cluster.cluster.initdb.postInitSQL[7] | string | `"CREATE DATABASE appconfig OWNER appconfig"` |  |
| cluster.cluster.initdb.postInitSQL[8] | string | `"CREATE DATABASE kratos OWNER kratos"` |  |
| cluster.cluster.initdb.postInitSQL[9] | string | `"CREATE DATABASE hydra OWNER hydra"` |  |
| cluster.cluster.initdb.postInitSQL[10] | string | `"CREATE DATABASE appserver OWNER appserver"` |  |
| cluster.cluster.initdb.postInitSQL[11] | string | `"CREATE DATABASE uploadconnector OWNER uploadconnector"` |  |
| cluster.cluster.roles[0].name | string | `"managementportal"` |  |
| cluster.cluster.roles[0].ensure | string | `"present"` |  |
| cluster.cluster.roles[0].comment | string | `"User for the managementportal database"` |  |
| cluster.cluster.roles[0].login | bool | `true` |  |
| cluster.cluster.roles[0].superuser | bool | `false` |  |
| cluster.cluster.roles[0].passwordSecret.name | string | `"cn-postgresql-managementportal"` |  |
| cluster.cluster.roles[1].name | string | `"restsourceauthorizer"` |  |
| cluster.cluster.roles[1].ensure | string | `"present"` |  |
| cluster.cluster.roles[1].comment | string | `"User for the restsourceauthorizer database"` |  |
| cluster.cluster.roles[1].login | bool | `true` |  |
| cluster.cluster.roles[1].superuser | bool | `false` |  |
| cluster.cluster.roles[1].passwordSecret.name | string | `"cn-postgresql-restsourceauthorizer"` |  |
| cluster.cluster.roles[2].name | string | `"appconfig"` |  |
| cluster.cluster.roles[2].ensure | string | `"present"` |  |
| cluster.cluster.roles[2].comment | string | `"User for the appconfig database"` |  |
| cluster.cluster.roles[2].login | bool | `true` |  |
| cluster.cluster.roles[2].superuser | bool | `false` |  |
| cluster.cluster.roles[2].passwordSecret.name | string | `"cn-postgresql-appconfig"` |  |
| cluster.cluster.roles[3].name | string | `"kratos"` |  |
| cluster.cluster.roles[3].ensure | string | `"present"` |  |
| cluster.cluster.roles[3].comment | string | `"User for the kratos database"` |  |
| cluster.cluster.roles[3].login | bool | `true` |  |
| cluster.cluster.roles[3].superuser | bool | `false` |  |
| cluster.cluster.roles[3].passwordSecret.name | string | `"cn-postgresql-kratos"` |  |
| cluster.cluster.roles[4].name | string | `"hydra"` |  |
| cluster.cluster.roles[4].ensure | string | `"present"` |  |
| cluster.cluster.roles[4].comment | string | `"User for the hydra database"` |  |
| cluster.cluster.roles[4].login | bool | `true` |  |
| cluster.cluster.roles[4].superuser | bool | `false` |  |
| cluster.cluster.roles[4].passwordSecret.name | string | `"cn-postgresql-hydra"` |  |
| cluster.cluster.roles[5].name | string | `"appserver"` |  |
| cluster.cluster.roles[5].ensure | string | `"present"` |  |
| cluster.cluster.roles[5].comment | string | `"User for the appserver database"` |  |
| cluster.cluster.roles[5].login | bool | `true` |  |
| cluster.cluster.roles[5].superuser | bool | `false` |  |
| cluster.cluster.roles[5].passwordSecret.name | string | `"cn-postgresql-appserver"` |  |
| cluster.cluster.roles[6].name | string | `"uploadconnector"` |  |
| cluster.cluster.roles[6].ensure | string | `"present"` |  |
| cluster.cluster.roles[6].comment | string | `"User for the uploadconnector database"` |  |
| cluster.cluster.roles[6].login | bool | `true` |  |
| cluster.cluster.roles[6].superuser | bool | `false` |  |
| cluster.cluster.roles[6].passwordSecret.name | string | `"cn-postgresql-uploadconnector"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
