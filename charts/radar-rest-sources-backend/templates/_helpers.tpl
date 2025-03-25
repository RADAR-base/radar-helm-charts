{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "radar-rest-sources-backend.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return the proper image name
*/}}
{{- define "radar-rest-sources-backend.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.image "global" .Values.global "chart" .Chart ) }}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "radar-rest-sources-backend.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.image) "global" .Values.global) -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "radar-rest-sources-backend.fullname" -}}
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
Common labels
*/}}
{{- define "radar-rest-sources-backend.labels" -}}
helm.sh/chart: {{ include "radar-rest-sources-backend.chart" . }}
{{ include "radar-rest-sources-backend.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "radar-rest-sources-backend.selectorLabels" -}}
app.kubernetes.io/name: {{ include "radar-rest-sources-backend.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "radar-rest-sources-backend.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Get the name of the secret object.
*/}}
{{- define "radar-rest-sources-backend.secretName" -}}
{{- if eq .type "url" -}}
    {{- .values.postgres.urlSecret.name | default .fullname -}}
{{- else if eq .type "user" -}}
    {{- .values.postgres.userSecret.name | default .fullname -}}
{{- else if eq .type "password" -}}
    {{- .values.postgres.passwordSecret.name | default .fullname -}}
{{- end -}}
{{- end -}}

{{/*
Get the key for the secret object.
*/}}
{{- define "radar-rest-sources-backend.secretKey" -}}
{{- if eq .type "url" -}}
    {{- .values.postgres.urlSecret.key | default "databaseUrl" -}}
{{- else if eq .type "user" -}}
    {{- .values.postgres.userSecret.key | default "databaseUser" -}}
{{- else if eq .type "password" -}}
    {{- .values.postgres.passwordSecret.key | default "databasePassword" -}}
{{- end -}}
{{- end -}}

{{/*
Return true if a secret object should be created
*/}}
{{- define "radar-rest-sources-backend.createSecret" -}}
{{- if not (and .Values.postgres.urlSecret.name .Values.postgres.userSecret.name .Values.postgres.passwordSecret.name) -}}
    {{- true -}}
{{- else -}}
    {{- false -}}
{{- end -}}
{{- end -}}

{{- define "radar-rest-sources-backend.enabledMapElementsAsList" -}}
{{- range $elemId, $elem := . -}}
{{- if eq (toString $elem.enable) "true" }}
{{ (list (omit $elem "enable")) | toYaml }}
{{- end -}}
{{- end -}}
{{ end -}}
