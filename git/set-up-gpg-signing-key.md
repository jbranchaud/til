# Set Up GPG Signing Key

I wanted to have that "Verified" icon start showing up next to my commits in
GitHub. To do that, I need to generate a GPG key, configure the secret key in
GitHub, and then configure the public signing key with my git config.

```bash
# generate a gpg key
$ gpg --full-generate-key

# Pick the following options when prompted
# - Choose "RSA and RSA" (Options 1)
# - Max out key size at 4096
# - Choose expiration date (e.g. 0 for no expiration)
# - Enter "Real name" and "Email"
    (I matched those to what is in my global git config)
# - Set passphrase (I had 1password generate a 4-word passphrase)
```

It may take a few seconds to create.

I can see it was created by listing my GPG keys.

```bash
$ gpg --list-secret-keys --keyid-format=long
[keyboxd]
---------
sec   rsa4096/1A8656918A8D016B 2025-10-19 [SC]
...
```

I'll need the `1A8656918A8D016B` portion of that response for the next command
and it is what I set as my public signing key in my git config.

First, though, I add the full key block to my GitHub profile which I can copy
like so:

```bash
$ gpg --armor --export 1A8656918A8D016B | pbcopy
```

And then I paste that as a new GPG Key on GitHub under _Settings_ -> _SSH and
GPG Keys_.

Last, I update my global git config with the signing key and the preference to
sign commits:

```bash
git config --global user.signingkey 1A8656918A8D016B
git config --global commit.gpgsign true
```

Without `commit.gpgsign`, I would have to specify the `-S` flag every time I
want to create a signed commit.

[source](https://git-scm.com/book/ms/v2/Git-Tools-Signing-Your-Work)
