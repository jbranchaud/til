# Specify Paths For Purging Unused CSS

Tailwind CSS is a full-featured utility class CSS framework. It has just about
everything you need. It also has a bunch of things you probably don't need. And
there is no need to ship the CSS you don't need to the client. Tailwind is able
to exclude the unused CSS through a mechanism called _purging_.

To turn on purging (for _production_) and for Tailwind to know what can be
safely purged, you need to specify one or more _purge paths_ in your
`tailwind.config.js` file. This is a listing of all the places where you use
Tailwind utility classes.

Specify it with an array at the `purge` key:

```javascript
module.exports = {
  purge: [
    "./src/components/**/*.jsx",
    "./pages/**/*.js"
  ],
  darkMode: false,
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [],
};
```

Notice that globbed paths can be used as a way of specifying files located in a
nested directory structure. Above I've stated that any `jsx` files located
anywhere under `src/components/` as well as any `js` files located anywhere
under `pages/` should be checked.

[source](https://tailwindcss.com/docs/optimizing-for-production#basic-usage)
