# Diffing With Patience

The default diff algorithm used by Git is pretty good, but it can get
mislead by larger, complex changesets. The result is a noisier, misaligned
diff output.

If you'd like a diff that is generally a bit cleaner and can afford a little
slow down (you probably can), you can instead use the `patience` algorithm
which is described as such:

> Patience Diff, instead, focuses its energy on the low-frequency
> high-content lines which serve as markers or signatures of important
> content in the text. It is still an LCS-based diff at its core, but with
> an important difference, as it only considers the longest common
> subsequence of the signature lines:

> Find all lines which occur exactly once on both sides, then do longest
> common subsequence on those lines, matching them up.

You can set this as the default algorithm by adding the following lines to
your `~/.gitconfig` file:

```
[diff]
    algorithm = patience
```

or it can be set from the command line with:

```bash
$ git config --global diff.algorithm patience
```

[source](http://bryanpendleton.blogspot.com/2010/05/patience-diff.html)

h/t Josh Davey
