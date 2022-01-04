.DEFAULT_GOAL := all
.PHONY := all clean veryclean init read container

all: container
	make -C doc/ all

container:
	make -C docker/ all

read:
	make -C doc/ read

submodule:
	make -C doc/ submodule

self:
	make -C doc/ self

init: container
	make -C doc/ init

serve: container
	make -C doc/ all
	make -C doc/ server

halt: container
	make -C doc/ server-stop

pdf: serve
	wkhtmltopdf http://0.0.0.0:6600/ doc/book/book.pdf

clean:
	make -C doc/ clean
	rm -f doc/book/book.pdf

veryclean: clean
	make -C docker/ clean
