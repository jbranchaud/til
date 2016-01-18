# Determine The IP Address Of A Domain

The `dig` (domain information grouper) command can be used to get more
information about a domain name. To discover the IP address for a given
domain, invoke `dig` with the domain as an argument.

```bash
$ dig joshbranchaud.com

; <<>> DiG 9.8.3-P1 <<>> joshbranchaud.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 26589
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0

;; QUESTION SECTION:
;joshbranchaud.com.             IN      A

;; ANSWER SECTION:
joshbranchaud.com.      86400   IN      A       198.74.60.157

;; Query time: 118 msec
;; SERVER: 75.75.75.75#53(75.75.75.75)
;; WHEN: Sun Jan 17 22:32:18 2016
;; MSG SIZE  rcvd: 51
```

The *answer section* tells me that the IP address for `joshbranchaud.com` is
`198.74.60.157`.

See `man dig` for more details.
