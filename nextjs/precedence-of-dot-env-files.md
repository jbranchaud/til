# Precedence Of Dot Env Files

_Dot Env_ files like `.env`, `.env.development`, `.env.local`, etc. are one of
the main ways to configure your Next.js app across various environments.

It's not uncommon to see several different `.env*` files in production app that
is under active development.

Here is an example of almost every variant in play:

```bash
$ ls -a -1 .env*
.env
.env.development
.env.development.local
.env.development.local.example
.env.local
.env.production
.env.test
```

So, how does Next.js decide which files to load and in what order?

It will always attempt to load `.env` and `.env.local` (except in `test`) if
those exist. It will also look for environment-specific files based on the
`NODE_ENV` (which can be one of `development`, `test`, or `production`). So, in
`development`, the `.env.development` and `.env.development.local` will be
loaded. Something like `.env.development.local.example` isn't on the list, but
rather is a convention for a dotenv file's template.

As for the order, the environment itself (your system's environment variables)
which are present in `process.env` take the highest precedence. After that, it
looks in any of the follow present files in this order, stopping once it finds
what it is looking for:

- `.env.$(NODE_ENV).local`
- `.env.local`
- `.env.$(NODE_ENV)`
- `.env`

[source](https://nextjs.org/docs/pages/building-your-application/configuring/environment-variables#environment-variable-load-order)
