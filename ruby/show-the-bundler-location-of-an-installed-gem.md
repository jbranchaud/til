# Show The Bundler Location Of An Installed Gem

When you run `bundle install` with a project, it is going to install all the
gems specified by your project in a vendored location relative to the location
of your Ruby version install.

If you want to find the location of a specific gem, you can ask bundler with
`bundle show <gem-name>`.

Here I ask where the `rspec` gem is.

```bash
$ bundle show rspec
/Users/jbranchaud/.asdf/installs/ruby/3.1.3/lib/ruby/gems/3.1.0/gems/rspec-3.12.0
```

I could `cd` into that directory to have a look around at the source. That's a
great way to learn more about how our dependencies work.

I could even inject some debugging statements (e.g. `binding.irb`) which the
program using these gems will break on. Not often, but sometimes you need to
dig in this deep to understand what is causing a tricky bug or why code isn't
behaving like you'd hoped. Just remember to remove those statements when you're
done.
