# Use Negative Lookbehind Matching With ripgrep

The most straightforward way to use `ripgrep` is to hand it a pattern. It will
take that pattern and move forward through each file trying to find matches.

```bash
$ rg 'TwilioClient\.new'
```

That will find all occurrences of `TwilioClient.new` in available project files.

What if that pattern is too permissive though? That is going to match on
occurrences of `TwilioClient.new` as well as things like
`LoggingTwilioClient.new`. If we want to exclude the latter, there are a few
ways to do that. One of them being the use of [the _negative lookbehind_ regex
feature](https://www.pcre.org/current/doc/html/pcre2syntax.html#SEC23) that is
available with PCRE2 (Perl-Compatible Regular Expressions).

A _negative lookbehind_ is like a standard pattern. We look forward through the
document for the base pattern (like `TwilioClient\.new`). However, once we find
that match, we then look back at the previous characters and if they match our
negative lookbehind pattern, then it is no longer a positive match.

We can use one of the following to forms to achieve this:

```
  (?<!...)                    )
  (*nlb:...)                  ) negative lookbehind
  (*negative_lookbehind:...)  )
```

For instance, here is what this looks like for our example:

```bash
$ rg -P '(?<!Logging)TwilioClient\.new'
```

Note: we have to use the `-P` flag to tell `ripgrep` that we are using PCRE2
syntax. Otherwise, it assumes a simpler regex syntax that doesn't support
_negative lookbehind_.

See `man rg` for more details.
