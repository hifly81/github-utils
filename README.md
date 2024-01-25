# Github traffic stats

Github API Reference:
https://docs.github.com/en/rest/metrics/traffic

## How to use

Populate _config_ file with:

 - _github_access_token_: personal access token: To create one follow instructions at: https://github.com/settings/personal-access-tokens
 - _github_owner_: github handle where the repository exists
 - _github_repo_: github repositories (separated by ,) to fetch stats

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

## Crontab

```bash
38  14  *   *   *   ${SCRIPT_FOLDER}/page_views_last14days.sh >> ${OUTPUT_FOLDER}/"pageviews14days_$(date +\%Y-\%m-\%d).log"
```
