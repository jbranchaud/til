# Make Environment Variable Publicly Available

You can define environment variables in `.env.development` and
`.env.production` files for use in your app. This is a great way to seamlessly
swap out values that are specific to each environment.

For instance, you might have a base URL for API requests that points to a local
server in development and then to the live server in production.

You could define that value like so:

```
API_BASE_URL=localhost:3000/api/v1
```

The problem you'll quickly run into is in trying to access that value from any
client-side pages or components.

```
process.env.API_BASE_URL //=> undefined
```

Next.js is trying to help us out here. Environment variables are often times
private keys and other secrets that shouldn't be bundled into our public client
code. So Next.js excludes all env vars from the build by default.

Our API's base URL is not a secret though. The way to make env vars like that
publicly avilable is to prepend them with `NEXT_PUBLIC_`.

```
NEXT_PUBLIC_API_BASE_URL=localhost:3000/api/v1
```

Now, it is available anywhere in your client and server code:

```
process.env.NEXT_PUBLIC_API_BASE_URL //=> 'localhost:3000/api/v1'
```

[source](https://nextjs.org/docs/basic-features/environment-variables#exposing-environment-variables-to-the-browser)
