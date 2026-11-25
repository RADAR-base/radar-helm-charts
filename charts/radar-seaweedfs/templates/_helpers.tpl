{{/*
Labels the SeaweedFS operator sets on all pods of this Seaweed cluster.
*/}}
{{- define "radar-seaweedfs.clusterPodLabels" -}}
app.kubernetes.io/name: seaweedfs
app.kubernetes.io/instance: {{ include "common.names.fullname" . }}
{{- end -}}

{{/*
Size of the PVC of a volume server in MiB. Supports Mi, Gi and Ti quantities.
*/}}
{{- define "radar-seaweedfs.volumeStorageMB" -}}
{{- $size := toString .Values.volume.storage.size -}}
{{- $mb := 0 -}}
{{- if hasSuffix "Ti" $size -}}
{{- $mb = mul (trimSuffix "Ti" $size | atoi) 1048576 -}}
{{- else if hasSuffix "Gi" $size -}}
{{- $mb = mul (trimSuffix "Gi" $size | atoi) 1024 -}}
{{- else if hasSuffix "Mi" $size -}}
{{- $mb = trimSuffix "Mi" $size | atoi -}}
{{- end -}}
{{- if le (int $mb) 0 -}}
{{- fail (printf "volume.storage.size %q must be a whole number of Mi, Gi or Ti" $size) -}}
{{- end -}}
{{- $mb -}}
{{- end -}}

{{/*
Maximum size of a volume in MiB: master.volumeSizeLimitMB, or else 90% of the volume server PVC divided over
volume.maxVolumes, so that the volume slots fit on the PVC. At most 30000 (the SeaweedFS default).
*/}}
{{- define "radar-seaweedfs.volumeSizeLimitMB" -}}
{{- if .Values.master.volumeSizeLimitMB -}}
{{- .Values.master.volumeSizeLimitMB -}}
{{- else -}}
{{- $limit := div (mul (include "radar-seaweedfs.volumeStorageMB" . | int) 9) (mul 10 (int .Values.volume.maxVolumes)) -}}
{{- if lt (int $limit) 1 -}}
{{- fail "volume.storage.size is too small for volume.maxVolumes" -}}
{{- end -}}
{{- min $limit 30000 -}}
{{- end -}}
{{- end -}}

{{/*
S3 identity configuration (s3_config.json) for the S3 gateways.
*/}}
{{- define "radar-seaweedfs.s3Config" -}}
{{- $identities := list }}
{{- range $name, $identity := .Values.s3.identities }}
{{- $accessKey := required (printf "s3.identities.%s.credentials.accessKey is required" $name) (dig "credentials" "accessKey" "" $identity) }}
{{- $secretKey := required (printf "s3.identities.%s.credentials.secretKey is required" $name) (dig "credentials" "secretKey" "" $identity) }}
{{- $credentials := list (dict "accessKey" $accessKey "secretKey" $secretKey) }}
{{- $identities = append $identities (dict "name" $name "credentials" $credentials "actions" $identity.actions) }}
{{- end }}
{{- if not $identities }}
{{- fail "s3.identities must contain at least one identity, otherwise SeaweedFS allows anonymous access" }}
{{- end }}
{{- dict "identities" $identities | toJson }}
{{- end -}}

{{/*
Ingress spec for a SeaweedFS component (filer S3 API or admin UI).
Usage: include "radar-seaweedfs.ingress" (dict "ingress" .Values.s3.ingress "tlsSecret" "name" "context" $)
*/}}
{{- define "radar-seaweedfs.ingress" -}}
{{- $ingress := .ingress -}}
enabled: true
className: {{ $ingress.className | quote }}
host: {{ required "ingress host is required when the ingress is enabled" $ingress.host | quote }}
{{- with $ingress.annotations }}
annotations: {{- toYaml . | nindent 2 }}
{{- end }}
{{- if $ingress.tls }}
tls:
  - hosts:
      - {{ $ingress.host | quote }}
    secretName: {{ .tlsSecret }}
{{- end }}
{{- end -}}
