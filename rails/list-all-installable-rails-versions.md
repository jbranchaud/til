# List All Installable Rails Versions

_Here's a [screencast](https://www.youtube.com/watch?v=IizkvqGLkhU) in case you
want to watch instead of read._

I [was curious](https://twitter.com/jbrancha/status/1345467867479875584?s=20)
what versions of Rails were remotely available to be installed with `gem`. On
its own, `gem list rails` will show all _locally_ installed gems that
partially match `rails`. That'll include gems like `rspec-rails` and
`sprockets-rails`.

First, the `--exact` flag can be added to narrow down the results to an exact
match of `rails`.

Then, the `--remote` flag can be included to request `gem` look for remote
versions. That is, versions available on the rubygems server.

Lastly, the `--all` flag can be included to fetch all versions instead of only
the latest version.

Putting it all together:

```bash
$ gem list rails --exact --remote --all
rails (6.1.0, 6.0.3.4, 6.0.3.3, ... 0.9.0, 0.8.5, 0.8.0)
```

[source](https://stackoverflow.com/a/9146057/535590)
