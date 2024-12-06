# List TXT DNS Records For A Domain

The `dig` command can be used to list specifically the `TXT` DNS records for a
domain using the `-t TXT` flag like so:

```bash
$ dig -t TXT visualmode.dev

; <<>> DiG 9.10.6 <<>> -t TXT visualmode.dev
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 41226
;; flags: qr rd ra; QUERY: 1, ANSWER: 2, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;visualmode.dev.                        IN      TXT

;; ANSWER SECTION:
visualmode.dev.         377     IN      TXT     "v=spf1 include:_spf.mx.cloudflare.net ~all"
visualmode.dev.         377     IN      TXT     "google-site-verification=MBZ2S2fhnh2gHRxFniRrYW-O6mdyimJDRFj-f
vblwtk"

;; Query time: 103 msec
;; SERVER: fe80::7c4b:26ff:fe85:e164%6#53(fe80::7c4b:26ff:fe85:e164%6)
;; WHEN: Tue Dec 03 12:49:38 CST 2024
;; MSG SIZE  rcvd: 179
```

This is still rather verbose though. With the `+short` option we can pare down
the output to the values of any TXT records and nothing else.

```bash
$ dig -t TXT visualmode.dev +short
"v=spf1 include:_spf.mx.cloudflare.net ~all"
"google-site-verification=MBZ2S2fhnh2gHRxFniRrYW-O6mdyimJDRFj-fvblwtk"
```

Neat! Now I can see that [my domain is correctly identifying itself with Google
Search Console](internet/verify-site-ownership-with-dns-record.md).

[source](https://serverfault.com/a/148724)
