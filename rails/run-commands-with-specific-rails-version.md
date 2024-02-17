# Run Commands With Specific Rails Version

You can have multiple versions of a gem like `rails` installed with `gem`.
However, when you go to run a rails command, your system will default to using
the latest version that you have installed.

So doing a version check will show that version to currently be `7.1.3` and
running something like `rails new` will set up a new Rails 7.1.3 app.

```bash
$ rails --version
Rails 7.1.3

$ rails new my_app
```

If you want to use a Rails version besides the latest you have installed for
whatever command, you can use a `gem` convention which is to put `_<VERSION>_`
right after the gem name.

Let's try this for Rails 6.1.3:

```bash
$ rails _6.1.3_ --version
Rails 6.1.3

$ rails _6.1.3_ new my_app
```

[source](https://stackoverflow.com/a/452458/535590)
