{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "radar-iceberg-catalog.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "radar-iceberg-catalog.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Name of the Secret holding the warehouse storage credentials.
*/}}
{{- define "radar-iceberg-catalog.warehouseSecret" -}}
{{- if .Values.warehouse.credentials.existingSecret -}}
{{- .Values.warehouse.credentials.existingSecret -}}
{{- else -}}
{{- printf "%s-warehouse" (include "radar-iceberg-catalog.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
In-cluster URL of the Lakekeeper service. The subchart names its service after its own
release-derived fullname, which for a subchart is "<release>-lakekeeper".
*/}}
{{- define "radar-iceberg-catalog.lakekeeperUrl" -}}
{{- $port := dig "catalog" "service" "externalPort" 8181 (.Values.lakekeeper | default dict) -}}
{{- printf "http://%s-lakekeeper:%v" .Release.Name $port -}}
{{- end -}}

{{/*
Image reference for the bootstrap job.
*/}}
{{- define "radar-iceberg-catalog.bootstrapImage" -}}
{{- $img := .Values.bootstrap.image -}}
{{- printf "%s/%s:%s" $img.registry $img.repository $img.tag -}}
{{- end -}}
