# Find All Tool Version Files Containing Postgres

I've been using [`asdf`](https://asdf-vm.com/) for many years now which means I
have projects and directories all over my machine with `.tool-versions` files.
Many of them specify Ruby and Node versions. Some of them also include
PostgreSQL versions. I used to use `asdf` to manage Postgres versions, but no
longer do that for new or active projects.

I want to find all the places that a `.tool-versions` file declares `postgres`
as a tool. That way I can begin to clean up the left behind artifacts of
asdf-managed Postgres.

By combining [`fd`](https://github.com/sharkdp/fd) (a better `find`) and
[`rg`](https://github.com/BurntSushi/ripgrep) (a better `grep`), I'm able to
quickly track down the list of places.

```bash
$ fd --hidden .tool-versions ~/ | xargs rg postgres

/Users/jbranchaud/.local/state/nvim/undo/%Users%jbranchaud%.tool-versions: binary file matches (found "\0" byte around offset 9)

/Users/jbranchaud/code/fake-data/.tool-versions
2:postgres 13.1

/Users/jbranchaud/code/thirty_days/thirty_days_server/.tool-versions
1:postgres 13.1

/Users/jbranchaud/code/visualmode/.tool-versions
1:postgres 11.11
```

That first instance is a binary file as part of `nvim`'s undo history which I
can ignore. The other three are good results.

I tell the `fd` command to not exclude hidden files as it looks for all
occurrences of `.tool-versions` recursively from my home (`~/`) directory. I
then pipe that list of files to `xargs` which makes those filenames arguments
to the `rg postgres` command.
