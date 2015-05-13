# Pretend Generations

To get an idea of what a `rails generate` command is going to to
*generate*, you can do a dry run with the `-p` flag or
the `--pretend` flag. If you run

```
$ rails generate model post -p
```

then you will see the following output

```
    invoke  active_record
    create    db/migrate/20150513132556_create_posts.rb
    create    app/models/post.rb
    invoke    rspec
    create      spec/models/post_spec.rb
    invoke      factory_girl
    create        spec/factories/posts.rb
```

though those files will not have actually been created. You now know
precisely what rails will generate for you.

[source](http://rubyquicktips.com/post/19223887750/pretend-to-generate)
