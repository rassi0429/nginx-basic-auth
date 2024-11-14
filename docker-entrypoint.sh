#!/bin/sh

# 環境変数が設定されているか確認
if [ -z "$BASIC_AUTH_USER" ] || [ -z "$BASIC_AUTH_PASSWORD" ] || [ -z "$PROXY_PASS_URL" ]; then
  echo "Needs environment BASIC_AUTH_USER, BASIC_AUTH_PASSWORD, PROXY_PASS_URL"
  exit 1
fi

# Basic認証のパスワードファイルを生成
htpasswd -cb /etc/nginx/.htpasswd "$BASIC_AUTH_USER" "$BASIC_AUTH_PASSWORD"

# nginx設定ファイルをテンプレートから生成
envsubst '$PROXY_PASS_URL' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

# nginxを実行
exec "$@"
