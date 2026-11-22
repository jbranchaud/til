# Connect To Hatchbox Rails Console

Here is the `rails production:console` task I have set up in
[still](https://still.visualmode.dev/) to be able to connect directly to the
production `rails console`.

```ruby
require "shellwords"

module HatchboxRemote
  HOST = ENV.fetch("HATCHBOX_HOST", "deploy@82.133.104.26")
  APP_DIR = "/home/deploy/#{ENV.fetch("HATCHBOX_APP", "visualmode-dev-rails-app")}"

  def self.exec_rails!(*args, tty: true)
    remote = <<~SH.strip
      set -e
      app_dir=#{Shellwords.escape(APP_DIR)}
      cd "$app_dir/current"
      env_file=
      for f in "$app_dir/.hatchbox.env" "$app_dir/.env"; do
        [ -f "$f" ] && { env_file=$f; break; }
      done
      [ -n "$env_file" ] || { echo "missing $app_dir/.hatchbox.env (or .env)" >&2; exit 1; }
      set -a; . "$env_file"; set +a
      RAILS_ENV=production exec bin/rails #{Shellwords.join(args)}
    SH

    exec("ssh", *("-t" if tty), HOST, remote)
  end
end

namespace :production do
  desc "Open a rails console on the hatchbox production server"
  task :console do
    HatchboxRemote.exec_rails!("console")
  end
end
```

There is a lot going on here, but I can break it down into four parts.

1. `#exec_rails!` is defined as an all-purpose method to execute whatever `rails ...` command you want against the remote (hatch)box with the full app env
   loaded.

2. `remote` is a heredoc that gets assigned a series of shell commands which (a)
   `cd` into the _current_ app directory, (b) load the app's `.env`, and (c)
   runs `bin/rails` with whatever args have been passed in.

3. Everything in 2 gets injected into an `exec` which runs through SSH with the
   `-t` flag (since the console needs an interactive connection) against the
   `HATCHBOX_HOST`.

4. The actual rake task gets to lean on all the above complexity by simply
   passing `console` to `HatchboxRemote.exec_rails!`.

The task in `mise.toml` ends up looking like this:

```toml
[tasks."production:console"]
run = "bin/rails production:console"
description = "Open a Rails console on the hatchbox production server (override with HATCHBOX_HOST, HATCHBOX_APP)"
depends = ["bundle-install"]
raw = true
```
