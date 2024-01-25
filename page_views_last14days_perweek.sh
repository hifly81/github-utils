#!/bin/bash

source ./config

IFS=','
read -ra values <<< "$github_repo"

for value in "${values[@]}"; do
    echo "Read stats for repo:$value"
    echo ""
    curl -L \
      -H "Accept: application/vnd.github+json" \
      -H "Authorization: Bearer $github_access_token" \
      -H "X-GitHub-Api-Version: 2022-11-28" \
      https://api.github.com/repos/$github_owner/$value/traffic/views?per=week
done

IFS=' '