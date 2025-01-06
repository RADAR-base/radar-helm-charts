{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "radar-gateway.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "radar-gateway.fullname" -}}
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
{{- define "radar-gateway.labels" -}}
helm.sh/chart: {{ include "radar-gateway.chart" . }}
{{ include "radar-gateway.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "radar-gateway.selectorLabels" -}}
app.kubernetes.io/name: {{ include "radar-gateway.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "radar-gateway.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Service name to be used by Sentry
*/}}
{{- define "radar-gateway.sentryName" -}}
{{- if .Values.sentry.service.name }}
{{- printf "%s" .Values.sentry.service.name -}}
{{- else -}}
{{- printf "%s" (include "radar-gateway.fullname" .) -}}{{- end -}}
{{- end }}

{{/*
App release to be used by Sentry
*/}}
{{- define "radar-gateway.sentryRelease" -}}
{{- if .Values.sentry.service.release }}
{{- printf "%s" .Values.sentry.service.release -}}
{{- else -}}
{{- printf "%s" .Chart.AppVersion -}}
{{- end -}}
{{- end }}
