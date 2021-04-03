# Ship Public Assets With A Next.js App

A Next.js project includes a top-level `public` directory. Anything in this
directory at build time will be publicly available.

This is handy for things like a logo, cover image, or favicon.

If I create an `images` directory in `public` and then place an SVG in it:

```bash
$ ls public/images
logo.svg
```

Then I can reference that image in the HTML or JSX of my app pages, such as in
a `header.jsx` component.

```jsx
const Header = () => {
  <div>
    {/* a bunch of header and nav content */}
    <img className="logo" src="/images/logo.svg" />
  </div>
}
```

Notice it is publicly available at `/images/logo.svg`.

You can do this with other files as well. For instance, some kind of company
brochure PDF could be placed in `public` and you could link to it as a
download.

[source](https://nextjs.org/docs/basic-features/static-file-serving)
