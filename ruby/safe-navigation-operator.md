# Safe Navigation Operator

With the release of Ruby 2.3, the *safe navigation operator* (`&.`) is now
available. This addition to the Ruby language allows you to collapse all
those pesky `nil` checks into the accessor call they are guarding. Consider
this snippet of common Ruby code:

```ruby
if user && user.authenticate(params[:password])
  # proceed with logged in user
end
```

With the *safe navigation operator*, the predicate can now be collapsed:

```ruby
if user&.authenticate(params[:password])
  # proceed with logged in user
end
```

If `user` is `nil`, then the predicate will evaluate to `false` and the body
of the if-statement will be passed over.

[Source](http://nithinbekal.com/posts/ruby-2-3-features/)
