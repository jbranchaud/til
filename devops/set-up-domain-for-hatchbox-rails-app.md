# Set Up Domain For Hatchbox Rails App

When we deploy a Rails app with [Hatchbox](https://hatchbox.io), we are given
an internal URL for publicly accessing our app. It is something like
`https://123abc.hatchboxapp.com`. That's useful as we are getting things up and
running, but eventually we want to point our own domain at the app.

The first step is to tell Hatchbox what domain we are going to use.

From our app's _Domain & SSL_ page we can enter a domain into the _Add A
Domain_ input. For instance, I have the
[visualmode.dev](https://visualmode.dev) domain and I want the
[still.visualmode.dev](https://still.visualmode.dev) subdomain pointing at my
Rails app. I submit the full name `still.visualmode.dev` and I get an _A
Record_ ipv4 address (e.g. `23.12.234.82`).

The second step is to configure a DNS record with our domain registrar.

From the DNS settings of our registrar (e.g. Cloudflare) we can add an _A
Record_ where we specify the name (e.g. `still`) and then include the ipv4
address provided by Hatchbox. We can save this and wait a minute for it to
propagate.

And soon enough we can visit our Rails app at the custom domain.
