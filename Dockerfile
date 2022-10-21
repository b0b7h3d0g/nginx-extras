FROM nginx:stable

RUN apt-get update && apt-get install -y --no-install-recommends \
       nginx-extras \
    && rm -rf /var/lib/apt/lists/*
    
COPY --chown=nginx:nginx nginx.conf /etc/nginx/nginx.conf
