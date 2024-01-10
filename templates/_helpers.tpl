{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "universal-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "universal-chart.fullname" -}}
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

{{- define "universal-chart.chart" -}}
{{- printf "%s-%s-%s" .Chart.Name .Chart.Version .Chart.AppVersion | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{- define "universal-chart.labels" -}}
app.kubernetes.io/name: {{ .Release.Name | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
helm.sh/chart: {{ include "universal-chart.chart" . | quote }}
{{- end -}}

{{- define "universal-chart.disableNewrelicVars" }}
- name: NEW_RELIC_NO_CONFIG_FILE
  value: "true"
- name: NEW_RELIC_ENABLED
  value: "false"
{{- end -}}
