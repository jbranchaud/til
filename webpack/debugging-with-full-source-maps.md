# Debugging With Full Source Maps

After Webpack runs your JavaScript through various loaders, it no longer
looks like the code you were writing in your editor. This can make debugging
difficult when you inspect the source of an error in the browser's devtools.
Fortunately, Webpack makes it easy to enhance debugging with full source
maps of your code. Just add the following option to your Webpack config:

```javascript
{
  devtool: "source-map",
  ...
}
```

This will generate a full source map with a filename that is something like
`bundle.js.map`.

Note: this will slow down the webpack build process a bit.

Read more about the `devtool` configuration and all the possible options in
the [Webpack
docs](https://webpack.github.io/docs/configuration.html#devtool).
