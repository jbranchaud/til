# Base Styles For Text Link

[Tailwind CSS](https://tailwindcss.com/)'s base styles directive includes a CSS
reset called [Preflight](https://tailwindcss.com/docs/preflight). It normalizes
styling inconsistencies between browsers, and in the process it wipes out a
bunch of default styles you might be expecting.

A notable one is styling for a text link (`<a href ...>link</a>`). These tend
to be blue with an underline, use the _pointer_ cursor, and sometimes change
color slightly when you hover or _activate_ them.

Breaking from that mold a little, here is a reasonable base style for a text
link:

```html
<a
  className="underline text-purple-600 cursor-pointer hover:text-purple-800"
  href="https://twitter.com/jbrancha"
>
  twitter
</a>
```

This adds the `text-decoration: underline`, some color, the `cursor: pointer`,
and a slightly darker color on hover.

And for a slight variation, I'll make the `underline` text decoration appear
only on hover:

```css
<a
  className="hover:underline text-purple-600 cursor-pointer hover:text-purple-800"
  href="https://twitter.com/jbrancha"
>
  twitter
</a>
```
