FROM golang:1.18-alpine3.16 AS builder
WORKDIR /usr/src/app

COPY *.go ./

RUN go build app.go

FROM scratch

COPY --from=builder /usr/src/app/app .

ENTRYPOINT ["./app"]