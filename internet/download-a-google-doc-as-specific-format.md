# Download A Google Doc As Specific Format

I was recently given a public Google Doc URL and I was curious if I could
download it from the command line. I didn't want to have to install special CLI
though. I was hoping to use something like `curl`.

A brief chat with Claude and I learned that not only can I use `curl`, but I
can specify the format in the _export_ URL.

```bash
$ export GOOGLE_DOC_URL="https://docs.google.com/document/d/157rMgHeBf76T9TZnUjtrUyyS2XPwG0tObr-OjYNfMaI"

$ echo $GOOGLE_DOC_URL
https://docs.google.com/document/d/157rMgHeBf76T9TZnUjtrUyyS2XPwG0tObr-OjYNfMaI

$ curl -L "$GOOGLE_DOC_URL/export?format=pdf" -o doc.pdf
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   414    0   414    0     0   2763      0 --:--:-- --:--:-- --:--:--  2895
100 16588    0 16588    0     0  56214      0 --:--:-- --:--:-- --:--:--  167k

$ ls doc.pdf
doc.pdf
```

I append `/export` and then include the `?format=pdf` query param to specify
that I want the document to be exported in PDF format. With the `-o` flag I can
specify the name and extension of the output file.

This is a handy on its own, but noticing that Google Docs supports other export
formats, I thought it would be useful to go back-and-forth with Claude to
sketch out a script that can do this and prompt me (with `fzf`) for the file
type -- [here is the gist for
`gdoc-download`](https://gist.github.com/jbranchaud/cf3d2028107a1bd8484eed7cca0fcdab).
