# Generate New App Without Brunch

By default when you create a new Phoenix app using `phx.new`, a set of files
and configurations will be generated for [Brunch](http://brunch.io/). Though
the Phoenix team decided to use Brunch, you don't have to. You may not want
Phoenix to handle asset building or you may just prefer another tool. Either
way, if you'd like to opt out, you can include the `--no-brunch` flag when
generating the project.

```bash
$ mix phx.new --no-brunch my_app
```

If you have an existing project that you'd like to remove Brunch from, there
is some information in [Phoenix's Static Assets
documentation](http://phoenixframework.org/blog/static-assets).
