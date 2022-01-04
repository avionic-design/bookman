.DEFAULT_GOAL := all
.PHONY := all init clean read mdbook mdbook-init mdbook-read

UID := $(shell id -u)
SESSION := $(shell uuidgen)

all: dot-files mdbook

init: server-stop mdbook-init

read: mdbook-read

submodule: server-stop
	mkdir -p ../../doc/shared
	mkdir -p ../../doc/book
	mkdir -p ../../doc/dot/src
	rm -f shared
	rm -f book
	rm -f dot/src
	rm -rf shared   && ln -s ../../doc/shared     shared
	rm -rf book     && ln -s ../../doc/book       book
	rm -rf dot/src  && ln -s ../../../doc/dot/src dot/src
	rm -f shared/README.md
	-cp -f ../../README.md shared/README.md

self: server-stop
	mkdir -p ../selfdoc/shared
	mkdir -p ../selfdoc/book
	mkdir -p ../selfdoc/dot/src
	rm -f shared
	rm -f book
	rm -f dot/src
	rm -rf shared   && ln -s ../selfdoc/shared     shared
	rm -rf book     && ln -s ../selfdoc/book       book
	rm -rf dot/src  && ln -s ../../selfdoc/dot/src dot/src
	rm -f shared/README.md && cp ../README.md shared/README.md

server-stop:
	-docker kill "darkhttpd-bookman"
	-docker rm "darkhttpd-bookman"

server: server-stop mdbook
	docker run -td --user $(UID):$(UID) -p 6600:6600             \
                --volume "$(realpath ./book/html)":"/home/www/":Z    \
                --name "darkhttpd-bookman" "darkhttpd:latest"

dot-files:
	mkdir -p dot/src
	make -C dot/ all

mdbook-dirs:
	mkdir -p shared
	mkdir -p book/src
	mkdir -p book/html

mdbook: server-stop mdbook-dirs
	docker run -it --user $(UID):$(UID) --rm                     \
		--volume "$(realpath ./book/)":"/usr/src/":Z         \
		--volume "$(realpath ./shared/)":"/usr/src/shared":Z \
		--name "mdbook-$(SESSION)" "mdbook:0.4.12"           \
		build --dest-dir "html"
	mkdir -p book/html/shared
	cp -R shared/* book/html/shared/

mdbook-init: mdbook-dirs
	docker run -it --user $(UID):$(UID) --rm             \
		--volume "$(realpath ./book/)":"/usr/src/":Z \
		--name "mdbook-$(SESSION)" "mdbook:0.4.12"   \
		init

mdbook-read: mdbook
	xdg-open book/html/index.html

clean: server-stop mdbook-dirs
	docker run -it --user $(UID):$(UID) --rm             \
		--volume "$(realpath ./book/)":"/usr/src/":Z \
		--name "mdbook-$(SESSION)" "mdbook:0.4.12"   \
		clean  --dest-dir "html"
	make -C dot/ clean
	rm -f shared/README.md
