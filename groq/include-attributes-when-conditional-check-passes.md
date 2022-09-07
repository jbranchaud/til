# Include Attributes When Conditional Check Passes

The graph-like nature of Sanity means that you'll often be querying for data
that spans a variety of document types. For instance, your front-end could be
requesting content in the shape of a blog post, video, and podcast. Though
there are some similarities, each of these document types will have some unique
attributes.

When using GROQ to query for data that spans different types of documents, you
can use [a conditional query
syntax](https://www.sanity.io/docs/query-cheat-sheet#64a36d80be73) to include
type-specific attributes.

```groq
*[_type == 'blog' || _type == 'video' || _type == 'podcast'][]{
  title,
  'slug': slug.current,
  _type == 'blog' => {
    body,
    read_time
  },
  _type == 'video' => {
    description,
    mp4_url
  },
  _type == 'podcast' => {
    description,
    mp3_url
  }
}
```

Notice that there are some attributes that are common across each type (i.e.
`title` and `slug`). Each type then has attributes unique to its document type
(i.e. `blog` has `body` and `read_time`).

This conditional query syntax allows us to both define flexible schemas in
Sanity and then query against that flexible schema.

[source](https://www.youtube.com/watch?v=dCGPNkcTseQ)
