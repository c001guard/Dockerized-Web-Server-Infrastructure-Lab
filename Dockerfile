FROM debian:13-slim

LABEL maintainer="ivoryros"
LABEL description="Secure nginx + fcgi container for Dockle clean scan"

RUN apt-get update && apt-get install -y --no-install-recommends \
    nginx \
    spawn-fcgi \
    libfcgi0ldbl \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd -r appgroup && useradd -r -g appgroup -s /usr/sbin/nologin appuser

COPY Part_3/hello_fcgi /usr/local/bin/hello_fcgi
COPY nginx/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p \
    /var/cache/nginx \
    /var/log/nginx \
    /var/run \
    /var/lib/nginx \
    && chown -R appuser:appgroup \
    /usr/local/bin/hello_fcgi \
    /var/cache/nginx \
    /var/log/nginx \
    /var/run \
    /var/lib/nginx


HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD curl -fs http://localhost:81/ || exit 1

USER appuser

EXPOSE 81

CMD ["sh", "-c", "spawn-fcgi -p 8080 /usr/local/bin/hello_fcgi && nginx -g 'daemon off;'"]
