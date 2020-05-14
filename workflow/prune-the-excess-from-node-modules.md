# Prune The Excess From node_modules

The `node_modules` directory, which is part of every JavaScript project, is
infamously heavy. It is a massive directory of all your project's dependencies
and those dependencies' dependencies.

The size of `node_modules` can become a problem on CI build servers with
limited disk space. You can significantly reduce the size of `node_modules` by
pruning away all the excess files that aren't needed during builds like
markdown files, typescript source files, etc.

Include the [`node-prune`](https://github.com/tj/node-prune) binary as part of
your build pipeline to handle this.

```bash
$ node-prune /path/to/node_modules
```

In one instance, I saw a reduction from 400MB to 11MB in the `node_modules`
directory size.
