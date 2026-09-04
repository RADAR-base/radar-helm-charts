{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "radar-distributed-kafka.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return the proper image name
*/}}
{{- define "radar-distributed-kafka.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.image "global" .Values.global "chart" .Chart ) }}
{{- end -}}

{{/*
Return the plugin installer image, defaulting to the main connector image.
*/}}
{{- define "radar-distributed-kafka.pluginInstallerImage" -}}
{{- $pluginImage := mergeOverwrite (dict) .Values.image (.Values.pluginInstallation.initContainerImage | default dict) -}}
{{ include "common.images.image" (dict "imageRoot" $pluginImage "global" .Values.global "chart" .Chart ) }}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "radar-distributed-kafka.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.image) "global" .Values.global) -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "radar-distributed-kafka.fullname" -}}
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
Sanitize connector id for names and file paths.
*/}}
{{- define "radar-distributed-kafka.connectorId" -}}
{{- $raw := . | toString | lower -}}
{{- $clean := regexReplaceAll "[^a-z0-9-]" $raw "-" -}}
{{- $trimmed := trimAll "-" $clean -}}
{{- if $trimmed -}}
{{- $trimmed | trunc 40 | trimSuffix "-" -}}
{{- else -}}
connector
{{- end -}}
{{- end -}}
