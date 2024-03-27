# List Files In A Single Column

The `ls` command lists out the files and directories in your current directory
or a specified directory.

The standard output for an `ls` command expands the fit the width of your
terminal screen.

```bash
❯ ls *.(ts|js)
cypress.config.ts  postcss.config.js  remix.config.js    remix.env.d.ts     server.ts          tailwind.config.ts vitest.config.ts
```

This might not always be the ideal way to view that output. For instance, the
above example when shared as a code block like in this post ends up with
horizontal scroll.

With the `-1` flag, we can tell `ls` to display the results in a single
vertical column.

```bash
❯ ls -1 *.(ts|js)
cypress.config.ts
postcss.config.js
remix.config.js
remix.env.d.ts
server.ts
tailwind.config.ts
vitest.config.ts
```

See `man ls` for more details.

[source](https://askubuntu.com/questions/954924/listing-files-in-directory-in-one-column)
