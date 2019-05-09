# A Shorthand For Rerunning Failed Tests With RSpec

After running a group of tests -- whether it is the entire suite or just the
tests in a file -- you may find that you have a few failures. Often the goal is
to focus in on these failures and get back to a green test suite. Rather than
rerunning everything each time you make a change, you can instruct `rspec` to
just rerun the tests that failed. This can be done with the `--only-failures`
flag or `--on` flag for short.
