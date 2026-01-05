# Check Ruby Version For Production App

While deploying a fresh Rails app to Heroku recently, I ran into an issue. The
`it` block argument wasn't working despite being on Ruby 4.0. Or so I thought.

Running the following command reported the Ruby version of that Heroku server
instance:

```bash
❯ heroku run -- ruby --version
Running ruby --version on ⬢ my-app... up, run.3090
ruby 3.3.9 (2025-07-24 revision f5c772fc7c) [x86_64-linux]
```

I was on `3.3.9` which must have been the fallback default at the time.

Though I had set the Ruby version in my `.ruby-version` file, I had neglected to
specify it in the `Gemfile` as well. Once I added it to the `Gemfile` and
redeployed, my Heroku server instance was running the expected version of Ruby.

```bash
❯ heroku run -- ruby --version
Running ruby --version on ⬢ my-app... up, run.5353
ruby 4.0.0 (2025-12-25 revision 553f1675f3) +PRISM [x86_64-linux]
```

Note: because [I have set `HEROKU_ORGANIZATION` and
`HEROKU_APP`](set-default-team-and-app-for-project.md) in my environment
(`.envrc`) for the local copy of the app, I don't need to specify those when
running the `heroku run` command above.

See `heroku run --help` for more details.
