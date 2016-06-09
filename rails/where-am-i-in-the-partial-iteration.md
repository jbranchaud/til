# Where Am I In The Partial Iteration?

Let's say I am going to render a collection of posts with a post partial.

```erb
<%= render collection: @posts, partial: "post" %>
```

The
[`ActionView::PartialIteration`](http://api.rubyonrails.org/classes/ActionView/PartialIteration.html)
module provides a couple handy methods when rendering collections.
I'll have access in the partial template to `#{template_name}_iteration`
(e.g. `post_iteration`) which will, in turn, give me access to `#index`,
`#first?`, and `#last?`.

This is great if I need to do something special with the first or last item
in the collection or if I'd like to do some sort of numbering based on the
index of each item.

[source](http://stackoverflow.com/questions/13397848/rails-render-collection-partial-getting-size-of-collection-inside-partial)

h/t Josh Davey
