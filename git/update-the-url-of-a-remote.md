# Update The URL Of A Remote

I just changed the name of a Github repository. One of the implications of
this is that the remote URL that my local git repository has on record is
now out of date. I need to update it.

If I use `git-remote` with the `-v` flag. I can see what remotes I currently
have.

```bash
$ git remote -v
origin  git@github.com:jbranchaud/pokemon.git (fetch)
origin  git@github.com:jbranchaud/pokemon.git (push)
```

Now, to update the URL for that remote, I can use `git remote set-url`
specifying the name of the remote and the updated URL.

```bash
$ git remote set-url origin git@github.com:jbranchaud/pokemon_deluxe.git
```

If I check again, I can see it has been updated accordingly.

```bash
$ git remote -v
origin  git@github.com:jbranchaud/pokemon_deluxe.git (fetch)
origin  git@github.com:jbranchaud/pokemon_deluxe.git (push)
```
