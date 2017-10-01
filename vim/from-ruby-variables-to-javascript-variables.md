# From Ruby Variables To JavaScript Variables

I sometimes find myself writing so much Ruby that as soon as I am back in
a JavaScript file, my code starts looking like this:

```javascript
const my_javascript_var = 123;
```

It would be easy enough to hit `caw` to the delete the entire word and then
retype it as camel case. I happen to have the
[Abolish.vim](https://github.com/tpope/vim-abolish) plugin installed, so
there is an even quicker way.

If I hit `crc` over the variable, it will be _coerced_ to camel case.

```javascript
const myJavascriptVar = 123;
```

If I hit `crs` then it will be _coerced_ back to snake case. Hit `crc` one
more time and I can get back to writing some JavaScript.

See `:h abolish-coercion` for more details.
