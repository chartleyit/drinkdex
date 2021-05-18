# Build image
FROM golang:alpine AS builder

RUN apk add --update --no-cache ca-certificates curl git bash make

WORKDIR /app

COPY go.* ./
RUN go mod download
RUN go mod verify

COPY Makefile ./
COPY . .
RUN make build

# Final image
FROM alpine:3.11

RUN apk add --update --no-cache ca-certificates bash curl

COPY --from=builder /app/bin/drinkdex /usr/local/bin/
EXPOSE 18150
ENTRYPOINT ["/usr/local/bin/drinkdex"]