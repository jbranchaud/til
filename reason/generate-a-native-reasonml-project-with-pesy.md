# Generate A Native ReasonML Project With Pesy

[Pesy](https://github.com/jordwalke/pesy) is a CLI utility available from
NPM that you can use to generate a ReasonML project that is ready for native
compilation. It uses [`esy`](https://github.com/esy/esy) for the management
of `opam` packages. It uses [Dune](https://github.com/ocaml/dune) for
building your library code with the ReasonML and OCaml dependencies.

Assuming you already have `pesy` installed globally, create a directory for
your project and then run:

```bash
$ pesy
```

A project will be generated that is out-of-the-box ready to compile native
executables.
