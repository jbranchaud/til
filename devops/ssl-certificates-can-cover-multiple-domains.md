# SSL Certificates Can Cover Multiple Domains

When registering an SSL certificate, you can list multiple domains to be
covered by it.

One use case is registering a certificate that covers both the apex domain
(`example.com`) and all subdomains using a wildcard (`*.example.com`). The
wildcard alone will not cover `example.com`. If you want `example.com`,
`www.example.com`, `blog.example.com`, etc. covered under the same certificate,
then you'll need to include both the apex and wildcard domains.
