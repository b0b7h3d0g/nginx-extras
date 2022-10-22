# nginx-extras

Official NGINX stable with additional packages

Quick Start
-----------

Create a docker compose file:

```yaml
version: '3.8'
services:
  nginx:
    container_name: nginx
    build:
      context: https://github.com/b0b7h3d0g/nginx-extras.git#main
      dockerfile: Dockerfile
    restart: unless-stopped
    command: "/bin/sh -c 'while :; do sleep 6h & wait $${!}; nginx -s reload; done & nginx -g \"daemon off;\"'"
    volumes:
      - ./html:/var/www/html:ro
      - ./conf:/etc/nginx/conf.d:ro
      - ./nginx.conf:/etc/nginx/nginx.conf:ro
      - /dev/urandom:/dev/random
    tmpfs:
      - /run
      - /var/cache/nginx
      - /var/lib/nginx
      - /tmp
    read_only: true
    network_mode: host
    extra_hosts:
      - "host.docker.internal:host-gateway"
```

Start with `docker-compose up -d --build` or `docker-compose build --pull && docker-compose up -d`
