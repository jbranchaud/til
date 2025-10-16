# Format Specific html.erb Template Files

There are a few tools out there that can do formatting of `*.html.erb` template
files. One that I like is
[nebulab/erb-formatter](https://github.com/nebulab/erb-formatter#readme)
because it is ready to use in many different editors. That means that it is
easier to adopt on a team of developers with different editor preferences.

That said, there are projects where I don't necessarily want it wired up to run
on save because the formatting changesets will be too agressive. Instead, I
want to run it manually on specific files as I see fit.

To do this, I install the formatter tool:

```bash
$ gem install erb-formatter
```

And now it is available as a CLI tool (try `which erb-format`).

As their docs recommend, I can run it against all files like so:

```
$ erb-format app/views/**/*.html.erb --write
```

If that is too aggressive though, I find it useful to either run against a
specific file:

```
$ erb-format app/views/some/model/index.html.erb --write
```

Or when I'm wrapping up changes on a branch, I like to run it against all the
view files that were touched on this branch:

```
$ git diff --name-only master...HEAD -- app/views | xargs erb-format --write
```
