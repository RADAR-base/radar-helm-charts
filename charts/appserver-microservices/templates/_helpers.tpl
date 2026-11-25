{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "appserver-microservices.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "appserver-microservices.fullname" -}}
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
Compute a name for a specific microservice.
Usage:
  {{ include "appserver-microservices.serviceFullname" (dict "root" $root "serviceName" "api") }}
*/ -}}
{{- define "appserver-microservices.serviceFullname" -}}
{{- printf "%s-%s" (include "appserver-microservices.fullname" .root) .serviceName | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "appserver-microservices.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
Usage:
  metadata:
    labels:
{{ include "appserver-microservices.labels" (dict "root" $root "serviceName" "api") | indent 6 }}
This helper expects a dict with keys "root" (the Helm root context) and "serviceName".
*/}}
{{- define "appserver-microservices.labels" -}}
helm.sh/chart: {{ include "appserver-microservices.chart" .root | quote }}
{{ include "appserver-microservices.selectorLabels" . }}
{{- with .root }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
app.kubernetes.io/part-of: {{ include "appserver-microservices.name" . | quote }}
{{- end }}
app.kubernetes.io/component: {{ .serviceName | quote }}
{{- end }}

{{/*
Selector labels
Usage:
  {{ include "radar-appserver.selectorLabels" (dict "root" $root "serviceName" "api") }}
This helper expects the same dict structure used by the labels helper.
*/}}
{{- define "appserver-microservices.selectorLabels" -}}
app.kubernetes.io/name: {{ include "appserver-microservices.serviceFullname" . | quote }}
app.kubernetes.io/instance: {{ .root.Release.Name | quote }}
{{- end }}

{{/*
Create JavaOpts string
*/}}
{{- define "appserver-microservices.javaOpts" -}}
{{- .Values.global.javaOpts -}}
{{- end -}}
