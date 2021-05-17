VERSION := "v0.0.1"
# LDFLAGS := -ldflags "-X github.com/chartleyit/drinkdex/cmd/config.Version=${VERSION}"
LDFLAGS := -ldflags "-X main.Version=${VERSION}"
# MODULE = $(shell go list -m)

.PHONY: build-example
build-example:
	CGO_ENABLED=0 go build ${LDFLAGS} -a -o drink-dex $(MODULE)/src

.PHONY: build
build:
	CGO_ENABLED=0 go build ${LDFLAGS} -a -o bin/drink-dex

.PHONY: build-docker
build-docker:
	docker build -f Dockerfile -t drinkdex .

.PHONY: run
run:
	go run main.go

.PHONY: clean
clean:
	rm -rf bin/*

.PHONY: lint
lint:
	golint main.go