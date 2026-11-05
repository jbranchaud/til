# Generate A Random Secret Value With OpenSSL

The `openssl` command can generate a random hex-based value like so:

```bash
❯ openssl rand -hex 32
101142ffaf1c6b14395cec5592f6f3739d5ee282a9db27ec2d7ad879540c16a2
```

This is useful if I need to generate a secret key value for authentication in a
feature I'm building. For example, I'm working on a dedicated MCP server that
can only be accessed by a 3rd-party messaging interface. I need to only allow
requests to the MCP endpoint that have a valid secret key. I can use the above
command to generate unique values for both local testing and the actual secret
that ends up in our production vault.

See `man openssl` for more details.
