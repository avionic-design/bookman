.DEFAULT_GOAL := all
.PHONY := all clean

SRC = $(shell find src/ -name "*.drawio" -print | sed 's#.drawio#.svg#g' | sed 's#^src#svg#g')

all: $(SRC)
	mkdir -p ../shared/drawio
	mkdir -p svg
	find . -name "*.svg" -exec cp {} ../shared/drawio/ \;

%.svg:
	mkdir -p svg
	../../bin/drawio/drawio -x -f svg -o $@ $(shell echo $@ | sed 's#.svg#.drawio#g' | sed 's#^svg#src#g') -o $@

clean:
	rm -r ../shared/drawio
	rm -r svg
	mkdir -p svg
	mkdir -p ../shared/drawio
