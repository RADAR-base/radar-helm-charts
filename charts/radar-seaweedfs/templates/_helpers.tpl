{{- define "radar-seaweedfs.write-config" -}}
{"identities": [
{{- range $username, $fields := .Values.s3Config.identities }}
{{- $credentials := list $fields.credentials }}
{{- $actions := $fields.actions }}
{{- $user := dict "user" $username "credentials" $credentials  "actions" $actions }}
{{ $user | toJson }}
{{- end }}
]}
{{- end -}}
