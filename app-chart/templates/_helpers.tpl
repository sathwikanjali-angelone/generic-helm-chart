{{/*
Expand the name of the chart.
*/}}
{{- define "app-chart.name" -}}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if gt (len $name) 63 }}
{{- fail "Chart name exceeds 63 characters. Please shorten nameOverride or chart name." }}
{{- end }}
{{- $name }}
{{- end }}

{{/*
Create a default fully qualified app name.
Fail if the name exceeds 63 characters instead of truncating.
*/}}
{{- define "app-chart.fullname" -}}
{{- if .Values.fullnameOverride }}
  {{- if gt (len .Values.fullnameOverride) 63 }}
  {{- fail "fullnameOverride exceeds 63 characters. Please shorten it." }}
  {{- end }}
{{- .Values.fullnameOverride }}
{{- else }}
  {{- $name := default .Chart.Name .Values.nameOverride }}
  {{- $fullname := printf "%s-%s" .Release.Name $name }}
  {{- if gt (len $fullname) 63 }}
  {{- fail "Generated fullname exceeds 63 characters. Please shorten release name or chart name." }}
  {{- end }}
{{- $fullname }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "app-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "app-chart.labels" -}}
helm.sh/chart: {{ include "app-chart.chart" . }}
{{ include "app-chart.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "app-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "app-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "app-chart.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "app-chart.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}