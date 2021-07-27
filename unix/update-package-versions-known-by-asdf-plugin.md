# Update Package Versions Known By asdf Plugin

When you run `asdf list-all ruby`, asdf will list all the package versions it
knows about for that plugin. This list is based on when the plugin was most
recently installed or updated. If it has been a while, there are likely new
versions that asdf doesn't know about.

This list can be updated with the [`plugin-update`
command](https://asdf-vm.com/manage/plugins.html#update):

```bash
$ asdf update-plugin ruby
$ asdf plugin-update ruby
```

Now, the next time you run `asdf list-all ruby`, you'll have an up-to-date
listing of available package versions.
