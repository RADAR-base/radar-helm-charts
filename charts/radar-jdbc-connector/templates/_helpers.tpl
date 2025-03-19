{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "radar-jdbc-connector.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Return the proper image name
*/}}
{{- define "radar-jdbc-connector.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.image "global" .Values.global "chart" .Chart) }}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "radar-jdbc-connector.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.image) "global" .Values.global) -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "radar-jdbc-connector.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "radar-jdbc-connector.loggers" -}}
{{- if .Values.logLevel.loggers }}
{{- range $name, $level := .Values.logLevel.loggers }}{{(print $name "=" $level ) }},{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "radar-jdbc-connector.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "radar-jdbc-connector.labels" -}}
helm.sh/chart: {{ include "radar-jdbc-connector.chart" . }}
{{ include "radar-jdbc-connector.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "radar-jdbc-connector.selectorLabels" -}}
app.kubernetes.io/name: {{ include "radar-jdbc-connector.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "radar-jdbc-connector.validateValues" -}}
{{- if not (has .Values.mode (list "sink" "source")) }}
{{- fail "Mode must be 'source' for JDBC source connector or 'sink' for JDBC sink connector."}}
{{- end -}}
{{- end -}}

{{/*
Get the name of the secret object.
*/}}
{{- define "radar-jdbc-connector.secretName" -}}
{{- $useCloudnative := index .values "radar-cloudnative-timescaledb" "enabled" }}
{{- if $useCloudnative }}
    {{- $cloudnativeSecret := printf "%s-%s-app" .release (index .values "radar-cloudnative-timescaledb" "cluster" "nameOverride") }}
    {{- $cloudnativeSecret }}
{{- else if and (eq .type "user") }}
    {{- .values.jdbc.userSecret.name | default (include "radar-jdbc-connector.fullname" .) }}
{{- else if and (eq .type "password") }}
    {{- .values.jdbc.passwordSecret.name | default (include "radar-jdbc-connector.fullname" .) }}
{{- end -}}
{{- end -}}

{{/*
Get the key for the secret object.
*/}}
{{- define "radar-jdbc-connector.secretKey" -}}
{{- $useCloudnative := index .values "radar-cloudnative-timescaledb" "enabled" }}
{{- if eq .type "user" }}
    {{- if $useCloudnative }}
        {{- "username" }}
    {{- else }}
        {{ .values.jdbc.userSecret.key | default "databaseUser" }}
    {{- end }}
{{- else if eq .type "password" }}
    {{- if $useCloudnative }}
        {{- "password" }}
    {{- else }}
        {{ .values.jdbc.passwordSecret.key | default "databasePassword" }}
    {{- end }}
{{- end }}
{{- end -}}

{{/*
Get the database url
*/}}
{{- define "radar-jdbc-connector.databaseUrl" -}}
{{- $useCloudnative := index .Values "radar-cloudnative-timescaledb" "enabled" }}
{{- $port := .Values.jdbc.port | default 5432 }}
{{- if $useCloudnative -}}
    {{- include "radar-jdbc-connector.cloudnativeDatabaseUrl" . -}}
{{- else if .Values.jdbc.urlSecret.name -}}
   {{- print include "common.secrets.lookup" (dict "secret" .Values.jdbc.urlSecret.name "key" .Values.jdbc.urlSecret.key "default") -}}
{{- else -}}
    {{- .Values.jdbc.url -}}
{{- end -}}
{{- end -}}

{{/*
Construct the Cloudnative-PG database URL
*/}}
{{- define "radar-jdbc-connector.cloudnativeDatabaseUrl" -}}
{{- $port := .Values.jdbc.port | default 5432 }}
{{- $dbConfig := index .Values "radar-cloudnative-timescaledb" "cluster" }}
{{- $dbname := $dbConfig.cluster.initdb.database | default "postgres" }}
{{- $override := $dbConfig.nameOverride | default "cluster" }}
{{- $host := printf "%s-%s-rw.default" .Release.Name $override }}
{{- printf "jdbc:postgresql://%s:%d/%s" $host $port $dbname -}}
{{- end -}}

{{/*
Return true if a secret object should be created
*/}}
{{- define "radar-jdbc-connector.createSecret" -}}
{{- if index .Values "radar-cloudnative-timescaledb" "enabled" -}}
    {{- false -}}
{{- else if not (and .Values.jdbc.urlSecret .Values.jdbc.userSecret .Values.jdbc.passwordSecret) -}}
    {{- true -}}
{{- else -}}
    {{- false -}}
{{- end -}}
{{- end -}}
