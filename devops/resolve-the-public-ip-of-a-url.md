# Resolve The Public IP Of A URL

The `dig` command is a utility for doing DNS lookups. You can run it with a
URL argument to lookup the public IP for that domain.

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

The output is a bit noisy, but if you parse down to the _ANSWER SECTION_,
you'll see the IP address that it resolves to.

Alternatively, you can skip the noise and get right to the IP address by
including the `+short` flag.

```bash
$ dig joshbranchaud.com +short
159.203.106.229
```

See `man dig` for more details.
