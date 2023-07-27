FROM docker.io/antora/antora as builder

ADD . .

RUN antora generate --stacktrace site.yml

FROM quay.io/rhpds/nookbag:latest

COPY --from=builder /antora/antora /var/www/html/antora