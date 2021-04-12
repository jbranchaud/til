# Use Tailwind Typography Prose In Dark Mode

Tailwindcss can be set up to provide styled defaults for both standard (light)
mode and dark mode. Once this is set up, you can add a toggle mechanism to
switch between light and dark mode. [This
post](https://egghead.io/blog/tailwindcss-dark-mode-nextjs-typography-prose)
goes into all those details.

This can even be used with [Tailwind's
typography](https://github.com/tailwindlabs/tailwindcss-typography) plugin.
`typography` provides default styling which is great if you don't control the
markup that is being rendered or if you want to provide some defaults to a
chunk of markup.

A chunk of markup that uses typography will minimally look something like this:

```jsx
<div className="prose">
  <h1>{title}</h1>
  {markdownAsHtml}
</div>
```

To give this reasonable dark mode defaults, you'll need to add a `dark`-mode
class as well. Using the `dark` prefix, you can apply the `prose-dark` class to
the top-level div.

```jsx
<div className="prose dark:prose-dark">
  <h1>{title}</h1>
  {markdownAsHtml}
</div>
```
