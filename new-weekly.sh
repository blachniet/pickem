#!/usr/bin/env bash

default_season="$(date +%Y)"
echo -n "Season [${default_season}]: "
read season
if [[ "${season}" = '' ]]; then
  season="${default_season}"
fi

echo -n "Week (e.g. 1, 2, 3): "
read week

bundle="weeks/${season}w$(printf '%02i' "${week}")"

hugo new "${bundle}"
open "https://www.espn.com/nfl/schedule/_/week/${week}/year/${season}/"
nvim "content/${bundle}/index.md"
