# Prevent Mailer Previews From Cluttering Database

ActionMailer Previews give you a way to view email templates that your system
sends. This is how I check that it is styled properly and that the logic and
data of the template are able to run and render.

Data for a preview typically means we need ActiveRecord objects and even their
associations. If we start creating one-off records in our previews either with
`#create` or with something like `FactoryBot`, those records will get left
behind in our development database. Every view and refresh of a preview will
generate more of these records.

One way to get around that is to use `#new` and `#build`. I've found this
cumbersome and it often leaves assocations missing or inaccessible.

What if instead the preview could clean up after itself? That sounds like a
great job for a database transaction.

Let's create a `test/mailers/previews/base_preview.rb` as a base class for all
our preview classes.

```ruby
class BasePreview < ActionMailer::Preview
  def self.call(...)
    message = nil
    ActiveRecord::Base.transaction do
      message = super(...)
      raise ActiveRecord::Rollback
    end
    message
  end
end
```

This wraps the existing `self.call` functionality in a transaction that
collects the resulting message from the preview and then rolls back the
database changes.

Now, instead of our individual preview classes inheriting directly from
`ActionMailer::Preview`, they can inherit from `BasePreview`.

```ruby
class UserMailer < BasePreview

  # ...

end
```

[source](https://stackoverflow.com/a/31289295)
