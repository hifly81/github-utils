#!/bin/bash

BOT_TOKEN=<TELEGRAM_BOT_TOKEN>
CHAT_ID=<TELEGRAM_CHAT_ID>
date_var="$(date +\%Y-\%m-\%d)"

page_views=$(./page_views_last14days_perweek.sh)
page_path=./page_views_last14days_perweek_$date_var.log
echo $page_views >> $page_path

echo "Send gh: page views"
curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendDocument" \
 -F "chat_id=$CHAT_ID" \
 -F "document=@$page_path" \
 -F "caption=gh: page views"

top10_paths=$(./top10_path_last14days.sh)
top10_paths_path=./top10_path_last14days_$date_var.log
echo $top10_paths >> $top10_paths_path

echo "Send gh: top10 paths"
curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendDocument" \
 -F "chat_id=$CHAT_ID" \
 -F "document=@$top10_paths_path" \
 -F "caption=gh: top10 paths"

top10_ref=$(./top10_referrers_last14days.sh)
top10_ref_path=./top10_referrers_last14days_$date_var.log
echo $top10_ref >> $top10_ref_path

echo "Send gh: top10 referrers"
curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendDocument" \
  -F "chat_id=$CHAT_ID" \
  -F "document=@$top10_ref_path" \
  -F "caption=gh: top10 referrers"
