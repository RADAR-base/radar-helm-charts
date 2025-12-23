

# radar-hydra
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/radar-hydra)](https://artifacthub.io/packages/helm/radar-base/radar-hydra)

![Version: 0.3.0](https://img.shields.io/badge/Version-0.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v2.2.0](https://img.shields.io/badge/AppVersion-v2.2.0-informational?style=flat-square)

A ORY Hydra Helm chart for RADAR-base. ORY Hydra is a cloud native Identity and User Management system.

**Homepage:** <https://radar-base.org>

## ORY Hydra

This chart deploys [ORY Hydra](https://www.ory.sh/hydra/) via a dependency to this chart. Configuration to the ORY Hydra chart is passed via the `hydra:` key in the values.yaml file.
Consult the [documentation](https://artifacthub.io/packages/helm/ory/hydra) of the Ory Hydra chart for additional information on how to configure this service if needed.

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Pim van Nierop | <pim@thehyve.nl> | <https://www.thehyve.nl/experts/pim-van-nierop> |

## Source Code

* <https://github.com/RADAR-base/radar-helm-charts/tree/main/charts/radar-hydra>

## Prerequisites
* Kubernetes 1.28+
* Kubectl 1.28+
* Helm 3.1.0+

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../external/hydra | hydra | 0.53.0 |
| https://radar-base.github.io/radar-helm-charts | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| hydra | object | check `values.yaml` | Ory Hydra configuration |
| hydra.server_name | string | `"localhost"` | Hostname for the Kratos service |
| hydra.advertised_protocol | string | `"https"` | Protocol for the Kratos service (allowed values: http, https) |
| hydra_server_url | string | `"http://radar-hydra-public:4444"` |  |
| hydra_admin_url | string | `"http://radar-hydra-admin:4445/admin"` |  |
| oauth_clients.ManagementPortalapp.enable | bool | `true` |  |
| oauth_clients.ManagementPortalapp.redirectUris[0] | string | `"http://localhost/managementportal/api/redirect/login"` |  |
| oauth_clients.ManagementPortalapp.grantTypes[0] | string | `"authorization_code"` |  |
| oauth_clients.ManagementPortalapp.grantTypes[1] | string | `"refresh_token"` |  |
| oauth_clients.ManagementPortalapp.responseTypes[0] | string | `"code"` |  |
| oauth_clients.ManagementPortalapp.responseTypes[1] | string | `"id_token"` |  |
| oauth_clients.ManagementPortalapp.client_secret | string | `""` |  |
| oauth_clients.ManagementPortalapp.scope | string | `"SOURCEDATA.CREATE SOURCETYPE.UPDATE SOURCETYPE.DELETE AUTHORITY.UPDATE MEASUREMENT.DELETE PROJECT.READ AUDIT.CREATE USER.DELETE AUTHORITY.DELETE SUBJECT.DELETE MEASUREMENT.UPDATE SOURCEDATA.UPDATE SUBJECT.READ USER.UPDATE SOURCETYPE.CREATE AUTHORITY.READ USER.CREATE SOURCE.CREATE SOURCE.READ SUBJECT.CREATE ROLE.UPDATE ROLE.READ MEASUREMENT.READ PROJECT.UPDATE PROJECT.DELETE ROLE.DELETE SOURCE.DELETE SOURCETYPE.READ ROLE.CREATE SOURCEDATA.DELETE SUBJECT.UPDATE SOURCE.UPDATE PROJECT.CREATE AUDIT.READ MEASUREMENT.CREATE AUDIT.DELETE AUDIT.UPDATE AUTHORITY.CREATE USER.READ SOURCEDATA.READ ORGANIZATION.READ ORGANIZATION.CREATE ORGANIZATION.UPDATE OAUTHCLIENTS.READ OAUTHCLIENTS.CREATE OAUTHCLIENTS.UPDATE"` |  |
| oauth_clients.ManagementPortalapp.audience[0] | string | `"res_ManagementPortal"` |  |
| oauth_clients.ManagementPortalapp.allowed_cors_origins[0] | string | `"http://localhost:3000"` |  |
| oauth_clients.ManagementPortalapp.skip_consent | bool | `true` |  |
| oauth_clients.ManagementPortalapp.skip_logout_consent | bool | `false` |  |
| oauth_clients.pRMT.enable | bool | `false` |  |
| oauth_clients.pRMT.audience[0] | string | `"res_gateway"` |  |
| oauth_clients.pRMT.audience[1] | string | `"res_ManagementPortal"` |  |
| oauth_clients.pRMT.audience[2] | string | `"res_appconfig"` |  |
| oauth_clients.pRMT.client_secret | string | `""` |  |
| oauth_clients.pRMT.scope[0] | string | `"MEASUREMENT.CREATE"` |  |
| oauth_clients.pRMT.scope[1] | string | `"PROJECT.READ"` |  |
| oauth_clients.pRMT.scope[2] | string | `"ROLE.READ"` |  |
| oauth_clients.pRMT.scope[3] | string | `"SOURCE.READ"` |  |
| oauth_clients.pRMT.scope[4] | string | `"SOURCEDATA.READ"` |  |
| oauth_clients.pRMT.scope[5] | string | `"SOURCETYPE.READ"` |  |
| oauth_clients.pRMT.scope[6] | string | `"SUBJECT.READ"` |  |
| oauth_clients.pRMT.scope[7] | string | `"SUBJECT.UPDATE"` |  |
| oauth_clients.pRMT.scope[8] | string | `"USER.READ"` |  |
| oauth_clients.pRMT.grantTypes[0] | string | `"refresh_token"` |  |
| oauth_clients.pRMT.grantTypes[1] | string | `"authorization_code"` |  |
| oauth_clients.pRMT.access_token_validity | int | `43200` |  |
| oauth_clients.pRMT.refresh_token_validity | int | `7948800` |  |
| oauth_clients.pRMT.additional_information | string | `"{\"dynamic_registration\": true}"` |  |
| oauth_clients.pRMT.tokenEndpointAuthMethod | string | `"client_secret_post"` |  |
| oauth_clients.aRMT.enable | bool | `false` |  |
| oauth_clients.aRMT.audience[0] | string | `"res_gateway"` |  |
| oauth_clients.aRMT.audience[1] | string | `"res_ManagementPortal"` |  |
| oauth_clients.aRMT.audience[2] | string | `"res_appconfig"` |  |
| oauth_clients.aRMT.audience[3] | string | `"res_AppServer"` |  |
| oauth_clients.aRMT.audience[4] | string | `"res_DataDashboardAPI"` |  |
| oauth_clients.aRMT.client_secret | string | `""` |  |
| oauth_clients.aRMT.scope[0] | string | `"MEASUREMENT.READ"` |  |
| oauth_clients.aRMT.scope[1] | string | `"MEASUREMENT.CREATE"` |  |
| oauth_clients.aRMT.scope[2] | string | `"PROJECT.READ"` |  |
| oauth_clients.aRMT.scope[3] | string | `"ROLE.READ"` |  |
| oauth_clients.aRMT.scope[4] | string | `"SOURCE.READ"` |  |
| oauth_clients.aRMT.scope[5] | string | `"SOURCEDATA.READ"` |  |
| oauth_clients.aRMT.scope[6] | string | `"SOURCETYPE.READ"` |  |
| oauth_clients.aRMT.scope[7] | string | `"SUBJECT.READ"` |  |
| oauth_clients.aRMT.scope[8] | string | `"SUBJECT.UPDATE"` |  |
| oauth_clients.aRMT.scope[9] | string | `"USER.READ"` |  |
| oauth_clients.aRMT.grantTypes[0] | string | `"refresh_token"` |  |
| oauth_clients.aRMT.grantTypes[1] | string | `"authorization_code"` |  |
| oauth_clients.aRMT.access_token_validity | int | `43200` |  |
| oauth_clients.aRMT.refresh_token_validity | int | `7948800` |  |
| oauth_clients.aRMT.additional_information | string | `"{\"dynamic_registration\": true}"` |  |
| oauth_clients.aRMT.tokenEndpointAuthMethod | string | `"client_secret_post"` |  |
| oauth_clients.aRMT.redirectUris[0] | string | `"http://localhost/managementportal/api/redirect/login"` |  |
| oauth_clients.SEP.enable | bool | `false` |  |
| oauth_clients.SEP.audience[0] | string | `"res_gateway"` |  |
| oauth_clients.SEP.audience[1] | string | `"res_ManagementPortal"` |  |
| oauth_clients.SEP.audience[2] | string | `"res_appconfig"` |  |
| oauth_clients.SEP.audience[3] | string | `"res_AppServer"` |  |
| oauth_clients.SEP.audience[4] | string | `"res_DataDashboardAPI"` |  |
| oauth_clients.SEP.audience[5] | string | `"res_restAuthorizer"` |  |
| oauth_clients.SEP.client_secret | string | `""` |  |
| oauth_clients.SEP.scope[0] | string | `"PROJECT.READ"` |  |
| oauth_clients.SEP.scope[1] | string | `"SOURCETYPE.READ"` |  |
| oauth_clients.SEP.scope[2] | string | `"SUBJECT.READ"` |  |
| oauth_clients.SEP.scope[3] | string | `"SUBJECT.UPDATE"` |  |
| oauth_clients.SEP.scope[4] | string | `"SUBJECT.CREATE"` |  |
| oauth_clients.SEP.scope[5] | string | `"USER.READ"` |  |
| oauth_clients.SEP.grantTypes[0] | string | `"refresh_token"` |  |
| oauth_clients.SEP.grantTypes[1] | string | `"authorization_code"` |  |
| oauth_clients.SEP.grantTypes[2] | string | `"client_credentials"` |  |
| oauth_clients.SEP.access_token_validity | int | `43200` |  |
| oauth_clients.SEP.refresh_token_validity | int | `7948800` |  |
| oauth_clients.SEP.additional_information | string | `"{\"dynamic_registration\": true}"` |  |
| oauth_clients.SEP.redirectUris[0] | string | `"http://localhost/managementportal/api/redirect/login"` |  |
| oauth_clients.THINC-IT.enable | bool | `false` |  |
| oauth_clients.THINC-IT.audience[0] | string | `"res_gateway"` |  |
| oauth_clients.THINC-IT.audience[1] | string | `"res_ManagementPortal"` |  |
| oauth_clients.THINC-IT.audience[2] | string | `"res_appconfig"` |  |
| oauth_clients.THINC-IT.client_secret | string | `""` |  |
| oauth_clients.THINC-IT.scope[0] | string | `"MEASUREMENT.CREATE"` |  |
| oauth_clients.THINC-IT.scope[1] | string | `"PROJECT.READ"` |  |
| oauth_clients.THINC-IT.scope[2] | string | `"ROLE.READ"` |  |
| oauth_clients.THINC-IT.scope[3] | string | `"SOURCE.READ"` |  |
| oauth_clients.THINC-IT.scope[4] | string | `"SOURCEDATA.READ"` |  |
| oauth_clients.THINC-IT.scope[5] | string | `"SOURCETYPE.READ"` |  |
| oauth_clients.THINC-IT.scope[6] | string | `"SUBJECT.READ"` |  |
| oauth_clients.THINC-IT.scope[7] | string | `"SUBJECT.UPDATE"` |  |
| oauth_clients.THINC-IT.scope[8] | string | `"USER.READ"` |  |
| oauth_clients.THINC-IT.grantTypes[0] | string | `"refresh_token"` |  |
| oauth_clients.THINC-IT.grantTypes[1] | string | `"authorization_code"` |  |
| oauth_clients.THINC-IT.access_token_validity | int | `43200` |  |
| oauth_clients.THINC-IT.refresh_token_validity | int | `7948800` |  |
| oauth_clients.THINC-IT.additional_information | string | `"{\"dynamic_registration\": true}"` |  |
| oauth_clients.radar_redcap_integrator.enable | bool | `false` |  |
| oauth_clients.radar_redcap_integrator.audience[0] | string | `"res_ManagementPortal"` |  |
| oauth_clients.radar_redcap_integrator.client_secret | string | `""` |  |
| oauth_clients.radar_redcap_integrator.scope[0] | string | `"PROJECT.READ"` |  |
| oauth_clients.radar_redcap_integrator.scope[1] | string | `"SUBJECT.CREATE"` |  |
| oauth_clients.radar_redcap_integrator.scope[2] | string | `"SUBJECT.READ"` |  |
| oauth_clients.radar_redcap_integrator.scope[3] | string | `"SUBJECT.UPDATE"` |  |
| oauth_clients.radar_redcap_integrator.grantTypes[0] | string | `"client_credentials"` |  |
| oauth_clients.radar_redcap_integrator.access_token_validity | int | `900` |  |
| oauth_clients.radar_upload_backend.enable | bool | `false` |  |
| oauth_clients.radar_upload_backend.audience[0] | string | `"res_ManagementPortal"` |  |
| oauth_clients.radar_upload_backend.client_secret | string | `""` |  |
| oauth_clients.radar_upload_backend.scope[0] | string | `"PROJECT.READ"` |  |
| oauth_clients.radar_upload_backend.scope[1] | string | `"SUBJECT.READ"` |  |
| oauth_clients.radar_upload_backend.grantTypes[0] | string | `"client_credentials"` |  |
| oauth_clients.radar_upload_backend.access_token_validity | int | `900` |  |
| oauth_clients.radar_upload_backend.additional_information | string | `"{\"dynamic_registration\": true}"` |  |
| oauth_clients.radar_upload_connect.enable | bool | `false` |  |
| oauth_clients.radar_upload_connect.audience[0] | string | `"res_ManagementPortal"` |  |
| oauth_clients.radar_upload_connect.audience[1] | string | `"res_upload"` |  |
| oauth_clients.radar_upload_connect.client_secret | string | `""` |  |
| oauth_clients.radar_upload_connect.scope[0] | string | `"MEASUREMENT.CREATE"` |  |
| oauth_clients.radar_upload_connect.scope[1] | string | `"PROJECT.READ"` |  |
| oauth_clients.radar_upload_connect.scope[2] | string | `"SOURCE.READ"` |  |
| oauth_clients.radar_upload_connect.scope[3] | string | `"SOURCETYPE.READ"` |  |
| oauth_clients.radar_upload_connect.scope[4] | string | `"SUBJECT.READ"` |  |
| oauth_clients.radar_upload_connect.scope[5] | string | `"SUBJECT.UPDATE"` |  |
| oauth_clients.radar_upload_connect.grantTypes[0] | string | `"client_credentials"` |  |
| oauth_clients.radar_upload_connect.access_token_validity | int | `900` |  |
| oauth_clients.radar_upload_frontend.enable | bool | `false` |  |
| oauth_clients.radar_upload_frontend.audience[0] | string | `"res_ManagementPortal"` |  |
| oauth_clients.radar_upload_frontend.audience[1] | string | `"res_upload"` |  |
| oauth_clients.radar_upload_frontend.client_secret | string | `""` |  |
| oauth_clients.radar_upload_frontend.scope[0] | string | `"MEASUREMENT.CREATE"` |  |
| oauth_clients.radar_upload_frontend.scope[1] | string | `"PROJECT.READ"` |  |
| oauth_clients.radar_upload_frontend.scope[2] | string | `"SOURCETYPE.READ"` |  |
| oauth_clients.radar_upload_frontend.scope[3] | string | `"SUBJECT.READ"` |  |
| oauth_clients.radar_upload_frontend.grantTypes[0] | string | `"authorization_code"` |  |
| oauth_clients.radar_upload_frontend.access_token_validity | int | `900` |  |
| oauth_clients.radar_upload_frontend.redirectUris[0] | string | `"/upload/login"` |  |
| oauth_clients.radar_upload_frontend.redirectUris[1] | string | `"http://localhost:8080/upload/login"` |  |
| oauth_clients.radar_rest_sources_auth_backend.enable | bool | `false` |  |
| oauth_clients.radar_rest_sources_auth_backend.audience[0] | string | `"res_ManagementPortal"` |  |
| oauth_clients.radar_rest_sources_auth_backend.audience[1] | string | `"res_upload"` |  |
| oauth_clients.radar_rest_sources_auth_backend.audience[2] | string | `"res_restAuthorizer"` |  |
| oauth_clients.radar_rest_sources_auth_backend.client_secret | string | `""` |  |
| oauth_clients.radar_rest_sources_auth_backend.scope[0] | string | `"PROJECT.READ"` |  |
| oauth_clients.radar_rest_sources_auth_backend.scope[1] | string | `"SUBJECT.READ"` |  |
| oauth_clients.radar_rest_sources_auth_backend.scope[2] | string | `"SUBJECT.UPDATE"` |  |
| oauth_clients.radar_rest_sources_auth_backend.grantTypes[0] | string | `"client_credentials"` |  |
| oauth_clients.radar_rest_sources_auth_backend.access_token_validity | int | `900` |  |
| oauth_clients.radar_rest_sources_auth_backend.tokenEndpointAuthMethod | string | `"client_secret_post"` |  |
| oauth_clients.radar_rest_sources_authorizer.enable | bool | `false` |  |
| oauth_clients.radar_rest_sources_authorizer.audience[0] | string | `"res_restAuthorizer"` |  |
| oauth_clients.radar_rest_sources_authorizer.client_secret | string | `""` |  |
| oauth_clients.radar_rest_sources_authorizer.scope[0] | string | `"PROJECT.READ"` |  |
| oauth_clients.radar_rest_sources_authorizer.scope[1] | string | `"SOURCETYPE.READ"` |  |
| oauth_clients.radar_rest_sources_authorizer.scope[2] | string | `"SUBJECT.READ"` |  |
| oauth_clients.radar_rest_sources_authorizer.scope[3] | string | `"SUBJECT.UPDATE"` |  |
| oauth_clients.radar_rest_sources_authorizer.scope[4] | string | `"SUBJECT.CREATE"` |  |
| oauth_clients.radar_rest_sources_authorizer.grantTypes[0] | string | `"authorization_code"` |  |
| oauth_clients.radar_rest_sources_authorizer.access_token_validity | int | `900` |  |
| oauth_clients.radar_rest_sources_authorizer.redirectUris[0] | string | `"http://localhost/rest-sources/authorizer/login"` |  |
| oauth_clients.radar_rest_sources_authorizer.tokenEndpointAuthMethod | string | `"client_secret_post"` |  |
| oauth_clients.radar_fitbit_connector.enable | bool | `false` |  |
| oauth_clients.radar_fitbit_connector.audience[0] | string | `"res_restAuthorizer"` |  |
| oauth_clients.radar_fitbit_connector.client_secret | string | `""` |  |
| oauth_clients.radar_fitbit_connector.scope[0] | string | `"SUBJECT.READ"` |  |
| oauth_clients.radar_fitbit_connector.scope[1] | string | `"MEASUREMENT.CREATE"` |  |
| oauth_clients.radar_fitbit_connector.grantTypes[0] | string | `"client_credentials"` |  |
| oauth_clients.radar_fitbit_connector.access_token_validity | int | `900` |  |
| oauth_clients.radar_fitbit_connector.tokenEndpointAuthMethod | string | `"client_secret_post"` |  |
| oauth_clients.radar_appconfig.enable | bool | `false` |  |
| oauth_clients.radar_appconfig.audience[0] | string | `"res_ManagementPortal"` |  |
| oauth_clients.radar_appconfig.audience[1] | string | `"res_appconfig"` |  |
| oauth_clients.radar_appconfig.client_secret | string | `""` |  |
| oauth_clients.radar_appconfig.scope[0] | string | `"MEASUREMENT.CREATE"` |  |
| oauth_clients.radar_appconfig.scope[1] | string | `"OAUTHCLIENTS.READ"` |  |
| oauth_clients.radar_appconfig.scope[2] | string | `"PROJECT.READ"` |  |
| oauth_clients.radar_appconfig.scope[3] | string | `"SOURCETYPE.READ"` |  |
| oauth_clients.radar_appconfig.scope[4] | string | `"SUBJECT.READ"` |  |
| oauth_clients.radar_appconfig.grantTypes[0] | string | `"client_credentials"` |  |
| oauth_clients.radar_appconfig.access_token_validity | int | `900` |  |
| oauth_clients.appconfig_frontend.enable | bool | `false` |  |
| oauth_clients.appconfig_frontend.audience[0] | string | `"res_appconfig"` |  |
| oauth_clients.appconfig_frontend.client_secret | string | `""` |  |
| oauth_clients.appconfig_frontend.scope[0] | string | `"MEASUREMENT.CREATE"` |  |
| oauth_clients.appconfig_frontend.scope[1] | string | `"OAUTHCLIENTS.READ"` |  |
| oauth_clients.appconfig_frontend.scope[2] | string | `"PROJECT.CREATE"` |  |
| oauth_clients.appconfig_frontend.scope[3] | string | `"PROJECT.READ"` |  |
| oauth_clients.appconfig_frontend.scope[4] | string | `"PROJECT.UPDATE"` |  |
| oauth_clients.appconfig_frontend.scope[5] | string | `"SOURCETYPE.READ"` |  |
| oauth_clients.appconfig_frontend.scope[6] | string | `"SUBJECT.READ"` |  |
| oauth_clients.appconfig_frontend.scope[7] | string | `"SUBJECT.UPDATE"` |  |
| oauth_clients.appconfig_frontend.grantTypes[0] | string | `"authorization_code"` |  |
| oauth_clients.appconfig_frontend.grantTypes[1] | string | `"refresh_token"` |  |
| oauth_clients.appconfig_frontend.access_token_validity | int | `900` |  |
| oauth_clients.appconfig_frontend.refresh_token_validity | int | `78000` |  |
| oauth_clients.appconfig_frontend.redirectUris[0] | string | `"/appconfig/login"` |  |
| oauth_clients.appconfig_frontend.autoapprove[0] | string | `"MEASUREMENT.CREATE"` |  |
| oauth_clients.appconfig_frontend.autoapprove[1] | string | `"OAUTHCLIENTS.READ"` |  |
| oauth_clients.appconfig_frontend.autoapprove[2] | string | `"PROJECT.CREATE"` |  |
| oauth_clients.appconfig_frontend.autoapprove[3] | string | `"PROJECT.READ"` |  |
| oauth_clients.appconfig_frontend.autoapprove[4] | string | `"PROJECT.UPDATE"` |  |
| oauth_clients.appconfig_frontend.autoapprove[5] | string | `"SOURCETYPE.READ"` |  |
| oauth_clients.appconfig_frontend.autoapprove[6] | string | `"SUBJECT.READ"` |  |
| oauth_clients.appconfig_frontend.autoapprove[7] | string | `"SUBJECT.UPDATE"` |  |
| oauth_clients.grafana_dashboard.enable | bool | `false` |  |
| oauth_clients.grafana_dashboard.audience[0] | string | `"res_ManagementPortal"` |  |
| oauth_clients.grafana_dashboard.client_secret | string | `""` |  |
| oauth_clients.grafana_dashboard.scope[0] | string | `"USER.READ"` |  |
| oauth_clients.grafana_dashboard.grantTypes[0] | string | `"authorization_code"` |  |
| oauth_clients.grafana_dashboard.grantTypes[1] | string | `"refresh_token"` |  |
| oauth_clients.grafana_dashboard.access_token_validity | int | `900` |  |
| oauth_clients.grafana_dashboard.refresh_token_validity | int | `78000` |  |
| oauth_clients.grafana_dashboard.redirectUris[0] | string | `"{{ .Values.advertised_protocol }}://dashboard.{{ .Values.server_name }}/login/generic_oauth"` |  |
| oauth_clients.grafana_dashboard.autoapprove[0] | string | `"USER.READ"` |  |
| oauth_clients.radar_push_endpoint.enable | bool | `false` |  |
| oauth_clients.radar_push_endpoint.audience[0] | string | `"res_restAuthorizer"` |  |
| oauth_clients.radar_push_endpoint.client_secret | string | `""` |  |
| oauth_clients.radar_push_endpoint.scope[0] | string | `"SOURCETYPE.READ"` |  |
| oauth_clients.radar_push_endpoint.scope[1] | string | `"SUBJECT.UPDATE"` |  |
| oauth_clients.radar_push_endpoint.scope[2] | string | `"MEASUREMENT.READ"` |  |
| oauth_clients.radar_push_endpoint.scope[3] | string | `"MEASUREMENT.CREATE"` |  |
| oauth_clients.radar_push_endpoint.scope[4] | string | `"PROJECT.READ"` |  |
| oauth_clients.radar_push_endpoint.scope[5] | string | `"SUBJECT.READ"` |  |
| oauth_clients.radar_push_endpoint.grantTypes[0] | string | `"client_credentials"` |  |
| oauth_clients.radar_push_endpoint.access_token_validity | int | `900` |  |
| oauth_clients.radar_data_dashboard_backend.enable | bool | `false` |  |
| oauth_clients.radar_data_dashboard_backend.audience[0] | string | `"res_ManagementPortal"` |  |
| oauth_clients.radar_data_dashboard_backend.client_secret | string | `""` |  |
| oauth_clients.radar_data_dashboard_backend.scope[0] | string | `"PROJECT.READ"` |  |
| oauth_clients.radar_data_dashboard_backend.scope[1] | string | `"SUBJECT.READ"` |  |
| oauth_clients.radar_data_dashboard_backend.scope[2] | string | `"MEASUREMENT.READ"` |  |
| oauth_clients.radar_data_dashboard_backend.grantTypes[0] | string | `"client_credentials"` |  |
| oauth_clients.radar_data_dashboard_backend.access_token_validity | int | `900` |  |
