{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}

{{- define "apache-nifi.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "apache-nifi.fullname" -}}
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
{{- define "apache-nifi.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
Set the service account name
*/}}
{{- define "apache-nifi.serviceAccountName" -}}
{{- if or .Values.sts.serviceAccount.create (eq .Values.properties.clusterStateProvider "kubernetes-provider")}}
{{- default (include "apache-nifi.fullname" .) .Values.sts.serviceAccount.name }}-sa
{{- else }}
{{- default "default" .Values.sts.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "registry.url" }}
{{- $port := .Values.registry.port | toString }}
{{- if .Values.registry.enabled -}}
{{- printf "http://%s-registry:%s" .Release.Name $port }}
{{- else -}}
{{- printf "http://%s:%s" .Values.registry.url $port }}
{{- end -}}
{{- end -}}


{{- define "zookeeper.url" }}
{{- $port := .Values.zookeeper.port | toString }}
{{- if .Values.zookeeper.enabled -}}
{{- printf "%s-zookeeper:%s" .Release.Name $port }}
{{- else -}}
{{- printf "%s:%s" .Values.zookeeper.url $port }}
{{- end -}}
{{- end -}}

{{/*
Form the Zookeeper Server part of the URL. If zookeeper is installed as part of this chart, use k8s service discovery,
else use user-provided server name
*/}}
{{- define "zookeeper.server" }}
{{- if .Values.zookeeper.enabled -}}
{{- printf "%s-zookeeper" .Release.Name }}
{{- else -}}
{{- printf "%s" .Values.zookeeper.url }}
{{- end -}}
{{- end -}}

{{/*
Create ca.server
*/}}
{{- define "ca.server" }}
{{- if .Values.ca.enabled -}}
{{- printf "%s-ca" .Release.Name }}
{{- else -}}
{{- printf "%s" .Values.ca.server }}
{{- end -}}
{{- end -}}
