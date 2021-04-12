# Create A Public URL For A Local Server

At times while developing an app locally, you need to expose the local server
to the public internet. This can be useful and necessary when working on a
3rd-party integration or when you want to show what you have running locally to
someone else.

In addition to tools like [ngrok](https://ngrok.com/), I've found the
[`localtunnel`](https://github.com/localtunnel/localtunnel) npm package to be
an effective way to quickly expose a localhost port.

```
$ npx localtunnel --port 3000 --subdomain some-custom-subdomain
your url is: https://some-custom-subdomain.loca.lt
```

This will create a `loca.lt` URL with the given subdomain that tunnels
requests to `localhost:3000`. If the `--subdomain` flag is not specified or
what you've specified isn't available, `localtunnel` will generate a random
subdomain.

For the subdomain, I recommend using something sufficiently unique like
`josh-branchaud-04092021`. Using the date has the added benefit of
contextualizing when I generated the URL.

In my experience, these are not long-lived domains. Sometimes the connection
gets interrupted and you'll have to restart it. Often when restarting, the
specified subdomain will then be flagged as unavailable, so you have to tweak
it a little.

Because it is using `npx`, there is nothing to install as long as you already
have `node` itself installed.
