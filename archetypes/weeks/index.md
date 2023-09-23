---
{{- $parts := split .File.File.ContentBaseName "w" }}
{{- $year := int (index $parts 0) }}
{{- $week := int (index $parts 1) }}
title: '{{ $year }} Week {{ $week }}'
date: {{ .Date }}

# See schedule at:
# <https://www.espn.com/nfl/schedule/_/week/{{ $week }}/year/{{ $year }}/>
pickem:
  year: {{ $year }}
  week: {{ $week }}
---
