FROM golang:1.13.4-alpine3.10
WORKDIR /go/src/github.com/mschneider82/ssl-proxy
RUN apk add --no-cache make git zip
COPY . .
RUN make 
ENTRYPOINT ["/go/src/github.com/mschneider82/ssl-proxy/ssl-proxy"]
