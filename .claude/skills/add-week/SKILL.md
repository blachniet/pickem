---
name: add-week
description: Create a new NFL weekly pick'em sheet page (content/weeks/<year>w<week>.md) by looking up that week's schedule from two independent sources and cross-checking them. Use when the user asks to add/create a page for a given NFL week and season, e.g. "add 2026 week 4" or "create the page for next week".
---

# Add a weekly pick'em page

Creates a new `content/weeks/<year>w<week>.md` page for one NFL week, with the
matchups filled in and verified against two sources.

## Inputs

Determine `<year>` and `<week>` from the user's request. If ambiguous or not
given, ask before proceeding.

## Steps

1. **Look up the schedule from two independent sources and cross-check them.**
   Never rely on a single source — ESPN and NFL.com have disagreed before.
   - ESPN: `WebFetch` on
     `https://www.espn.com/nfl/schedule/_/week/<week>/year/<year>/seasontype/2`
     asking for every game in order with day of week, away team, and home team.
   - NFL.com: `WebFetch` on
     `https://www.nfl.com/schedules/<year>/by-week/week-<week>`, same prompt.
   - Compare the two lists. They must agree on every matchup, home/away
     assignment, and day. If they don't, stop and tell the user the
     discrepancy instead of guessing.

2. **Scaffold the file from the archetype.**
   ```
   hugo new content/weeks/<year>w<week, zero-padded to 2 digits>.md
   ```
   This fills in `title`, `date`, `pickemSeason` (quoted string — see
   `archetypes/weeks.md`), and `pickemWeek` (plain int, used for numeric
   sorting on the homepage — do not quote it).

3. **Fill in `pickemSchedule`.**
   Group games under `day: thu` / `day: sun` / `day: mon` (the convention
   used by every existing week — add another day group only if the real
   schedule needs it, e.g. a Saturday game). Each game is:
   ```yaml
   - away: <abbr>
     home: <abbr>
   ```
   Use the team keys defined in `data/teams.yaml` for `<abbr>`. Note New
   Orleans' key is the YAML-reserved word `no`, so it must be quoted:
   `away: 'no'` / `home: 'no'`.

4. **Build and verify locally.**
   ```
   hugo --minify -d /tmp/pickem_verify
   ```
   Check the new week's page (`/tmp/pickem_verify/weeks/<year>w<week>/index.html`)
   renders all games with team names/logos, and that the new week's link
   shows up in `index.html`'s season list. Then remove the temp build dir.

5. **Commit.**
   Stage just the new content file and commit with a terse message like
   `Add <year> week <week>`. Don't push unless asked.
