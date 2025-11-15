# Launch Some Confetti

If you have [Raycast](https://www.raycast.com/) installed on your machine, then
you have quick access to some confetti via their quick command palette. Trigger
the command palette to open, start typing `confetti` until it appears as the
focused option, and then hit enter.

🎉

We can launch confetti other ways, including programmatically from scripts.

To do this, we need to first find the _deeplink_ for the Raycast _confetti_
program. Trigger the command palette and type out `confetti` again. However,
this time instead of hitting enter, hit `Cmd+k` to open other actions. Find the
_Copy Deeplink_ option.

You should now have this on your clipboard:

```
raycast://extensions/raycast/raycast/confetti
```

With this deeplink in hand, we can now trigger confetti other places. The
easiest way to do this is to open a terminal and pass that deep link as an
argument to `open`.

```bash
$ open raycast://extensions/raycast/raycast/confetti
```

Now you can wrap that up in any old bash script or even just tack it on to the
end of a run of your test suite:

```bash
$ rails test && open raycast://extensions/raycast/raycast/confetti
```
