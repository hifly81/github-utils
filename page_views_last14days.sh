#!/bin/bash

source ./config

curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $github_access_token" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/$github_owner/$github_repo/traffic/views
