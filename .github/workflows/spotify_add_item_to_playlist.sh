#!/usr/bin/env bash

# シークレット
#CLIENT_ID=**********
#CLIENT_SECRET=**********
#PLAYLIST_ID=**********
#REFRESH_TOKEN=**********
CREDENTIAL=`echo -n "${CLIENT_ID}:${CLIENT_SECRET}" | base64 -w0`

# アクセストークン発行
RESPONSE=`curl --silent \
               --url https://accounts.spotify.com/api/token \
               --header 'Content-Type: application/x-www-form-urlencoded' \
               --header "Authorization: Basic ${CREDENTIAL}" \
               --data "grant_type=refresh_token&refresh_token=${REFRESH_TOKEN}"`
echo ${RESPONSE}
ACCESS_TOKEN=`echo ${RESPONSE} | grep -Eo '"access_token":[^"]*"[^"]*"' | grep -Eo ':[^"]*"[^"]*"' | grep -Eo '"[^"]*"' | sed -e 's/"//g'`

# 追加したい曲
TRACK=spotify:track:1yt4wO7dKCwsfjch8SN9aU

# プレイリストへ曲を追加
RESPONSE=`curl --silent \
               --request POST \
               --url https://api.spotify.com/v1/playlists/${PLAYLIST_ID}/tracks \
               --header 'Content-Type: application/json' \
               --header "Authorization: Bearer ${ACCESS_TOKEN}" \
               --data "{\"uris\":[\"${TRACK}\"]}"`
echo ${RESPONSE}
