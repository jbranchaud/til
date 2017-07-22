# Specify Port Of CRA's Webpack Dev Server

[`create-react-app`](https://github.com/facebookincubator/create-react-app)
gives you a set of scripts, one of which allows you to start a development
server that bundles and serves your javascript. This is handled under the
hood via `webpack-dev-server`. By default it attempts to serve from port
`3000`. If port `3000` is taken it will attempt to connect to another
sequential port.

Alternatively, you can just specify the port when starting the development
server. This can be done with the `PORT` env var.

```bash
$ PORT=3333 yarn start
```
