# Resolve The IP Address Of A Domain

The `dig` (domain information grouper) command can be used to get more
information about a domain name. To discover the IP address for a given
domain, invoke `dig` with the domain as an argument.

```bash
$ dig joshbranchaud.com

; <<>> DiG 9.8.3-P1 <<>> joshbranchaud.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 62836
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0

;; QUESTION SECTION:
;joshbranchaud.com.             IN      A

;; ANSWER SECTION:
joshbranchaud.com.      1800    IN      A       159.203.106.229

;; Query time: 50 msec
;; SERVER: 75.75.75.75#53(75.75.75.75)
;; WHEN: Sun Apr 14 12:34:52 2019
;; MSG SIZE  rcvd: 51
```

The *answer section* tells me that the IP address for `joshbranchaud.com` is
`198.74.60.157`.

Alternatively, you can skip the noise and get right to the IP address by
including the `+short` flag.

```bash
$ dig joshbranchaud.com +short
159.203.106.229
```

See `man dig` for more details.
