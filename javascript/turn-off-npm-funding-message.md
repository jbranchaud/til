# Turn Off npm Funding Message

When you run `npm install`, you'll see a few different details output to your
terminal. One you are probably used to seeing is the one about packages looking
for funding.

```bash
❯ npm install

up to date, audited 253 packages in 2s

88 packages are looking for funding
  run `npm fund` for details

6 vulnerabilities (1 low, 4 moderate, 1 high)
```

If for whatever reason you need to turn off this (e.g. for scripting and CI
purposes), you can globally configure it with the `npm config` command.

```bash
❯ npm config set fund false --location=global
```

Run an `npm install` again and the funding message will no longer show.

This edits the `npmrc` located in the `/etc` directory of wherever your current
version of Node is installed. Running `npm config edit --global` will open you
up to this file as well.

h/t Dillon Hafer
