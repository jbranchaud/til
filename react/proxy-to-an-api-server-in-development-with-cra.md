# Proxy To An API Server In Development With CRA

[create-react-app](https://github.com/facebookincubator/create-react-app) is
a great way to bootstrap a React project, especially if you are building a
single-page app. When building an SPA, you more likely than not will have a
backend API that you interact with.

You can set up your React app to interact with that backend API server in
development using the `proxy` configuration in `package.json`.

```json
// package.json
  ...
  "proxy": "http://localhost:4000",
}
```

This will allow you to keep your API calls nice and clean.

```javascript
fetch("/api/session", ...
```

No need to manage some sort of _host URL_ environment variable.

Additionally, this will remove an CORS issues because the `webpackDevServer`
will be proxying any paths that it doesn't recognize to the host and port
that you've specified.

See [the `create-react-app`
docs](https://github.com/facebookincubator/create-react-app/blob/master/packages/react-scripts/template/README.md#proxying-api-requests-in-development)
for more details.
