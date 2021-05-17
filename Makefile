VERSION := "v0.0.1"
# LDFLAGS := -ldflags "-X github.com/chartleyit/drinkdex/cmd/config.Version=${VERSION}"
LDFLAGS := -ldflags "-X main.Version=${VERSION}"
# MODULE = $(shell go list -m)

build-example:
	CGO_ENABLED=0 go build ${LDFLAGS} -a -o drink-dex $(MODULE)/src

build:
	CGO_ENABLED=0 go build ${LDFLAGS} -a -o bin/drink-dex

build-docker:
	docker build -f Dockerfile -t drinkdex .

run:
	go run main.go