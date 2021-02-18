# Generate A SAML Key And Certificate Pair

The `openssl` utility can be used to generate a SAML (Security Assertion Markup
Language) key pair which consists of a public certificate and a private key.

```bash
openssl req -new -x509 -days 365 -nodes -sha256 \
  -out saml.crt \
  -keyout saml.key
```

> The req command primarily creates and processes certificate requests in
> PKCS#10 format. It can additionally create self-signed certificates, for use
> as root CAs, for example.

The flags to `req` are as follows:
- `-new` for a new certificate (cert) request
- `-x509` to output a self-signed cert instead of a cert request
- `-days 365` for a year-long cert
- `-nodes` to not encrypt the private key
- `-sha256` is the digest algorithm for signing the cert
- `-out saml.crt` specifies the certificate output file
- `-keyout saml.key` specifies the private key output file

See `man openssl` and search for `openssl req` for more details.

[source](https://www.lightsaml.com/LightSAML-Core/Cookbook/How-to-generate-key-pair/)
