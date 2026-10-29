# Show Full URLs With Print Styles

Web pages are best experienced in a browser where you can fully interact with
them. Links, for instance, can be hovered, inspected, and clicked on to navigate
to the target location -- that's a core part of the web browser experience and
what makes the internet.

Some people have printers though and they want to be able to print off web
pages. Any web page can be printed off as is, but if your site or app is
anticipating certain pages being printed, then you may add some
`@print`-specific CSS styling to improve how it looks in print format.

Links are a prime example of lost interactivity. When printed, links render as
blue underlined text with no way to know what they are linking to. One trick
that I recently picked up from [this lobste.rs thread](https://lobste.rs/s/olnqh2/websites_should_be_printable#c_wigxfy) is to
add _after content_ that renders the actual, full URL next to the link.

```css
@media print 
{
  a[href]::after
  {
    content: " [" attr(href) "]";
  }
}
```

This means that when a page has `<a href="https://still.visualmode.dev">still</a>`, the printed version will not
just render the word "still", but will be styled to render `still [https://still.visualmode.dev]`.

This will add content after links for both absolute URLs and relative paths (and
anchor tags). If I wanted to limit the after content to only show absolute URLs,
I could add a bit more specificity to the matching tag.

```css
@media print 
{
  a[href^="http"]::after
  {
    content: " [" attr(href) "]";
  }
}
```

The `^=` matches the pattern of `http` on the start of the `href` string which
means it will only display absolute URLs.
