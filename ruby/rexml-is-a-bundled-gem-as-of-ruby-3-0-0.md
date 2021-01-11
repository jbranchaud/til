# rexml Is A Bundled Gem As Of Ruby 3.0.0

Are you seeing an error loading certain
[`rexml`](https://github.com/ruby/rexml) files?

```
LoadError: cannot load such file -- rexml/document
```

It may be that `rexml` no longer ships as part of the Ruby version you are
using. If you are working with Ruby 3.0.0 or later, the `rexml` gem needs to be
explicitly installed as it is now a bundled gem.

Either add it to your `Gemfile`:

```
gem 'rexml'
```

or install it manually with:

```bash
$ gem install rexml
```

[source](https://stackoverflow.com/questions/65479863/rails-6-1-what-is-preventing-tests-from-running)
