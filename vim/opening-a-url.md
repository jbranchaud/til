# Opening a URL

Vim makes it easy to quickly open a URL that appears in a file. Simply move
the cursor over the URL and hit `gx`. This will use your respective
operating system's *open* command (e.g. `open` for Mac OS X) to open the
URL.

One caveat is that the URL must contain the protocol/scheme. That is,
`www.duckduckgo.com` won't work, but `https://www.duckduckgo.com` will.

You can also use `gx` to open files on your system.
