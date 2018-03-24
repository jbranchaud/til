# Add React With Webpacker To A New Rails App

[Webpacker](https://github.com/rails/webpacker) makes it easy to manage
app-like JavaScript in the context of a Rails app. React is a great
candidate for this kind of webpack-powered JavaScript processing pipeline.

To set up a new Rails project with Webpack and React wired up, add the
`--webpack=react` flag:

```bash
$ rails new rails-react-app --webpack=react
```

As part of the generated app, you will get a `app/javascript/packs`
directory with a `hello_react.jsx` file that has a really basic React
component.

[source](https://github.com/rails/webpacker#react)
