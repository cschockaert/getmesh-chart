{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "getmesh.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "getmesh.fullname" -}}
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


{{/*
Create a default fully qualified app name. WITHOUT override
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "getmesh.fullname.no.override" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "getmesh.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{- define "getmesh.host" -}}
{{- printf "%s.%s.%s" .Chart.Name .Release.Name .Values.global.domain | trimSuffix "-" -}}
{{- end -}}

{{- define "getmesh.host-replicas" -}}
{{- printf "%s-replicas.%s.%s" .Chart.Name .Release.Name .Values.global.domain | trimSuffix "-" -}}
{{- end -}}

{{- define "getmesh.host-backup-explorer" -}}
{{- printf "%s-backup-explorer.%s.%s" .Chart.Name .Release.Name .Values.global.domain | trimSuffix "-" -}}
{{- end -}}

{{- define "getmesh.host-internal" -}}
{{- printf "%s.%s.internal.%s" .Chart.Name .Release.Name .Values.global.domain | trimSuffix "-" -}}
{{- end -}}

{{- define "getmesh.version.slug" -}}
{{- printf "%s" .Values.image.tag | replace "." "-" -}}
{{- end -}}

{{- define "certificate.fullname" -}}
{{- printf "%s.%s-tls" .Release.Name .Values.global.domain | trimSuffix "-" -}}
{{- end -}}

# in this particuliar case (persistance without nfs) we use getmesh-data-master to store uploads

{{- define "getmesh.nfs.name" -}}
{{- if and (eq .Values.persistence.nfs.enabled false) (eq .Values.persistence.enabled true) -}}
getmesh-data-master
{{- else -}}
getmesh-uploads
{{- end -}}
{{- end -}}