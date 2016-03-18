# Use A Specific Config File

When running `webpack`, the default config file that it looks for is
`webpack.config.js`. If you have a project that uses different webpack
config files for different environments, you will need to specify which
config file webpack should use. The `--config` flag can be used with
`webpack` to specify that file. For instance, if you want to use your
production webpack config, run a command like the following:

```
$ webpack --config webpack.config.production.js
```
