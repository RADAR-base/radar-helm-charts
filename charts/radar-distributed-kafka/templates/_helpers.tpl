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
Return the Connect worker group id for a connector.
Each connector gets its own single-connector Connect cluster, so that a connector's
tasks can only be assigned to the replicas of its own Deployment. Pass
`dict "context" $root "connector" $connector "connectorId" $connectorId`.
An explicit `connector.groupId` overrides the derived value, which allows an
existing release to keep its previous group (and therefore its committed offsets).
*/}}
{{- define "radar-distributed-kafka.connectorGroupId" -}}
{{- if .connector.groupId -}}
{{- .connector.groupId -}}
{{- else -}}
{{- printf "%s-%s" (include "radar-distributed-kafka.fullname" .context) .connectorId -}}
{{- end -}}
{{- end -}}

{{/*
Replication factor for the Connect internal topics, capped at the number of brokers.
*/}}
{{- define "radar-distributed-kafka.internalTopicReplicationFactor" -}}
{{- min (int .Values.kafka_num_brokers) 3 -}}
{{- end -}}

{{/*
Return the final Connect config of a connector as JSON. `properties` and
`secretProperties` are merged, with `secretProperties` taking precedence, and the
chart-managed keys are set on top. Pass `dict "context" $root "connector" $connector`.
*/}}
{{- define "radar-distributed-kafka.connectorConfig" -}}
{{- $connector := .connector -}}
{{- $config := deepCopy ($connector.properties | default dict) -}}
{{- range $key, $value := ($connector.secretProperties | default dict) -}}
{{- $_ := set $config $key $value -}}
{{- end -}}
{{- $_ := set $config "kafka.topic" $connector.topic -}}
{{- $_ := set $config "connector.class" $connector.connectorClass -}}
{{- $_ := set $config "key.converter" $connector.keyConverter -}}
{{- $_ := set $config "value.converter" $connector.valueConverter -}}
{{- if and (contains "Avro" $connector.keyConverter) (not (hasKey $config "key.converter.schema.registry.url")) -}}
{{- $_ := set $config "key.converter.schema.registry.url" .context.Values.schemaRegistry.url -}}
{{- end -}}
{{- if and (contains "Avro" $connector.valueConverter) (not (hasKey $config "value.converter.schema.registry.url")) -}}
{{- $_ := set $config "value.converter.schema.registry.url" .context.Values.schemaRegistry.url -}}
{{- end -}}
{{- $_ := set $config "tasks.max" ($connector.maxTasks | toString) -}}
{{- $config | toJson -}}
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
