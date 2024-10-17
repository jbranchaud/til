# Configure Email Redirect With Cloudflare

I have a domain registered with Cloudflare --
[visualmode.dev](https://www.visualmode.dev). I want to be able to sign up for
services and receive emails as `josh@visualmode.dev`. I don't want a separate
inbox that I have to check though.

The solution, for me, is to have Cloudflare redirect incoming emails to an
email address/inbox that I'm already regularly checking.

On the _Email_ dashboard there is a _Routing Rules_ tab. In the _Custom
Addresses_ section, I can click _Create Address_. There I specify the custom
address (what will appear before the `@`), the action to make ("Send to an
email"), and the destination (the existing email address for an inbox I
regularly check).

Finally, I hit _Save_. If they don't already exist, I'll be prompted to confirm
the setup of MX records for the domain. After confirming that, I should be able
to receive emails via that new address.

The Email Routing dashboard will even show me a summary of all rerouted emails.

[source](https://blog.cloudflare.com/introducing-email-routing/#cloudflare-email-routing)
