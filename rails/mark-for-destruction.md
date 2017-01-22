# Mark For Destruction

Do you have some complicated logic or criteria for deleting associated
records? [ActiveRecord's
`#mark_for_destruction`](http://api.rubyonrails.org/classes/ActiveRecord/AutosaveAssociation.html#method-i-mark_for_destruction) may come in handy.

Let's say we have _users_ who author _articles_. We want to delete some of
the user's articles based on some criteria -- those articles that have odd
`id`s.

```ruby
> user = User.first
#=> #<User...>
> user.articles.each { |a| a.mark_for_destruction if a.id.odd? }
#=> [#<Article...>, ...]
> user.articles.find(1).marked_for_destruction?
#=> true
> user.articles.find(2).marked_for_destruction?
#=> false
```

We've marked our articles for destruction and confirmed as much with the
[`#marked_for_destruction?`](http://api.rubyonrails.org/classes/ActiveRecord/AutosaveAssociation.html#method-i-marked_for_destruction-3F) method. Now, to go through with the destruction, we just have to save the parent record -- the user.

```ruby
> user.save
   (0.2ms)  BEGIN
  User Exists (0.8ms)  SELECT  1 AS one FROM "users" WHERE ("users"."email" = 'person1@example.com' AND "users"."id" != 1) LIMIT 1
  SQL (3.0ms)  DELETE FROM "articles" WHERE "articles"."id" = $1  [["id", 1]]
  SQL (0.2ms)  DELETE FROM "articles" WHERE "articles"."id" = $1  [["id", 3]]
   (2.1ms)  COMMIT
=> true
```

Note: the parent record must have `autosave: true` declared on the
association.

```ruby
class User < ActiveRecord::Base
  has_many :articles, autosave: true
end
```
