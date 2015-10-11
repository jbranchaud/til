# SSH With A Specific Key

When you SSH into another machine using public key authentication, the
key pair from either `~/.ssh/id_dsa`, `~/.ssh/id_ecdsa`, or `~/.ssh/id_rsa`
is used by default. This is generally what you want. But what if the target
server is expecting to identify you with a different SSH key pair?

The `-i` option can be used with `ssh` to specify a different _identity
file_ when the default isn't what you want.
