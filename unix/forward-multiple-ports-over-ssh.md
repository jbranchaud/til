# Forward Multiple Ports Over SSH

I sometimes find myself doing web app development on another machine via an SSH
connection. If I have the server running on port 3000, then I like to use
SSH's port forwarding feature so that I can access `localhost:3000` on my
physical machine.

```bash
$ ssh dev@server.com -L 3000:localhost:3000
```

What if I have two different servers running? I'd like to port forward both
of them -- that way I can access both.

SSH allows you to forward as many ports as you need. The trick is to specify
a `-L` for each.

```bash
$ ssh dev@server.com -L 3000:localhost:3000 -L 9009:localhost:9009
```
