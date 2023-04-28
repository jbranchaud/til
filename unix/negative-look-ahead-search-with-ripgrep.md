# Negative Look-Ahead Search With ripgrep

I have a huge monorepo with a bunch of instances of the
`NEXT_PUBLIC_SANITY_DATASET` env var that need to be updated to
`NEXT_PUBLIC_SANITY_DATASET_ID` (notice the `_ID` appended to the end). If I do
a basic search for `NEXT_PUBLIC_SANITY_DATASET`, I get a huge list of results
cluttered with all the instances where this env var has already been updated.

To get a list of _only_ the places where the old env var, and not the new env
var, appear, I need to use [a regex feature called a negative
look-ahead](https://www.regular-expressions.info/lookaround.html). That looks
something like `PATTERN(?!NLA)` where we want to match on `PATTERN`, but not if
it is immediately followed by `NLA`.

Let's try that with [ripgrep](https://github.com/BurntSushi/ripgrep):

```bash
$ rg 'NEXT_PUBLIC_SANITY_DATASET(?!_ID)' --hidden --glob '!node_modules/**' --glob '!.git/**'
regex parse error:
    NEXT_PUBLIC_SANITY_DATASET(?!_ID)
                              ^^^
error: look-around, including look-ahead and look-behind, is not supported

Consider enabling PCRE2 with the --pcre2 flag, which can handle backreferences
and look-around.
```

It doesn't work as is, but the error message helpfully tells me that I need to
include the `--pcre2` flag for look-ahead to work.

Let's try that again:

```bash
❯ rg --pcre2 'NEXT_PUBLIC_SANITY_DATASET(?!_ID)' --hidden --glob '!node_modules/**' --glob '!.git/**'
apps/testing-javascript/.env.development
37:NEXT_PUBLIC_SANITY_DATASET=production
...
```

That works!
