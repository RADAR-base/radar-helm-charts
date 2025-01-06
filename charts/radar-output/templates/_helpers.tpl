{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "radar-output.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return the proper image name
*/}}
{{- define "radar-output.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.image "global" .Values.global "chart" .Chart ) }}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "radar-output.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.image) "global" .Values.global) -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "radar-output.fullname" -}}
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
Get the password secret.
*/}}
{{- define "radar-output.secretName" -}}
{{- if .Values.existingSecret }}
    {{- printf "%s" .Values.existingSecret -}}
{{- else -}}
    {{- printf "%s" (include "radar-output.fullname" .) -}}
{{- end -}}
{{- end -}}

{{/*
Return true if a secret object should be created
*/}}
{{- define "radar-output.createSecret" -}}
{{- if .Values.existingSecret }}
{{- else if .Values.existingSecret -}}
{{- else -}}
    {{- true -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "radar-output.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "radar-output.labels" -}}
helm.sh/chart: {{ include "radar-output.chart" . }}
{{ include "radar-output.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "radar-output.selectorLabels" -}}
app.kubernetes.io/name: {{ include "radar-output.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Service name to be used by Sentry
*/}}
{{- define "radar-output.sentryName" -}}
{{- printf "%s" (include "radar-output.fullname" .) -}}
{{- end -}}

{{/*
App release to be used by Sentry
*/}}
{{- define "radar-output.sentryRelease" -}}
{{- printf "%s" .Chart.AppVersion -}}
{{- end -}}
