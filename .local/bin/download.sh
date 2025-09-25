#!/usr/bin/env bash

URL="$1";
while true; do
  curl --retry 4 --retry-delay 4 --connect-timeout 30 -C - --show-error -O "$URL" && {
    echo "Download finished successfully.";
    break;
  }
  
  echo "Download interrupt, retrying after 4 seconds...";
  sleep 4;
done;
