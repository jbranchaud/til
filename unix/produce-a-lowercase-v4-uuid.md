# Produce A Lowercase V4 UUID

There are [a variety of ways to produce a v4
UUID](different-ways-to-generate-a-v4-uuid.md) on Unix-based machines. Of the
options I listed in that post, my favorite is the `uuidgen` command. My only
gripe with it is that it produces an all uppercase UUID.

```bash
$ uuidgen
B7918C26-12AE-4093-B6DA-0D7D41C59FB6
```

Often when I need a UUID, it is to plug in as the ID value for some test data
in a system that is using lowercase UUIDs. For the sake of consistency, I'd
like it to be lowercase as well.

The `tr` command comes in handy for this because I can _tr_anslate the
uppercase characters to lowercase ones.

```bash
$ uuidgen | tr '[:upper:]' '[:lower:]'
ed817cf3-8f70-4838-82bc-8e5b328c0b93
```

So now anytime I need a lowercase UUID, I hit `ctrl-r` and search back for
either `uuid` or `lower` and find this command pretty quickly.
