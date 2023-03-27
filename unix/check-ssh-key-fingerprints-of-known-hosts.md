# Check SSH Key Fingerprints Of Known Hosts

The `ssh-keygen` utility can do a bunch of things related to SSH keys including
generating key pairs, removing a key, and even showing the fingerprints for a
public keys file.

After [the recent GitHub SSH key
rotation](https://github.blog/2023-03-23-we-updated-our-rsa-ssh-host-key/), I
wanted to check that the key I had added produced a fingerprint matching what
they described in the article.

The `-l` flag will list the fingerprints and the `-f` flag allows you to
specify what file it processes when doing that.

```bash
ssh-keygen -lf ~/.ssh/known_hosts
```

I have a bunch of known hosts, so I can narrow it down to just the GitHub entry
like so.

```bash
ssh-keygen -lf ~/.ssh/known_hosts | grep github.com
3072 SHA256:uNiVztksCsDhcc0u9e8BujQXVUpKZIDTMczCvj3tD2s github.com (RSA)
```

And [it matches what GitHub
lists](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/githubs-ssh-key-fingerprints),
so I'm good to go.

See `man ssh-keygen` for more details.
