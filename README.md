# nginx-basic-auth

[English](./README-en.md)

BASIC認証とリバースプロキシ機能を備えたNginxベースのDockerコンテナです。

環境変数でユーザー名、パスワード、プロキシターゲットを設定できます

## 特徴

- **ベーシック認証**: カスタマイズ可能なユーザー名とパスワードでアクセスを保護します。
- **リバースプロキシ**: 指定されたバックエンドサービスにリクエストを転送します。
- **環境変数設定**: 認証情報やプロキシターゲットを簡単に設定できます。

### コンテナの実行

コンテナを実行するには、認証およびプロキシ設定のために必要な環境変数（`BASIC_AUTH_USER`、`BASIC_AUTH_PASSWORD`、`PROXY_PASS_URL`）を指定します。

```bash
docker run -p 80:80 \
  -e BASIC_AUTH_USER="your_username" \
  -e BASIC_AUTH_PASSWORD="your_password" \
  -e PROXY_PASS_URL="http://your_backend_server" \
  ghcr.io/rassi0429/nginx-basic-auth:latest
```

```yml
services:
  app:
    image: your_app
  nginx-proxy:
    image: ghcr.io/rassi0429/nginx-basic-auth
    ports:
      - 80:80
    environment:
      - BASIC_AUTH_USER=user
      - BASIC_AUTH_PASSWORD=password
      - PROXY_PASS_URL=http://app:8080
```

### 環境変数

| 変数                | 説明                                           | 例                           |
|---------------------|----------------------------------------------|------------------------------|
| `BASIC_AUTH_USER`   | ベーシック認証のユーザー名                     | `admin`                      |
| `BASIC_AUTH_PASSWORD` | ベーシック認証のパスワード                      | `secret`                     |
| `PROXY_PASS_URL`    | リクエストをプロキシするバックエンドサービスのURL | `http://app:8080`      |

### 使用例

上記のコマンドでコンテナを起動した後、ブラウザで`http://localhost`を開きます。環境変数で設定したユーザー名とパスワードの入力を求められます。認証に成功すると、Nginxが`PROXY_PASS_URL`で指定されたバックエンドサービスにリクエストを転送します。

## ライセンス

このプロジェクトはMITライセンスの下でライセンスされています。詳細は[LICENSE](LICENSE)ファイルをご覧ください。

