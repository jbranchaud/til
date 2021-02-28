# Quickly Fix A Misspelled Word

In [Fix The Spelling Of A Word](fix-the-spelling-of-a-word.md), I describe how
to use Vim's built-in spell files to fix a misspelling. After turning on
`:spell` and navigating the cursor to a typo, you can open a prompt with dozens
of spelling replacement options.

You generally don't need dozens of options to choose from. If you were remotely
close in the spelling of the word, you will likely end up choosing the first
option.

Instead of the multi-step open and choose, you can tell Vim to replace the
misspelled word with its top suggestion.

Navigate the cursor over the misspelled word and hit:

```
1z=
```

This skips the prompt and tells Vim to grab the first spelling suggestion.

If it's not what you were looking for, you can always hit `u` (to undo) and
then `z=` to open the full prompt.

See `:h z=` for more details.
