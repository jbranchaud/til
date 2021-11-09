# Find The Version Of An Installed Dependency

I recently ran into a bug related to a specific version of a dependency. As
part of tracking it down, I needed to figure out what version I had installed.

The [`yarn list`](https://classic.yarnpkg.com/en/docs/cli/list) command can
help with this. Without any flags, it will show a tree structure listing _every
single_ dependency and sub-dependency that is installed for your project.

Here is an example of what that looks like restricted to a pattern of `jest`.

```bash
$ yarn list --pattern jest

yarn list v1.22.10
├─ @testing-library/jest-dom@5.14.1
├─ @types/jest@27.0.1
├─ @types/testing-library__jest-dom@5.9.5
│  ├─ @jest/types@26.6.2
│  ├─ @types/jest@26.0.23
│  ├─ jest-diff@26.6.2
│  └─ jest-get-type@26.3.0
...
```

I can look through this list and find the dependency and version of interest.

It's still a lot of results to comb through, so what I like to do instead is
pipe it to [`fzf`](https://github.com/junegunn/fzf).

```bash
$ yarn list | fzf
```

Then I can interactively narrow down the results with the power of FZF's fuzzy
finding functionality.
