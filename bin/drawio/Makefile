.DEFAULT_GOAL := all
.PHONY := all clean

all: drawio

drawio:
	wget https://github.com/jgraph/drawio-desktop/releases/download/v16.1.2/drawio-x86_64-16.1.2.AppImage -O drawio.part
	chmod +x drawio.part
	mv drawio.part drawio

clean:
	rm -f drawio
