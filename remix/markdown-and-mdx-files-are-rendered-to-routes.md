# Markdown And MDX Files Are Rendered To Routes

If you put a markdown or [mdx](https://mdxjs.com/) file somewhere within the
`app/routes` directory of a [Remix](https://remix.run/) app, it knows how to
render it to HTML. There is no additional setup necessary, it works out of the
box.

For instance, trying creating an `about.md` file under `app/routes`.

```markdown
# About

My name is **Josh Branchaud** and I am an _independent_ software developer.

Reach out to me at <a href="mailto:josh@email.com">josh@email.com</a>.
```

Now, run the app's dev server and visit `localhost:3000/about`. You'll see a
fairly unstyled page with this text rendered to it. Try inspecting the source
and you'll see, for instance, that _About_ is wrapped in an `<h1>` tag.

If you want this markdown styled (e.g. a larger font size for that `<h1>`),
you'll either have to write some custom styles or pull in something like
[`@tailwindcss/typography`](https://tailwindcss.com/docs/typography-plugin).
