# Add Custom Dictionary Words

When editing a file with `spell` turned on, you may find vim highlighting
some of your content in red. This red highlighting indicates a misspelling.
Sure, these words technically aren't going to show up in something like the
Merriam-Webster dictionary, but as far as you are concerned, they are words.
They are part of your internal, shared language. The word *admin* is a great
example. Why not just tell vim once and for all that such words are valid.

You can do just that by moving your cursor over the *misspelled* word and
hitting `zg`. That will add it to the `spellfile`, a list of words, which
vim includes in its spell checking. This means vim will no longer highlight
that word red.
