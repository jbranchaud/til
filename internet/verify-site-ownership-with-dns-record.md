# Verify Site Ownership With DNS Record

To run your site through Google Search Console and get detailed reports, you
need to verify that you own the site. There are several manual ways of doing
this that involve sticking a value unique to your URL in a file or header tag.
There is a better way though.

By adding a TXT DNS record wherever you domain's DNS is managed, you can prove
to Google that you own the domain. That verification applies to all paths and
subdomains of that domain.

Some providers like Cloudflare have a mostly-automated process for this that
Google can hook into as long as you grant permission via OAuth.

You can also manually create the TXT record if necessary.

Either way, it will look something like:

```bash
$ dig -t TXT visualmode.dev

;; ANSWER SECTION:
visualmode.dev.         377     IN      TXT     "google-site-verification=MBZ2S2fhnh2gHRxFniRrYW-O6mdyimJDRFj-f
vblwtk"
```

More details are provided in the [Google Search Console
docs](https://support.google.com/webmasters/answer/9008080?hl=en#domain_name_verification).
