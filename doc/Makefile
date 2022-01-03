.DEFAULT_GOAL := all
.PHONY := all init clean read mdbook mdbook-init mdbook-read

UID := $(shell id -u)
SESSION := $(shell uuidgen)

all: mdbook

init: mdbook-init

read: mdbook-read

mdbook:
	docker run -it --user $(UID):$(UID) --rm             \
		--volume "$(realpath ./book/)":"/usr/src/":Z \
		--name "mdbook-$(SESSION)" "mdbook:0.4.12"   \
		build --dest-dir "html"

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
