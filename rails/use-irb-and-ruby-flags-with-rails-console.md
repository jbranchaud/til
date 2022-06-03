# Use IRB And Ruby Flags With Rails Console

The `rails console` command only accepts two flags `--environment` and
`--[no-]sandbox`. However, the `rails console` is built on top of IRB and Ruby,
so it can accept flags that those commands understand.

You can't pass an IRB flag directly to `rails console` though because it
doesn't consider those part of its repertoire.

```bash
$ rails console --sandbox -r './vendor/setup_records.rb'
```

It will put the session in sandbox mode, but it doesn't know what to do with
`-r`.  We have to explicitly separate its flags from flags that should be
passed through. This is done with the `--` CLI convention.

```bash
$ rails console --sandbox -- -r './vendor/setup_records.rb'
```

Everything after the `--` gets passed along to IRB.
