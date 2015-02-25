# Parallel Bundle Install

The `bundle install` command can take quite a while sometimes. This is
especially true for when you are setting up a fresh dev environment for an
existing project. Fortunately, Bundler provides a flag for parallelizing
the gem installs and Bundler is smart enough that it knows how to resolve
the dependencies so that this is possible in the first place. Just tell
Bundler how many concurrent jobs you want it to install with (4 is a good
number) and let it do the rest of the work.

```bash
$ bundle install --jobs 4
```
