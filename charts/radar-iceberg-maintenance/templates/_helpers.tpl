{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "radar-iceberg-maintenance.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "radar-iceberg-maintenance.fullname" -}}
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
Image reference.
*/}}
{{- define "radar-iceberg-maintenance.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.image "global" .Values.global "chart" .Chart ) }}
{{- end -}}

{{- define "radar-iceberg-maintenance.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.image) "global" .Values.global) -}}
{{- end -}}

{{/*
A CronJob for one maintenance chore.

Arguments (dict):
  context   root context
  name      short chore name, used in the resource name
  schedule  cron expression
  sql       SQL to run per table, with __TABLE__ replaced by the quoted table name
*/}}
{{- define "radar-iceberg-maintenance.cronjob" -}}
{{- $root := .context -}}
apiVersion: batch/v1
kind: CronJob
metadata:
  name: {{ include "radar-iceberg-maintenance.fullname" $root }}-{{ .name }}
  namespace: {{ include "common.names.namespace" $root | quote }}
  labels: {{- include "common.labels.standard" ( dict "customLabels" $root.Values.commonLabels "context" $root ) | nindent 4 }}
    app.kubernetes.io/component: {{ .name }}
  {{- if $root.Values.commonAnnotations }}
  annotations: {{- include "common.tplvalues.render" ( dict "value" $root.Values.commonAnnotations "context" $root ) | nindent 4 }}
  {{- end }}
spec:
  schedule: {{ .schedule | quote }}
  concurrencyPolicy: {{ $root.Values.concurrencyPolicy }}
  startingDeadlineSeconds: {{ $root.Values.startingDeadlineSeconds }}
  successfulJobsHistoryLimit: {{ $root.Values.successfulJobsHistoryLimit }}
  failedJobsHistoryLimit: {{ $root.Values.failedJobsHistoryLimit }}
  jobTemplate:
    spec:
      backoffLimit: {{ $root.Values.backoffLimit }}
      template:
        metadata:
          labels: {{- include "common.labels.standard" ( dict "customLabels" $root.Values.commonLabels "context" $root ) | nindent 12 }}
            app.kubernetes.io/component: {{ .name }}
        spec:
          {{- include "radar-iceberg-maintenance.imagePullSecrets" $root | nindent 10 }}
          restartPolicy: OnFailure
          containers:
            - name: {{ .name }}
              image: {{ include "radar-iceberg-maintenance.image" $root }}
              imagePullPolicy: {{ $root.Values.image.pullPolicy | quote }}
              command: ["/bin/sh", "/scripts/run-maintenance.sh"]
              env:
                - name: CHORE
                  value: {{ .name | quote }}
                - name: SQL_TEMPLATE
                  value: {{ .sql | quote }}
                - name: TRINO_URL
                  value: {{ $root.Values.trino.url | quote }}
                - name: TRINO_CATALOG
                  value: {{ $root.Values.trino.catalog | quote }}
                - name: TRINO_SCHEMA
                  value: {{ $root.Values.trino.schema | quote }}
                - name: TRINO_USER
                  value: {{ $root.Values.trino.user | quote }}
                {{- if $root.Values.trino.passwordSecret.name }}
                - name: TRINO_PASSWORD
                  valueFrom:
                    secretKeyRef:
                      name: {{ $root.Values.trino.passwordSecret.name }}
                      key: {{ $root.Values.trino.passwordSecret.key }}
                {{- end }}
                - name: TABLES
                  value: {{ join " " $root.Values.tables | quote }}
              resources:
                {{- toYaml $root.Values.resources | nindent 16 }}
              volumeMounts:
                - name: scripts
                  mountPath: /scripts
          volumes:
            - name: scripts
              configMap:
                name: {{ include "radar-iceberg-maintenance.fullname" $root }}
          {{- with $root.Values.nodeSelector }}
          nodeSelector:
            {{- toYaml . | nindent 12 }}
          {{- end }}
          {{- with $root.Values.affinity }}
          affinity:
            {{- toYaml . | nindent 12 }}
          {{- end }}
          {{- with $root.Values.tolerations }}
          tolerations:
            {{- toYaml . | nindent 12 }}
          {{- end }}
{{- end -}}
