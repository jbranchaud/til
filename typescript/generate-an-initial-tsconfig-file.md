# Generate An Initial tsconfig File

A new `tsconfig.json` file can be generated using [the `tsc`
CLI](https://www.typescriptlang.org/docs/handbook/compiler-options.html) which
is part of the `typescript` node package.

You'll first want to add `typescript` to your project:

```bash
$ npm install typescript --save-dev
```

Since it is a local project dependency, you'll want to add `tsc` as a script in
your `package.json`.

```json
"scripts": {
  "tsc": "tsc"
}
```

Now you can use `npm` to run `tsc --init` like so:

```bash
$ npm run tsc -- --init
```

Notice the delimiting `--` which tells `npm` to pass the remaining arguments to
the command being invoked. This makes sure `--init` gets passed as an argument
to `tsc`.

This will generate a huge, mostly commented-out `tsconfig.json` file full of
annotations that looks something like this:

```json
{
  "compilerOptions": {
    /* Visit https://aka.ms/tsconfig to read more about this file */

    /* Projects */
    // "incremental": true,                              /* Save .tsbuildinfo files to allow for incremental compilation of projects. */
    /* ... */

    /* Language and Environment */
    "target": "es2016",                                  /* Set the JavaScript language version for emitted JavaScript and include compatible library declarations. */
    /* ... */
  }
}
```

[source](https://stackoverflow.com/a/57510415/535590)
