{{/* Generate LavinMQ configuration file */}}
{{- define "lavinmq.config" -}}
[main]
{{- range $key, $value := .Values.config.main }}
{{ $key }} = {{ $value }}
{{- end }}

[mgmt]
{{- range $key, $value := .Values.config.mgmt }}
{{ $key }} = {{ $value }}
{{- end }}

[amqp]
{{- range $key, $value := .Values.config.amqp }}
{{ $key }} = {{ $value }}
{{- end }}

[clustering]
{{- range $key, $value := .Values.config.clustering }}
{{ $key }} = {{ $value }}
{{- end }}
{{- end }}

{{/* Common labels */}}
{{- define "lavinmq.labels" -}}
app.kubernetes.io/name: lavinmq
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/component: servicebus
app.kubernetes.io/part-of: lavinmq-stack
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/* Selector labels */}}
{{- define "lavinmq.selectorLabels" -}}
app.kubernetes.io/name: lavinmq
{{- end }}

{{/* Service Annotations */}}
{{- define "lavinmq.service.annotations" -}}
{{- if .Values.annotations.service }}
{{- toYaml .Values.annotations.service }}
{{- end }}
{{- end }}

{{/* Service Annotations */}}
{{- define "lavinmq.statefulset.annotations" -}}
{{- if .Values.annotations.statefulset }}
annotations:
  {{- toYaml .Values.annotations.statefulset | nindent 4 }}
{{- end }}
{{- end }}

{{/* Image Pull Secrets */}}
{{- define "lavinmq.imagePullSecrets" -}}
{{- if .Values.image.pullSecrets }}
imagePullSecrets:
  {{- range .Values.image.pullSecrets }}
  - name: {{ . }}
  {{- end }}
{{- end }}
{{- end }}

{{/* Resource Requests and Limits */}}
{{- define "lavinmq.resources" -}}
resources:
  requests:
    memory: {{ .Values.resources.requests.memory }}
    cpu: {{ .Values.resources.requests.cpu }}
  limits:
    memory: {{ .Values.resources.limits.memory }}
    cpu: {{ .Values.resources.limits.cpu }}
{{- end }}

{{/* Termination Grace Period */}}
{{- define "lavinmq.terminationGracePeriod" -}}
{{ .Values.terminationGracePeriod | default 600 }}
{{- end }}

{{/* Extra Containers */}}
{{- define "lavinmq.extraContainers" -}}
{{- if .Values.extraContainers }}
{{ toYaml .Values.extraContainers | nindent 8 }}
{{- end }}
{{- end }}

{{/* Additional Environment Variables */}}
{{- define "lavinmq.extraEnv" -}}
{{- if .Values.extraEnv }}
{{ toYaml .Values.extraEnv | nindent 8 }}
{{- end }}
{{- end }}

{{/* ServiceAccount Name */}}
{{- define "lavinmq.serviceAccountName" -}}
{{- if .Values.serviceAccount.name }}
{{ .Values.serviceAccount.name }}
{{- else }}
{{- printf "%s-lavinmq" (.Release.Name | default "release-name") -}}
{{- end }}
{{- end }}

