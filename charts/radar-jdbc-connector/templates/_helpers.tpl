{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "radar-jdbc-connector.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

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
Service name to be used by Sentry
*/}}
{{- define "radar-jdbc-connector.sentryName" -}}
{{- if .Values.sentry.service.name }}
{{- printf "%s" .Values.sentry.service.name -}}
{{- else -}}
{{- printf "%s" (include "radar-jdbc-connector.fullname" .) -}}{{- end -}}
{{- end }}

{{/*
App release to be used by Sentry
*/}}
{{- define "radar-jdbc-connector.sentryRelease" -}}
{{- if .Values.sentry.service.release }}
{{- printf "%s" .Values.sentry.service.release -}}
{{- else -}}
{{- printf "%s" .Chart.AppVersion -}}
{{- end -}}
{{- end }}
