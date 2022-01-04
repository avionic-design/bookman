.DEFAULT_GOAL := image
.PHONY := image clean

image:
	(docker images | grep -E "darkhttpd\s*latest") || \
		docker build -t darkhttpd:latest .

clean:
	docker image rm -f darkhttpd:latest
