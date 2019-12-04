FROM golang:alpine as builder

WORKDIR /go/src/github.com/mschneider82/ssl-proxy
RUN apk add --no-cache make git zip
COPY . .
RUN make 

FROM alpine
RUN adduser -S -D -H -h /app appuser
RUN mkdir -p /app/.ssl-proxy ; chown -R appuser /app
COPY --from=builder /go/src/github.com/mschneider82/ssl-proxy/ssl-proxy /app
USER appuser
WORKDIR /app
ENTRYPOINT ["/app/ssl-proxy"]
