# Compile Reason With An OCaml Package Using Dune

In [Compile Reason To Native With
Dune](reason/compile-reason-to-native-with-dune.md), I showed how to compile
a basic ReasonML file as a native executable using Dune.

Any non-trivial program will likely involve pulling in an OCaml dependency.
For example, you may want to pull in [Lwt](https://github.com/ocsigen/lwt).
Assuming this package is available, whether you've manually downloaded it
via [opam](https://opam.ocaml.org/) or used something like
[esy](https://github.com/esy/esy), you'll want to let Dune know that Lwt is
an available library.

```lisp
;; dune
(executable
 (name hello_reason)
 (libraries lwt lwt.unix))
```

The modules in the Lwt package will now be globally available to your
Reason code.

```reason
let () = {
  Lwt_main.run(
    Lwt_io.printf("Hello, Reason!\n")
  );
};
```

When Dune builds your code, it will include and compile Lwt.

See a [full example
here](https://github.com/jbranchaud/esy-reasonml-lwt-example).
