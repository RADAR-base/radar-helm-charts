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
