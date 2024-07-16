# Avoid Conflicting Files

When Next.js is bundling and building your project, it will get completely
tripped up by any instance of conflicting project files. What I mean by
conflicting project files are two JavaScript or TypeScript (or flavors of JSX
files) that would resolve to the same thing.

Here is one example where the extensions differ:

```
src/pages/welcome.tsx
src/pages/welcome.jsx
```

Here is another example where the paths differ but the bundled result would
conflict:

```
src/pages/welcome.tsx
src/pages/welcome/index.tsx
```

If you have any instances of these conflicting files, you'll be presented with
a beguiling and cryptic error message when trying to run the dev server.

```
TypeError [ERR_INVALID_ARG_TYPE]: The "to" argument must be of type string. Received undefined
    at new NodeError (node:internal/errors:405:5)
    at validateString (node:internal/validators:162:11)
    at Object.relative (node:path:1191:5)
    at Watchpack.<anonymous> (/my_app/node_modules/.pnpm/next@14.2.5_@babel+core@7.24.9_react-dom@18.3.1_react@18.3.1/node_modules/next/dist/server/lib/router-utils/setup-dev-bundler.js:381:55) {
  code: 'ERR_INVALID_ARG_TYPE'
}
```

One of those files needs to go. Remove one of them and you'll be good to go.
