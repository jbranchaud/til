# Use .ruby Extension For Template File

An interesting feature of Rails that I can't seem to find documented anywhere is
that you can write a template file with plain Ruby by using the `.ruby`
extension. For instance, you might want to render some JSON from a template.
Instead of using `jbuilder` or `erb`, you can have a `show.json.ruby` file. This
is also popular with Turbo Stream files -- e.g. `update.turbo_stream.ruby`.

How this works is that the entire file is evaluated as if it were a `.rb` file.
Then the return value of the final statement is what is returned and rendered by
Rails.

```ruby
author_byline = @book.authors.map(&:name).to_sentence

data = {
  id: @book.id,
  title: @book.title,
  author: author_byline,
  status: @book.published_at > Time.current ? 'Coming Soon' : 'Published',
  publication_year: @book.published_at.year
}

data.to_json
```

That final line converts the hash of data that we've built up into a JSON string
that can then be rendered by the controller action that corresponds to this view
template.

Similarly, you can have a Turbo Stream template `show.turbo_stream.ruby` that
looks something like this:

```ruby
[
  turbo_stream.prepend("posts", @post),
  turbo_stream.update("form", partial: "form", locals: { post: Post.new })
].join
```

This template file is made up of a single statement which is an array of turbo
stream results that get joined together.
