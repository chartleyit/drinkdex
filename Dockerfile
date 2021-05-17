FROM golang:alpine AS build

RUN apk update && \
    apk add curl \
            git \
            bash \
            make \
            ca-certificates && \
    rm -rf /var/cache/apk/*

WORKDIR /app

COPY go.* ./
RUN go mod download
RUN go mod verify

COPY Makefile ./
COPY main.go ./
RUN make build