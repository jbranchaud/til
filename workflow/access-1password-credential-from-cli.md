# Access 1Password Credential From CLI

With the `op` CLI, I can store things like API keys and secrets in my 1Password
vault and then access them from the command line. This assumes I've already
installed the CLI (`brew install 1password-cli`) and connected it to the
1Password app via the _Developer_ settings.

The `op item get` command takes a credential name and returns all the details
for the entry with that _Title_. Here is how I can access my _Anthropic Claude
API Key_ details.

```bash
$ op item get "Anthropic Claude API Key"
```

With the `--field` flag, I can grab a specific field, such as the `credential`,
from that entry.

```bash
$ op item get "Anthropic Claude API Key" --field credential
sk-ant-api03-abc......xyz
```

A command like this can be embedded in other commands as a way of referencing
secrets without explicitly entering them into your shell history.

```bash
$ curl https://api -H "x-api-key: $(op item get "Anthropic Claude API Key" --field credential)" ...
```
