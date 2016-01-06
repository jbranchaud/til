# Enable ES7 Transforms With react-rails

The [`react-rails`](https://github.com/reactjs/react-rails) gem adds JSX and
ES6 transforms to the asset pipeline.  By using `.js.jsx` and `.es6.jsx`
extensions with relevant files, the asset pipeline will know to make the
appropriate transformation when compiling application assets. ES7 transforms
are not enabled by default, but can be configured. Add the following to the
`config/application.js` file to allow ES7's *class properties* syntax:

```ruby
config.react.jsx_transform_options = {
  optional: ["es7.classProperties"]
}
```

h/t Mike Chau
