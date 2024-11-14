FROM nginx:alpine

# 必要なツールをインストール (htpasswdを生成するため)
RUN apk --no-cache add apache2-utils

# エントリーポイントスクリプトをコピー
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# nginxのテンプレート設定ファイルをコピー
COPY nginx.conf.template /etc/nginx/nginx.conf.template

# 必要なポートを開放
EXPOSE 80

# エントリーポイントスクリプトを実行
ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
