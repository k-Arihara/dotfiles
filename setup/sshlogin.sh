#!/bin/sh

# ログイン通知用スクリプト
# /etc/ssh/sshrcに以下を記述
# LOGIN_SH_DIR="このスクリプトまでのパス"
# LOGIN_SH/sshlogin.sh "$USER" "$SSH_CLIENT" "$HOSTNAME"

# WebHookUrl
WEBHOOKURL=

#Slack送信チャンネル
CHANNEL=${CHANNEL:-"#general"}

#Slack送信名
BOTNAME=${BOTNAME:-"bot_name"}

#Slackアイコン
FACEICON=${FACEICON:-":ghost:"}

#Slackメッセージ
MESSAGE=${MESSAGE:-"$1が$2から$3にログインしました"}

curl -s -S -X POST --data-urlencode "payload={\"channel\": \"${CHANNEL}\", \"username\": \"${BOTNAME}\", \"icon_emoji\": \"${FACEICON}\", \"text\": \"${MESSAGE}${WEBMESSAGE}\" }" ${WEBHOOKURL} >/dev/null
