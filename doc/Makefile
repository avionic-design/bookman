.DEFAULT_GOAL := all
.PHONY := all init clean read mdbook mdbook-init mdbook-read

UID := $(shell id -u)
SESSION := $(shell uuidgen)

all: dot-files mdbook

init: mdbook-init

read: mdbook-read

dot-files:
	make -C dot/ all

mdbook:
	mkdir -p shared
	docker run -it --user $(UID):$(UID) --rm                     \
		--volume "$(realpath ./book/)":"/usr/src/":Z         \
		--volume "$(realpath ./shared/)":"/usr/src/shared":Z \
		--name "mdbook-$(SESSION)" "mdbook:0.4.12"           \
		build --dest-dir "html"
	cp -R shared book/html/shared

mdbook-init:
	docker run -it --user $(UID):$(UID) --rm             \
		--volume "$(realpath ./book/)":"/usr/src/":Z \
		--name "mdbook-$(SESSION)" "mdbook:0.4.12"   \
		init

mdbook-read: mdbook
	xdg-open book/html/index.html

clean:
	docker run -it --user $(UID):$(UID) --rm             \
		--volume "$(realpath ./book/)":"/usr/src/":Z \
		--name "mdbook-$(SESSION)" "mdbook:0.4.12"   \
		clean  --dest-dir "html"

	make -C dot/ clean
