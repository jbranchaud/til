# Convert An ePub Document To PDF On Mac

If you have an ePub document and you'd like it in PDF format, you can
convert it using the `ebook-convert` binary from `Calibre`.

First, install `Calibre`:

```bash
$ brew cask install calibre
```

Then convert your ePub using `ebook-convert`:

```bash
$ ebook-convert book.epub book.pdf
```

You'll see a bunch of output as it processes the document. When it
completes, you'll have a nice pdf waiting for you.

[source](https://gist.github.com/AaronO/9962667)
