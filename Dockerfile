FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get upgrade -y && \
    DEBIAN_FRONTEND="noninteractive" apt-get -y install --no-install-recommends nginx nginx-extras && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

COPY --chown=nginx:nginx nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
