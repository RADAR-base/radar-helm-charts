{{/*
Create a secret name which can be overridden.
*/}}
{{- define "radar-nifi.secretname" -}}
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
{{- define "radar-nifi.secret.value" -}}
{{- $secretObj := (lookup "v1" "Secret" .context.Release.Namespace .secret) | default dict }}
{{- $secretData := (get $secretObj "data") | default dict }}
{{- get $secretData .key | b64dec }}
{{- end -}}
