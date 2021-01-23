# Create Files And Directories For Dynamic Routes

[Next.js](https://nextjs.org/) allows you to go beyond static, predefined pages
and routes with [dynamic
routing](https://nextjs.org/docs/routing/dynamic-routes).

The common example is a `posts` route that includes a _slug_ to dynmically
reference a particular post. The template for that page can be defined at
`pages/posts/[slug].js`. Notice the square brackets around the slug, that tells
Next that it is a dynamic route and whatever matches against the slug should be
included in `router.query` as `slug`.

Let's try to create that file:

```bash
$ touch pages/posts/[slug].js
zsh: no matches found: pages/posts/[slug].js
```

That failed. To create this kind of file from the command-line, you are going
to need to escape the square brackets:

```bash
$ touch pages/posts/\[slug\].js
```

You can do the same if you use dynamic routing in your directory structure:

```bash
$ mkdir -p pages/posts/\[year\]/\[month\]/\[day\]
```

And now we have the following structure:

```bash
$ exa --tree pages/posts
pages/posts
├── [slug].js
└── [year]
   └── [month]
      └── [day]
```
