# Compile Reason To Native With Dune

[Dune](https://github.com/ocaml/dune) is "a composable build system for
OCaml" with out-of-the-box support for ReasonML. Dune can be used for a lot
of things, but in simplest terms it can be used to compile ReasonML programs
into native executables.

Considering the following ReasonML program.

```reason
/* hello_reason.re */
print_endline("Hello, Reason!")
```

We can then create the following Dune build file.

```lisp
;; dune
(executable
 (name hello_reason))
```

If we then run `dune build hello_reason.exe`, then Dune will compile the
`hello_reason.re` into a `hello_reason.exe` executable that can be found in
`build/default`. Run it and see the output.

Read more in the [Quickstart
guide](https://dune.readthedocs.io/en/latest/quick-start.html).
