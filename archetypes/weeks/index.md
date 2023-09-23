---
{{- $parts := split .File.File.ContentBaseName "w" }}
{{- $year := int (index $parts 0) }}
{{- $week := int (index $parts 1) }}
title: '{{ $year }} Week {{ $week }}'
date: {{ .Date }}
pickem:
  year: {{ $year }}
  week: {{ $week }}
---
