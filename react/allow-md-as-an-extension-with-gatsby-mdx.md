# Allow md As An Extension With gatsby-mdx

The [gatsby-mdx](https://github.com/ChristopherBiscardi/gatsby-mdx) plugin
allows you to create pages in a Gatsby project using `.mdx` files. If you
prefer the `.md` extension on your markdown files, then you can adjust the
plugin options to allow that.

```javascript
// gatsby-config.js
plugins: [
  {
    resolve: `gatsby-mdx`,
    options: {
      extensions: [".mdx", ".md"]
    }
  }
]
```

This tells `gatsby-mdx` to recognize both `.mdx` and `.md` extensions when
processing files.
