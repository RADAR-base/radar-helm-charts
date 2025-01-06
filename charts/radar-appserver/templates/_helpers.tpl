{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "radar-appserver.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return the proper image name
*/}}
{{- define "radar-appserver.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.image "global" .Values.global "chart" .Chart ) }}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "radar-appserver.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.image) "global" .Values.global) -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "radar-appserver.fullname" -}}
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
Create chart name and version as used by the chart label.
*/}}
{{- define "radar-appserver.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Get the password secret.
*/}}
{{- define "radar-appserver.secretName" -}}
{{- if .Values.existingSecret }}
    {{- printf "%s" .Values.existingSecret -}}
{{- else -}}
    {{- printf "%s" (include "radar-appserver.fullname" .) -}}
{{- end -}}
{{- end -}}

{{/*
Return true if a secret object should be created
*/}}
{{- define "radar-appserver.createSecret" -}}
{{- if .Values.existingSecret }}
{{- else if .Values.existingSecret -}}
{{- else -}}
    {{- true -}}
{{- end -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "radar-appserver.labels" -}}
helm.sh/chart: {{ include "radar-appserver.chart" . }}
{{ include "radar-appserver.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "radar-appserver.selectorLabels" -}}
app.kubernetes.io/name: {{ include "radar-appserver.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Service name to be used by Sentry
*/}}
{{- define "radar-appserver.sentryName" -}}
{{- printf "%s" (include "radar-appserver.fullname" .) -}}
{{- end -}}

{{/*
App release to be used by Sentry
*/}}
{{- define "radar-appserver.sentryRelease" -}}
{{- printf "%s" .Chart.AppVersion -}}
{{- end -}}
