# Check Connected Stripe Account Name

With the Stripe CLI, you can be connected one specific account at a time. When
you run `stripe login`, the browser window where you authenticate will have you
select the account that you want to connect to. This is important because it
impacts test keys, webhooks, where you are sending events, etc.

To check which account you are connected to, you can look in the Stripe config
file for the `display_name`. This is located at `~/.config/stripe/config.toml`.
You can have the Stripe CLI spit out the contents of that file with:

```bash
$ stripe config --list
color = ''
[default]
account_id = 'acct_123abc'
device_name = 'My-MacBook-Pro.local'
display_name = 'Internet Business'
...
```

Let's take this a step further. Here is a one-liner scripted version to check
this value using `grep`, `awk`, and `xargs`:

```bash
$ stripe config --list | grep '^display_name' | awk -F'=' '{print $2}' | xargs
Internet Business
```

The `awk` command is tailored toward parsing a value from a `toml` file.
