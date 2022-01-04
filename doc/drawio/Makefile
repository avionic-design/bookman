.DEFAULT_GOAL := all
.PHONY := all clean

all:
	mkdir -p ../shared/drawio
	mkdir -p svg
	../../bin/drawio/drawio -x -f svg -o svg/ src/
	find . -name "*.svg" -exec cp {} ../shared/drawio/ \;

clean:
	rm -r ../shared/drawio
	rm -r svg
	mkdir -p svg
	mkdir -p ../shared/drawio
