# Tell direnv To Load The Env File

By default [`direnv`](https://direnv.net/) looks for and evaluates the `.envrc`
file that appears in a given project directory. This default behavior is good
for things like setting certain path dependencies (e.g. a specific version of
node or postgres).

To the end of using `direnv` to set up the development environment, it can be
useful to have it also load the `.env` file into the current shell's
environment.

To get `direnv` to do that, add this line to the `.envrc` file:

```
dotenv_if_exists .env
```

This specific loads all the environment variables in `.env`. If there are other
files, such as `.env.development` that need to be loaded in, those can be
included with additional
[`dotenv_if_exists`](https://direnv.net/man/direnv-stdlib.1.html#codedotenvifexists-ltdotenvpathgtcode)
declarations.
