# Scripting With RVM

Because of how [RVM](https://rvm.io/) works under the hood, you have to do a
couple things to get it to work in a script.

First, you need to ensure that your script is using `bash` instead of `sh`,
so add this to the top of your scripts:

```bash
#!/bin/bash
```

You'll then want to make sure that RVM is sourced. Their
[docs](https://rvm.io/workflow/scripting) recommend sourcing in a script
like this:

```bash
# Load RVM into a shell session *as a function*
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then

  # First try to load from a user install
  source "$HOME/.rvm/scripts/rvm"

elif [[ -s "/usr/local/rvm/scripts/rvm" ]] ; then

  # Then try to load from a root install
  source "/usr/local/rvm/scripts/rvm"

else

  printf "ERROR: An RVM installation was not found.\n"

fi
```

After that, you can utilize any of the capabilities of RVM in your script as
you'd like.
