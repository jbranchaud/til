# Load A File When Starting Rails Console

The `rails console` command uses `irb` under the hood. That means you can use
any of the flags that `irb` supports when running `rails c`. One of those flags
is `-r` which "causes `irb` to load the [specified] library using require."

This `-r` flag can come in handy if we want to load a little bit of setup code
or some utility methods for our `rails console` session.

Let's say we have `vendor/show_env.rb` with this snippet of code:

```ruby
puts "#{'*' * 7}  #{Rails.env.upcase}  #{'*' * 7}
```

And we want that to display as we open the console. We can pass the path to
that file to the `-r` flag.

```bash
$ rails console -- -r ./vendor/show_env.rb
```

[Notice the
`--`](https://tosbourn.com/speed-up-pasting-text-into-rails-console/). That is
to indicate that we are done with `console` specific arguments and anything
else should be passed along to `irb`. Without the `--`, the `-r` flag won't be
recognized.

See `man irb` to see what other flags `irb` supports.
