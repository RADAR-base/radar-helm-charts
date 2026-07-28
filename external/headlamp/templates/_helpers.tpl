{{/*
Resolve the ServiceAccount name created by the upstream headlamp subchart, so
the extra read-only ClusterRoleBinding below binds the correct subject. This
mirrors the subchart's own fullname/serviceAccountName logic (chart name
"headlamp"), honouring headlamp.serviceAccount.name / nameOverride /
fullnameOverride overrides.
*/}}
{{- define "headlamp-overlay.serviceAccountName" -}}
{{- $h := .Values.headlamp | default dict -}}
{{- $sa := $h.serviceAccount | default dict -}}
{{- if $sa.name -}}
{{- $sa.name -}}
{{- else if $h.fullnameOverride -}}
{{- $h.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default "headlamp" $h.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}
