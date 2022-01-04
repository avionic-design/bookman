# How To Use

## Add Bookman To A Project
First add bookman as a submodule to your project,
then setup bookman using the submodule target.
```bash
git submodule add git@github.com:avionic-design/bookman.git
make -C bookman/ submodule
```

The `submodule` target will connect bookman to your project and
you should end up with a tree like this:
```
your-project
├── bookman
│   ├── doc
│   │   ├── book -> ../../doc/book
│   │   ├── dot
│   │   │   ├── Makefile
│   │   │   ├── src -> ../../../doc/dot/src
│   │   │   └── svg
│   │   ├── Makefile
│   │   └── shared -> ../../doc/shared
│   ├── docker
│   │   ├── Makefile
│   │   └── mdbook
│   │       ├── Dockerfile
│   │       └── Makefile
│   ├── LICENSE
│   ├── Makefile
│   └── README.md
└── doc
    ├── book
    ├── dot
    │   └── src
    └── shared
```

## Init The Docs
The first time you might want to scaffold the docs.
To do so run the `init` target.
```bash
make -C bookman/ init
```

Your `doc` tree will end up like this.
```
doc
├── book
│   ├── book
│   ├── book.toml
│   ├── shared
│   └── src
│       ├── chapter_1.md
│       └── SUMMARY.md
├── dot
│   └── src
└── shared
```

## Build The Docs
To build the docs run the default target.
```bash
make -C bookman/
```

## Read The Docs
The docs are a static website located in `doc/book/html`. You can host this on a server,
open the `index.html` with your browser or simply run the `read` target.
```bash
make -C bookman/ read
```

## Build Self Documentaion
To build the selfdocs first setup Bookman for selfdoc building by running the `self` target.
Then build and read the same way as in `submodule` config.
```bash
make -C bookman/ self all read
```

## Webserver
The webserver hosts the docs at http://0.0.0.0:6600/.
To start the webserver tse the `serve` target. To stop the server use the `halt` target.
```bash
make -C bookman/ submodule serve
make -C bookman/ submodule halt
```

## PDF
To create the PDF docs wkhtmltopdf is used, therefore the webserver has to be run
(this happens automatically).

```bash
make -C bookman/ submodule pdf
make -C bookman/ self pdf 
```

The PDF `book.pdf` is created in the `doc/book/` folder or `bookman/selfdoc/book/` if run in self config.
