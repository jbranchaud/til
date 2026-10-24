# Create 1Password Login Item From The CLI

The default shape of a login item in 1Password is _Username_ and _Password_.
Whenever I'm trying to save something in 1Password, like an AWS Access Key for
example, I find myself manually adjusting the fields to get it into the right
shape for that item.

What I realized would be nicer is using [`op` (the 1Password
CLI)](https://www.1password.dev/cli) to create a login item with the shape I
want (which I can later reference in my shell history). Then I can pop open the
desktop app and update the latest entry with the actually secret values that I
copy from, in this case, the AWS Console.

```bash
❯ op item create --vault "Personal" --category login --title "AWS - jbranchaud-lastword-cli" \
  'Access Key ID[text]=TODO' \
  'Secret Access Key[concealed]=TODO' \
  'Default region[text]=us-east-1'
ID:          abc123
Title:       AWS - jbranchaud-lastword-cli
Vault:       Personal (efg456)
Created:     now
Updated:     now
Favorite:    false
Version:     1
Category:    LOGIN
Fields:
  Access Key ID:        TODO
  Secret Access Key:    [use 'op item get abc123 --reveal' to reveal]
  Default region:       us-east-1
```

In this command I point to my `Personal` vault, I update the title of the login
item inline, and then I have some custom fields on the item that match the shape
of this scenario.

When I hit enter, a listing of fields is output. I can then hop over to the
desktop app to set the actually ID and secret for the access key.
