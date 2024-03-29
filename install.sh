#!/bin/sh
echo "running npm install"
npm i
if [ $? -eq 0 ]; then
  echo "running npm run build..."
  npm run build
  if [ $? -eq 0 ]; then
    echo "npm build successful"
    echo "making web files directory"
    mkdir -p /var/www/html/finesse-forwarder
    echo "removing old web files"
    rm -rf /var/www/html/finesse-forwarder/*
    echo "copying new web files"
    cp -rf dist/* /var/www/html/finesse-forwarder/
    echo "web files copied. You may still need to add an entry for nginx to point to this folder."
    echo "and it would be nice to have a cron job to keep this repo updated."
  else
    echo "npm failed to run build script"
  fi
else
  echo "failed npm install"
fi
