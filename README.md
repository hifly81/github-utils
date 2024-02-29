# Github utils

Github API Reference:

 - https://docs.github.com/en/rest
 - https://docs.github.com/en/rest/metrics/traffic
 - https://docs.github.com/en/rest/actions/workflow-runs

## How to use

Populate _config_ file with:

 - _github_access_token_: personal access token: To create one follow instructions at: https://github.com/settings/personal-access-tokens
 - _github_owner_: github handle where the repository exists
 - _github_repo_: github repositories (separated by ,) to fetch stats

example _config_ file:

```bash
github_access_token="XXXXXXXX"
github_owner="hifly81"
github_repo="kafka-examples,saga-pattern-demo"
```

### Page views

Get the total number of views and breakdown per day or week for the last 14 days. Timestamps are aligned to UTC midnight of the beginning of the day or week. Week begins on Monday.

Daily basis:

```bash
$ page_views_last14days.sh
```

Weekly basis:

```bash
$ page_views_last14days_perweek.sh
```

### Top referral sources

Get the top 10 referrers over the last 14 days.

```bash
$ top10_path_last14days.sh
```

### Top referral paths

Get the top 10 popular contents over the last 14 days.

```bash
$ top10_referrers_last14days.sh
```

### Delete Workflow Run

Utility to run a mass deletion of GitHub Actions workflow runs

```bash
$ delete_all_workflows_run.sh
```

## Telegram notifications

Script _telegram_notifications.sh_ will send a report with page views and top referral to your Telegram Bot Channel.

Populate _telegram_notifications.sh_ file with:

 - _BOT_TOKEN_: Telegram Bot Token
 - _CHAT_ID_: Telegram Bot Chat ID

```bash
$ telegram_notifications.sh
```

## Crontab

This example with _crontab_ will schedule the creation of a report with last 14 days pageviews every day at 2:30pm

```bash
30  14  *   *   *   ${SCRIPT_FOLDER}/page_views_last14days.sh >> ${OUTPUT_FOLDER}/"pageviews14days_$(date +\%Y-\%m-\%d).log"
```
