# Cloudflare Allows CNAME For Apex Domain

If you want to set up a custom root (apex) domain with an app hosting provider
[like
Heroku](https://devcenter.heroku.com/articles/custom-domains#add-a-custom-root-domain),
you're going to need to work with a DNS provider that supports the non-standard
`ALIAS` records (or something equivalent).

In my case, I have my domain registered with Cloudflare. Cloudflare supports
this kind of CNAME lookup of an apex domain through [_CNAME
flattening_](https://developers.cloudflare.com/dns/cname-flattening/).

Unlike other registrars that use a separate `ALIAS` record concept, Cloudflare
allows you to set up a specialized `CNAME` record. Go into the DNS settings for
the domain of interest, click "Add Record", and then select `CNAME`. From there,
instead of entering a traditional subdomain like `www`, you put the `@` symbol
which tells Cloudflare that this is a record for the apex domain. That record
will still point to a target like `abc123.herokudns.com` as a more traditional
`CANME` would do.
