# Prevent Search Engines From Indexing A Page

The `robots.txt` file is commonly used to tell (well-behaved) crawlers, such as
search engines, to not visit a page. If another page links to your page, it
will still be indexed. To instruct search engines to not index a given page,
robot meta tags need to be used.

> If you want to reliably block a page from showing up in the search results,
> you need to use a meta robots `noindex` tag. That means that, in order to
> find the `noindex` tag, the search engine has to be able to access that page,
> so don’t block it with `robots.txt`.
> [source](https://yoast.com/ultimate-guide-robots-txt/)

To prevent indexing, add the following meta tag to the `<head>` section of any
relevant pages.

```html
<meta name="robots" content="noindex">
```

[source](https://developers.google.com/search/docs/advanced/crawling/block-indexing)
