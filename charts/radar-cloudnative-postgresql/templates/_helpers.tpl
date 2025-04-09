{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "radar-cloudnativepg-postgresql.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "radar-cloudnativepg-postgresql.fullname" -}}
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
{{- define "radar-cloudnativepg-postgresql.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "radar-cloudnativepg-postgresql.labels" -}}
app.kubernetes.io/name: {{ include "radar-cloudnativepg-postgresql.name" . }}
helm.sh/chart: {{ include "radar-cloudnativepg-postgresql.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Create a secret name which can be overridden.
*/}}
{{- define "radar-cloudnativepg-postgresql.secretname" -}}
{{- if .Values.secret.nameOverride -}}
{{- .Values.secret.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{ include "radar-cloudnativepg-postgresql.fullname" . }}
{{- end -}}
{{- end -}}

{{/*
Set value from existing secret if defined
I tried using "common.secrets.password.manage" but it gives errors on helm upgrades.
Arguments (dict):
- secret: the name of the secret
- key: the key in the secret
- contxt: global/root helm context
*/}}
{{- define "radar-cloudnativepg-postgresql.secret.value" -}}
{{- $secretObj := (lookup "v1" "Secret" .context.Release.Namespace .secret) | default dict }}
{{- $secretData := (get $secretObj "data") | default dict }}
{{- get $secretData .key | b64dec }}
{{- end -}}
