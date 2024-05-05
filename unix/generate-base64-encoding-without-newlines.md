# Generate Base64 Encoding Without Newlines

There are a variety of tools that can generate a Base64 encoding of given text.
Most of them that I've encountered have a number of characters at which they
introduce a newline character. Here is `openssl` as an example:

```bash
❯ echo "here is a long bit of text to base64 encode with openssl" | openssl base64
aGVyZSBpcyBhIGxvbmcgYml0IG9mIHRleHQgdG8gYmFzZTY0IGVuY29kZSB3aXRo
IG9wZW5zc2wK
```

[The theory I've seen](https://superuser.com/a/1225139) is that this is to
accommodate 80-character terminal screens when chunks of encoding were included
in emails.

With the `openssl base64` command, there is not an option to exclude the
newlines, but we can pipe it through `tr` to remove them.

```bash
❯ echo "here is a long bit of text to base64 encode with openssl" | \
  openssl base64 | \
  tr -d '\n'
aGVyZSBpcyBhIGxvbmcgYml0IG9mIHRleHQgdG8gYmFzZTY0IGVuY29kZSB3aXRoIG9wZW5zc2wK
```
