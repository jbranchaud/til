# Print Milliseconds In Human-Readable Format

I ran a command in a program. It doesn't really matter what command or program.
What does matter is that it took a long time and when it finished, it told me
how long it took, but in milliseconds.

```
835953ms
```

Typically, when I see a timing number like this, I open Alfred and do some
quick math (`N / 1000 / 60 / 60` or something like that).

There is an easier way, using the
[`pretty-ms-cli`](https://github.com/sindresorhus/pretty-ms-cli). This
purpose-built CLI can be run using something like
[`npx`](https://www.npmjs.com/package/npx). All I do is hand it the number of
milliseconds and it prints out how long that is in something that I can
understand.

```bash
❯ npx pretty-ms-cli 835953
13m 56s
```
