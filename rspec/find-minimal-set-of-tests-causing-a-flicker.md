# Find Minimal Set Of Tests Causing Flicker

You have a pretty reliable test suite. However, every once in a while CI will
fail. It fails for some test that doesn't seem to be related to the PR. And if
you re-run CI, it may not fail a subsequent time.

Your test suite has a flicker.

Because this flickering test fails so sporadically, it can be hard to track
down when it fails and why.

[RSpec comes with a `--bisect`
flag](https://relishapp.com/rspec/rspec-core/docs/command-line/bisect) that can
help you track down the _minimal_ sequence of tests that will produce a
failure. So, the next time CI fails unexpectedly on this flickering test, grab
the seed for that test run and use it locally to perform a bisect.

```bash
$ rspec --seed 1234 --bisect
```

This while take a while to run, but when it is done, it should output an
`rspec` command with a series of specific tests. Copy, paste, and run this
command as you work on tracking down the issue. One strong possibility is that
one test is altering some global state in a way that the other test doesn't
expect. And it is only in this order that you can see that manifest as a
failure.
