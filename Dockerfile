FROM docker.io/antora/antora as builder

ADD . /antora/

RUN antora generate --stacktrace site.yml

FROM quay.io/rhpds/nookbag:latest

COPY --from=builder /antora /var/www/html/