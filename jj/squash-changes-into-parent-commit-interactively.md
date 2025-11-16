# Squash Changes Into Parent Commit Interactively

While I have some changes in progress as part of the working copy, I can squash
them into the previous / parent commit with the `jj squash` command. Running
that command as is will apply all the working copy changes to the parent leaving
the current revision empty.

I can also interactively squash those changes similar in spirit to how I might
use `git add --patch` to stage and then amend specific changes into the previous
commit with `git`. This can be done with [`jj`](https://github.com/jj-vcs/jj)
using `squash` with the `-i` flag.

```bash
jj squash -i # or --interactive
```

This will open up a TUI where I can click around or use keys. Each file in the
source revision (in my case, the working copy) will be listed. I can move the
cursor between them hitting _space_ to toggle them in or out of the squash
selection.

I can also hit `f` over a given file to toggle _folding_. When folding is on, a
diff of the file will be disclosed with checkboxes for toggling individual
hunks and lines.

Once I'm satisfied with my interactive selection, I can hit `c` to confirm and
only the selected files and changes will be squashed into the parent.

See `man jj-squash` for more details.

[source](https://steveklabnik.github.io/jujutsu-tutorial/real-world-workflows/the-squash-workflow.html)
