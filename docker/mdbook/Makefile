.DEFAULT_GOAL := image
.PHONY := image clean

image:
	(docker images | grep -E "mdbook\s*0.4.12") || \
		docker build -t mdbook:0.4.12 .

clean:
	docker image rm mdbook:0.4.12
