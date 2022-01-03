.DEFAULT_GOAL := all
.PHONY := all clean veryclean init read container

all: container
	make -C doc/ all

container:
	make -C docker/ all

read:
	make -C doc/ read

init: container
	make -C doc/ init

clean:
	make -C doc/ clean

veryclean: clean
	make -C docker/ clean
