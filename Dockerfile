FROM golang:1.10-alpine3.7

WORKDIR /go/src/vsphere-influxdb-go
COPY . .
RUN apk --update add --virtual build-deps git \
 && go get -d -v ./... \
 && go install -v ./... \
 && rm -rf /go/src \
 && apk del build-deps

RUN addgroup -S spock && adduser -S spock -G spock

USER spock

CMD ["/vsphere-influxdb-go"]
