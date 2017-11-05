# Access Env Vars In create-react-app

Environment-specific configurations are an important part of most
applications. You can access environment variables in your create-react-app
code using `process.env`.

There are a couple built-in environment variables, such as `NODE_ENV`.
Anything custom that you want to provide must be prepended with
`REACT_APP_`. If it isn't, that environment variable will be ignored with no
warning.

The following line of code

```javascript
const base_api_url = process.env.REACT_APP_BASE_API_URL;
```

will have access to whatever that value is in the environment when the
server is started or the app is built.

Set that value inline like so:

```
REACT_APP_BASE_API_URL="https://api.my_app.com" yarn start
```

[source](https://github.com/facebookincubator/create-react-app/blob/master/packages/react-scripts/template/README.md#adding-custom-environment-variables)
