# Use React 16 With Gatsby

[Gatsby](https://www.gatsbyjs.org/), the blazing fast static site generator
for React, is tied to React 15.6. If you've been using React 16+ for a
while, then this may come as a bit of a buzzkill.

Fortunately, there is a Gatsby plugin that let's you use React 16 with a
Gatsby v1 site --
[gatsby-plugin-react-next](https://github.com/gatsbyjs/gatsby/tree/master/packages/gatsby-plugin-react-next).

Add it the plugin as a dependency:

```bash
$ yarn add gatsby-plugin-react-next
```

Then add it to the list of plugins in `gatsby-config.js`:

```javascript
plugins: [`gatsby-plugin-react-next`];
```

[source](https://twitter.com/gatsbyjs/status/990806495959826432)
