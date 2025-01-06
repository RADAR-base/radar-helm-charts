{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "radar-rest-sources-backend.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
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
Get the password secret.
*/}}
{{- define "radar-rest-sources-backend.secretName" -}}
{{- if .Values.existingSecret }}
    {{- printf "%s" .Values.existingSecret -}}
{{- else -}}
    {{- printf "%s" (include "radar-rest-sources-backend.fullname" .) -}}
{{- end -}}
{{- end -}}

{{/*
Return true if a secret object should be created
*/}}
{{- define "radar-rest-sources-backend.createSecret" -}}
{{- if .Values.existingSecret }}
{{- else if .Values.existingSecret -}}
{{- else -}}
    {{- true -}}
{{- end -}}
{{- end -}}

{{- define "radar-rest-sources-backend.enabledMapElementsAsList" -}}
{{- range $elemId, $elem := . -}}
{{- if eq (toString $elem.enable) "true" }}
{{ (list (omit $elem "enable")) | toYaml }}
{{- end -}}
{{- end -}}
{{ end -}}

{{/*
Service name to be used by Sentry
*/}}
{{- define "radar-rest-sources-backend.sentryName" -}}
{{- if .Values.sentry.service.name }}
{{- printf "%s" .Values.sentry.service.name -}}
{{- else -}}
{{- printf "%s" (include "radar-rest-sources-backend.fullname" .) -}}{{- end -}}
{{- end }}

{{/*
App release to be used by Sentry
*/}}
{{- define "radar-rest-sources-backend.sentryRelease" -}}
{{- if .Values.sentry.service.release }}
{{- printf "%s" .Values.sentry.service.release -}}
{{- else -}}
{{- printf "%s" .Chart.AppVersion -}}
{{- end -}}
{{- end }}
