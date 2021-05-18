MODULE = $(shell go list -m)
VERSION := "v0.0.1"
# LDFLAGS := -ldflags "-X github.com/chartleyit/drinkdex/cmd/config.Version=${VERSION}"
LDFLAGS := -ldflags "-X main.Version=${VERSION}"
# MODULE = $(shell go list -m)

.PHONY: build-example
build-example:
	CGO_ENABLED=0 go build ${LDFLAGS} -a -o drinkdex $(MODULE)/src

.PHONY: build
build:
	CGO_ENABLED=0 go build ${LDFLAGS} -a -o bin/drinkdex ${MODULE}/cmd/drinkdex

.PHONY: build-docker
build-docker:
	docker build -f Dockerfile -t drinkdex .
	docker tag drinkdex:latest drinkdex:${VERSION}

.PHONY: run
run:
	go run cmd/drinkdex/main.go

.PHONY: run-docker
run-docker:
	docker run -it -p 127.0.0.1:18150:18150 drinkdex

.PHONY: clean
clean:
	rm -rf bin/*

.PHONY: lint
lint:
	golint main.go