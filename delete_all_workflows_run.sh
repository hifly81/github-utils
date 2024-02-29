#!/bin/bash

source ./config

IFS=','
read -ra values <<< "$github_repo"

for value in "${values[@]}"; do
  workflow_runs=$(curl -s -H "Authorization: token $github_access_token" "https://api.github.com/repos/$github_owner/$value/actions/runs")

  echo "Repo:$value"
  echo "$workflow_runs" | jq -r '.total_count'

  ids=$(echo "$workflow_runs" | jq -r '.workflow_runs[].id')

  while IFS= read -r line; do
      curl -X DELETE -H "Authorization: token $github_access_token" "https://api.github.com/repos/$github_owner/$value/actions/runs/$line"
  done <<< "$ids"

  echo "All workflow runs deleted successfully for repo $value"

done
IFS=' '