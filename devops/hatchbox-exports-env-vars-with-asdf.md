# Hatchbox Exports Env Vars With asdf

When you add env vars through the [Hatchbox](https://hatchbox.io/) UI, they get
exported to the environment of the asdf-shimmed processes. This is handled by
the [`asdf-vars` plugin](https://github.com/excid3/asdf-vars). That plugin
looks for `.asdf-vars` in the current chain of directories.

I can see there are many `.asdf-vars` files:

```bash
$ find . -name ".asdf-vars" -type f
./.asdf-vars
./my-app/.asdf-vars
./my-app/releases/20250120195106/.asdf-vars
./my-app/releases/20250121041054/.asdf-vars
```

And it is the one in my app's directory that contains the env vars that I set
in the UI.

```bash
$ cat my-app/.asdf-vars
BUNDLE_WITHOUT=development:test
DATABASE_URL=postgresql://user_123:123456789012345@10.0.1.1/my_app_db
PORT=9000
RACK_ENV=production
RAILS_ENV=production
RAILS_LOG_TO_STDOUT=true
RAILS_MASTER_KEY=abc123
SECRET_KEY_BASE=abc123efg456
```

When I run a shimmed process like `ruby`, those env vars are loaded into the
process's environment.

```bash
$ cd my-app/current
$ which ruby
/home/deploy/.asdf/shims/ruby
$ ruby -e "puts ENV['DATABASE_URL']"
postgresql://user_123:123456789012345@10.0.1.1/my_app_db
```

[source](https://www.visualmode.dev/hatchbox-manages-env-vars-with-asdf)
