FROM caddy:2-builder-alpine AS builder

RUN xcaddy build \
      --with github.com/caddy-dns/route53 \
      --with github.com/dunglas/mercure \
      --with github.com/dunglas/mercure/caddy


FROM caddy:2-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
