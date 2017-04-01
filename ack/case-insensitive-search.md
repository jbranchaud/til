# Case-Insensitive Search

Use the `-i` flag to perform a case-insensitive search with `ack`.

```bash
$ ack -i easter

ack/ack-bar.md
3:The [`ack`](https://beyondgrep.com/) utility has a fun Easter egg that dumps

postgres/configure-the-timezone.md
18:Eastern time.
```

If you are a Vim user, you may be familiar with `smart-case`. The
`--smart-case` option is a related Ack feature worth checking out.

See `man ack` for more details.
