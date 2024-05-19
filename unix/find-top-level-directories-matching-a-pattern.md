# Find Top-Level Directories Matching A Pattern

I like using [`fd`](https://github.com/sharkdp/fd) as an alternative to `find`.
In my experience it is more intuitive to use. For instance, I wanted to find
all the top-level directories in my current directory that contained the word
`next`. I was able to get the command mostly right by guessing the flags, only
checking the man page once.

On my first attempt, it prompted me with a suggestion for a flag that wasn't
quite right. I tried `--depth`, but it should have been `--maxdepth`.

```bash
$ fd --depth 0 next ./
error: Found argument '--depth' which wasn't expected, or isn't valid in this context
        Did you mean --maxdepth?
```

Then I checked the man page for how to specify the file type as _directory_ --
using `-t` or `--type` with `d`.

And here is the command that gets me all top-level directories matching `next`
in my current directory:

```bash
$ fd --maxdepth 1 --type d next ./

bookshelf-nextjs-prisma-postgres
bookshelf-prisma-nextjs-planetscale
my-next-app
next-bookshelf
next-personal-site
next-sanity-v3-example
try-trpc-next
```

See `man fd` for more details.
