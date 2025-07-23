{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "nifikop.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "nifikop.fullname" -}}
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
Return the appropriate apiVersion value to use for the capi-operator managed k8s resources
*/}}
{{- define "nifikop.apiVersion" -}}
{{- printf "%s" "nificlusters.nifi.konpyutaika.com/v1" -}}
{{- end -}}

{{- define "userdefined.labels" }}
{{ if .Values.labels }}
{{- with .Values.labels }}
{{- toYaml . | nindent 4 }}
{{- end}}
{{- end}}
{{- end }}

{{- define "userdefined.annotations" }}
{{ if .Values.annotations }}
{{- with .Values.annotations }}
{{- toYaml . | nindent 4 }}
{{- end}}
{{- end}}
{{- end }}


{{- define "webhook.service.name" -}}
{{- $name := default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- printf "%s-webhook" $name -}}
{{- end -}}

{{- define "webhook.secret.name" -}}
{{- $name := default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- printf "%s-webhook-server-cert" $name -}}
{{- end -}}

{{- define "webhook.certificate.name" -}}
{{- $name := default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- printf "%s-webhook-cert" $name -}}
{{- end -}}