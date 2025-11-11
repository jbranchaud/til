# Set Default Tasks For Rake To Run

Let's say our Ruby codebase has a `test` rake task and a `test:system` rake
task. One runs our unit tests and the other runs our system (headless
browser-based) tests. They aren't necessary defined in our `Rakefile`. In fact,
that's how it is in a Rails codebase where these are defined by Rails itself.

We want the default action when [`rake`](https://ruby.github.io/rake/) is
invoked by itself to be to run both of those test tasks.

This can be accomplished by specifying a `default` task and specifying both of
those tasks as prerequisites.

```ruby
task default: ["test", "test:system"]
```

The `default` task itself does nothing. When we invoke it though, it has to run
our prerequisites. So running `rake` results in `test` and then `test:system`
getting run.

If I have something like
[`unicornleap`](https://github.com/dkarter/dotfiles/blob/b5aae6a9edd5766f0cc9100235b0955a9d53aa85/installer/mac-setup.sh#L47-L74)
or
[`confetti`](https://manual.raycast.com/deeplinks#block-702a9613bc82440d853492f553876a20),
then I can have one of those run in the event that all the prerequisites pass.

```ruby
task default: ["test", "test:system"] do
  system("unicornleap") if system("which unicornleap > /dev/null 2>&1")
end
```
