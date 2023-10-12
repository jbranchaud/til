# Generate Random 20-Character Hex String

The `openssl` utility has a bunch of subcommands including `rand`. The `rand`
subcommand can be used to generate pseudo-random numbers.

```bash
openssl rand -hex 10
5ce459896581abc81a65
```

The number at the end of the command tells `rand` how many bytes of output to
generate. When the `-hex` flag is used, it will encode the output in hex.

The 10 bytes of output in hex will result in a 20-character string. That number
can be adjusted to your needs.

See `man openssl` or `openssl rand -help` for more details.
