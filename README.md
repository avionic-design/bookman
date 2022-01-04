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