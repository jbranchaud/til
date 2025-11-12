# Shorten SSH Commands With Aliases

Each time I need to SSH into one of my remote app boxes, like _staging_, I run a
command like the following:

```bash
$ ssh root@staging-box.com
```

Instead of having to remember the user and domain, I can add aliases to my
`~/.ssh/config` file.

```
# Staging Server
Host staging
    HostName staging-box.com
    User root

# Sandbox Server
Host sandbox
    HostName sandbox-box.com
    User root
```

Then I can SSH to each of these like so:

```bash
$ ssh staging

$ ssh sandbox
```

These aliases help a little bit, but they will help even more in situations
where I need other settings configured for the SSH sessions like `Port` or
`ForwardAgent`.
