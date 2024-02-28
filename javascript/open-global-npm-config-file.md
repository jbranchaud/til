# Open Global npm Config File

There are a ton of configuration settings for `npm`. I can open up the global
`npmrc` file where those configs live with the following command:

```bash
$ npm config edit --global
```

This will open up the file in my default editor (e.g. `vim`).

There are over 100 settings that are commented out with their default values. I
can override these as needed by uncommenting them and setting them to the
desired value.

There is some useful info in the first few lines:

```
;;;;
; npm globalconfig file: /Users/me/.asdf/installs/nodejs/20.10.0/etc/npmrc
; this is a simple ini-formatted file
; lines that start with semi-colons are comments
; run `npm help 7 config` for documentation of the various options
```

1. I can see that the location of the file is specific to the version of node
   that I current have shimmed. In this case, it's `20.10.0`. If I switch node
   versions, there will be a different `envrc` to configure.

2. I can get more info about these config values by running `npm help 7 config`.
