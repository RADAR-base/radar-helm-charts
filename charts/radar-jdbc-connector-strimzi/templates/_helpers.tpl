{{/*
Return the proper image name
*/}}
{{- define "radar-jdbc-connector.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.image "global" .Values.global "chart" .Chart ) }}
{{- end -}}

{{/*
Get the name of the secret object.
*/}}
{{- define "radar-jdbc-connector.secretName" -}}
{{- $useCloudnative := .context.Values.timescaledb.enabled }}
{{- $suffix := ternary "-app" "" $useCloudnative }}
{{- $fullName := ternary (.context.Values.timescaledb.cluster.fullnameOverride) (include "common.names.fullname" .context) $useCloudnative }}
{{- $fullSecretName := print $fullName $suffix }}
{{- if (eq .type "user") }}
    {{- .context.Values.jdbc.userSecret.name | default $fullSecretName }}
{{- else if (eq .type "password") }}
    {{- .context.Values.jdbc.passwordSecret.name | default $fullSecretName }}
{{- else if (eq .type "url") }}
    {{- .context.Values.jdbc.urlSecret.name | default $fullSecretName }}
{{- end -}}
{{- end -}}

{{/*
Get the key for the secret object.
*/}}
{{- define "radar-jdbc-connector.secretKey" -}}
{{- $useCloudnative := .context.Values.timescaledb.enabled }}
{{- if (eq .type "user") }}
    {{- if $useCloudnative }}
        {{- "username" }}
    {{- else }}
        {{ .context.Values.jdbc.userSecret.key | default "databaseUser" }}
    {{- end }}
{{- else if (eq .type "password") }}
    {{- if $useCloudnative }}
        {{- "password" }}
    {{- else }}
        {{ .context.Values.jdbc.passwordSecret.key | default "databasePassword" }}
    {{- end }}
{{- else if (eq .type "url") }}
    {{- if $useCloudnative }}
        {{- "jdbc-uri" }}
    {{- else }}
        {{ .context.Values.jdbc.urlSecret.key | default "databaseUrl" }}
    {{- end }}
{{- end }}
{{- end -}}

{{/*
Get the database url. Has to be created before the secret is created.
*/}}
{{- define "radar-jdbc-connector.databaseUrl" -}}
{{- $useCloudnative := .Values.timescaledb.enabled }}
{{- $port := .Values.jdbc.port | default 5432 }}
{{- if $useCloudnative -}}
    {{- include "radar-jdbc-connector.cloudnativeDatabaseUrl" . -}}
{{- else if .Values.jdbc.urlSecret.name -}}
   {{- print include "common.secrets.lookup" (dict "secret" .Values.jdbc.urlSecret.name "key" .Values.jdbc.urlSecret.key "default") -}}
{{- else -}}
    {{- .Values.jdbc.url -}}
{{- end -}}
{{- end -}}

{{/*
Construct the Cloudnative-PG database URL
*/}}
{{- define "radar-jdbc-connector.cloudnativeDatabaseUrl" -}}
{{- $port := .Values.jdbc.port | default 5432 }}
{{- $dbConfig := .Values.timescaledb.cluster }}
{{- $dbname := $dbConfig.cluster.initdb.database | default "postgres" }}
{{- $override := $dbConfig.nameOverride | default "cluster" }}
{{- $dbServiceName :=  $dbConfig.fullnameOverride | default (printf "%s-%s" .Release.Name $override) -}}
{{- printf "jdbc:postgresql://%s-rw.default:%d/%s" $dbServiceName $port $dbname -}}
{{- end -}}
