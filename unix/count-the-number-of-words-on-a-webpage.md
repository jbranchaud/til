# Count The Number Of Words On A Webpage

I was reading through a couple sections of the `postfix` documentation and I
was astounded at how large the webpage is, and that is just for the `main.cf`
file format.

Curiosity got the best of me and I wanted to get a sense of the magnitude of
the page. A word count seemed like a good measure.

Using `pandoc` and a couple other unix utilities, I was able to quickly get
that number.

```bash
curl -s http://www.postfix.org/postconf.5.html\#virtual_mailbox_maps | pandoc -f html -t plain | wc -w
   88383
```

Generically, that is:

```bash
curl -s url | pandoc -f html -t plain | wc -w
```

Pandoc produces a plain-text version of the HTML page that was pulled in by
`curl` and then we use `wc` to get a word (`-w`) count.
