# Require Entire Gemfile In Pry Session

Want to experiment in a pry session with some of the gems in your project's
`Gemfile`? You can quickly require all the gems for your project using
Bundler's `#require` method.

Just require `bundler` itself and then execute `Bundler.require`. Everything
will be loaded in.

```ruby
> require 'bundler'
=> true
> Bundler.require
=> [Gem::Dependency.new("devise", Gem::Requirement.new([">= 0"]), :runtime),
 Gem::Dependency.new("rails", Gem::Requirement.new(["= 4.2.5"]), :runtime),
 Gem::Dependency.new("pg", Gem::Requirement.new(["~> 0.15"]), :runtime),
...
```
