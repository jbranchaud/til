# Where Are The Binaries?

When I want to know where an executable is, I use `which` like so:

```
$ which rails
/Users/jbranchaud/.gem/ruby/2.1.4/bin/rails
```

That is the rails binary on my path that will be used if I enter a rails command.

However, with something like rails, there may be multiple versions on your
path. If you want to know where all of them are, you can use `where`, like
so:

```
$ where rails
/Users/jbranchaud/.gem/ruby/2.1.4/bin/rails
/Users/jbranchaud/.rubies/2.1.4/bin/rails
/usr/bin/rails
```
