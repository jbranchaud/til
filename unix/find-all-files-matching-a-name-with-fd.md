# Find All Files Matching A Name With fd

The [`fd` command](https://github.com/sharkdp/fd) can be used to find files in
your file system by name. Though it has some nice defaults—it excludes hidden
directories and respects your `.gitignore` file—you may need to configure
those.

For instance, I want to find ALL _sitemap_ files in a monorepo.

```bash
$ fd -I -H sitemap.xml
```

The `-I` flag tells `fd` to not respect the `.gitignore` file. The `-H` flag
says to include hidden directories in the recursive search.

This included a bit too much noise from the `node_modules` directory, so I want
to exclude that.

```bash
$ fd -I -H -E node_modules sitemap.xml
```

The `-E` flag can specify one-off directories to exclude from the search.

I can even specify a regex to make sure I capture files that look like
`sitemap-01.xml`, not just `sitemap.xml`.

```bash
$ fd -I -H -E node_modules 'sitemap.*.xml'
```

After familiarizing myself with a few flags, I'm able to take full advantage of
`fd`.
