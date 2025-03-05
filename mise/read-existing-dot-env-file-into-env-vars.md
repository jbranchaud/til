# Read Existing Dot Env File Into Env Vars

Just about any web app that I've worked on has had a `.env` file as a way of
configuring aspects of the app specific to that environment. These typically
are read into the environment with a language-specific
[dotenv](https://github.com/bkeepers/dotenv) tool.

Mise supports this convention. In addition to specifying individual non-secret
env vars, you can also instruct `mise` to read-in a `.env` file like so:

```toml
[env]
PORT=3344
_.file = ".env"
```

The `_.file` line tells `mise` that there is a file `.env` with key-value pairs
that it should read in. It can even handle `.env.json` and `.env.toml` file
formats.

To ensure that `mise` is picking up the values from the `.env` file, you can
run the following command and make sure they show up in the output:

```bash
$ mise env
```

[source](https://mise.jdx.dev/environments/secrets.html)
