.DEFAULT_GOAL := all
.PHONY := all clean

all:
	make -C mdbook/ image
	make -C darkhttpd/ image
clean:
	make -C mdbook/ clean
	make -C darkhttpd/ clean
