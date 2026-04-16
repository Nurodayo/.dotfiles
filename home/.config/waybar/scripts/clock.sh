#!/bin/bash
# Get weekday (0=Sunday, ..., 6=Saturday)
weekday=$(date +%w)
# Map to Japanese day
japanese_days=("日" "月" "火" "水" "木" "金" "土")
japanese_day=${japanese_days[$weekday]}

# Get day, month, year, time
day=$(date +%-d)
month=$(date +%-m)
year=$(date +%y)
time=$(date +%H)
minute=$(date +%M)

# Output format: 火 17日 5月 '25年 - 14時 42分
echo "${day}日($japanese_day) ${month}月 $year年 ${time}時${minute}分"
