#!/usr/bin/env bash

default_season="$(date +%Y)"
echo -n "Season [${default_season}]: "
read season
if [[ "${season}" = '' ]]; then
  season="${default_season}"
fi

echo -n "Week (e.g. 1, 2, 3): "
read week

file="weeks/${season}w$(printf '%02i' "${week}").md"

hugo new "${file}"
open "https://www.espn.com/nfl/schedule/_/week/${week}/year/${season}/"
nvim "content/${file}"
