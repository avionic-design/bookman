.DEFAULT_GOAL := all
.PHONY := all clean

SRC = $(shell find src/ -name "*.dot" -print | sed 's/.dot/.svg/g' | sed 's/^src/svg/g')

all: $(SRC)
	mkdir -p ../shared/dot
	mkdir -p svg
	find . -name "*.svg" -exec cp {} ../shared/dot/ \;

%.svg:
	mkdir -p svg
	dot -Tsvg $(shell echo $@ | sed 's/.svg/.dot/g' | sed 's/^svg/src/g') -o $@

clean:
	rm -rf ../shared/dot
	rm -rf svg
	mkdir -p svg
	mkdir -p ../shared/dot
