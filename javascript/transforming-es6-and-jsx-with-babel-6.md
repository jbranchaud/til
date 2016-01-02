# Transforming ES6 and JSX With Babel 6

With Babel 5, transforming ES6 and JSX into ES5 code was accomplished by
including the `babel-loader`. This would be configured in
`webpack.config.js` with something like the following:

```javascript
module: {
  loaders: [
    {
      test: /\.jsx?$/,
      exclude: /node_modules/,
      loader: 'babel-loader',
    }
  ],
},
```

Now, with Babel 6, the different parts of the loader have been broken out
into separate plugins. These plugins need to be installed

```
$ npm install babel-preset-es2015 babel-preset-react --save-dev
```

and then included as presets

```javascript
module: {
  loaders: [
    {
      test: /\.jsx?$/,
      exclude: /node_modules/,
      loader: 'babel-loader',
      query: {
        presets: ['es2015', 'react']
      },
    }
  ],
},
```

Alternatively, the presets can be specified in the project's `.babelrc` file.

[Source](http://jamesknelson.com/the-six-things-you-need-to-know-about-babel-6/)
