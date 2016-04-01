# Running ES6 Specs With Mocha

If your JavaScript specs contain ES6 syntax, [Mocha](https://mochajs.org/),
by default, will not be able to interpret and run them. In order to run them
with Mocha, you will need to tell Mocha to use something like
[Babel](http://babeljs.io/) to compile them. The `--compile` flag can be
used to point Mocha to the `babel-core/register` package.

```
$ mocha --compilers js:babel-core/register path/to/specs/*.spec.js
```

If you already have a test command specified in your `package.json` file,
you can update it with the `--compile` portion of the above command.

This all assumes you've already setup your project with Babel and Babel
presets.

[source](http://jamesknelson.com/testing-in-es6-with-mocha-and-babel-6/)
