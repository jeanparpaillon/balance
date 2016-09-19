PROJECT = balance
PROJECT_VERSION = 0.1

DEPS = cowboy jsx
dep_cowboy_commit = 2.0.0-pre.3

AC = sudo acbuild --debug

-include erlang.mk

ctnr-build: build-ctnr
	docker run -v $(CURDIR):$(CURDIR) $< make -C $(CURDIR) rel
	docker build -t $(PROJECT) .

build-ctnr:
	docker build -t $@ build

ctnr-run: container
	rkt run --insecure-options=image --net=host $<

.PHONY: ctnr-build build-ctnr ctnr-run
