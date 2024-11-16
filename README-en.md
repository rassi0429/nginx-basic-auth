

# nginx-basic-auth

This project is an Nginx-based Docker container with Basic Authentication and reverse proxy capabilities. It allows users to set a username, password, and proxy target through environment variables, making it ideal for securing access to backend services.

## Features

- **Basic Authentication**: Protects access with a customizable username and password.
- **Reverse Proxy**: Forwards requests to a specified backend service.
- **Environment Variable Configuration**: Easily configure authentication credentials and proxy target.

### Running the Container

To run the container, specify the required environment variables (`BASIC_AUTH_USER`, `BASIC_AUTH_PASSWORD`, `PROXY_PASS_URL`) for authentication and proxy configuration.

```bash
docker run -p 80:80 \
  -e BASIC_AUTH_USER="your_username" \
  -e BASIC_AUTH_PASSWORD="your_password" \
  -e PROXY_PASS_URL="http://your_backend_server" \
  ghcr.io/YOUR_GITHUB_USERNAME/my-nginx-auth-project:latest
```

```yml
services:
  app:
    image: your_app
  nginx-proxy:
    image: nginx-basic-auth
    ports:
      - 80:80
    environment:
      - BASIC_AUTH_USER=resonite
      - BASIC_AUTH_PASSWORD=uni-pocket-love
      - PROXY_PASS_URL=http://your_app:8080
```

### Environment Variables

| Variable            | Description                                     | Example                      |
|---------------------|-------------------------------------------------|------------------------------|
| `BASIC_AUTH_USER`   | Username for Basic Authentication               | `admin`                      |
| `BASIC_AUTH_PASSWORD` | Password for Basic Authentication               | `secret`                     |
| `PROXY_PASS_URL`    | URL of the backend service to proxy requests to | `http://app:8080`      |

### Usage Example

After starting the container with the above command, open `http://localhost` in your browser. You should be prompted to enter the username and password set by the environment variables. Upon successful authentication, Nginx will forward requests to the backend service specified in `PROXY_PASS_URL`.


## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
