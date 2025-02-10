# Limit Protocols Used In A cURL Command

I was about to install [`atuin`](https://github.com/atuinsh/atuin). I went to
their _Quick Start_ section to grab whatever command I would need to install
it. It was a `curl` statement piped to `sh`. The thing that caught my attention
though was I `curl` flag that I didn't recognize — `--proto`.

> Tells curl to limit what protocols it may use for transfers.

Using `curl --proto '=https' ...` we can enforce that only an `https` URL can
be used in this command.

Here is what happens if I try to run the `atuin`-provided `curl` command after
I have downgraded their URL to be `http`:

```bash
curl --proto '=https' --tlsv1.2 -LsSf http://setup.atuin.sh | sh
curl: (1) Protocol "http" not supported or disabled in libcurl
```

It doesn't even attempt the request. The protocol is considered unsupported and
the command immediately fails.

In addition to only installing software we trust, we should make sure we are
only doing so over a protocol we trust (namely, `https`).

See `man curl` for more details, including about the modifiers (`=`, `+`, `-`).
