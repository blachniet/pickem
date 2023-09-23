---
{{- $parts := split .File.File.ContentBaseName "w" }}
{{- $season := int (index $parts 0) }}
{{- $week := int (index $parts 1) }}
title: 'Week {{ $week }} ({{ $season }} Season)'
date: {{ .Date }}

# See schedule at:
# <https://www.espn.com/nfl/schedule/_/week/{{ $week }}/year/{{ $season }}/>
pickemSeason: {{ $season }}
pickemWeek: {{ $week }}
---
