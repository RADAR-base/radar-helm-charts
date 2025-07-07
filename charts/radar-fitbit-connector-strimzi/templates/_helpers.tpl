{{/*
Return the proper image name
*/}}
{{- define "radar-fitbit-connector.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.image "global" .Values.global "chart" .Chart ) }}
{{- end -}}
