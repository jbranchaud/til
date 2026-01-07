# Allow Edits From The Start

A common pattern for me when using Claude Code is that I start it up in a
project, I prompt it with a question or feature spec, it either comes up with a
plan or just starts working, and as soon as it is ready to make its first edits
to a file, it prompts me something like:

```
 Do you want to make this edit to Taskfile.yml?
 ❯ 1. Yes
   2. Yes, allow all edits during this session (shift+tab)
   3. Type here to tell Claude what to do differently
```

That's a nice default so that I don't get surprised by Claude Code editing a
bunch of files.

However, if I'm in a git-backed project and I'm going into a session intending
to make edits, then I can skip the formalities. I can tell Claude Code when
starting up the session that edits are allowed.

```sh
$ claude --permission-mode acceptEdits
```

When I do this, I'll see the following indicator below the prompt input field:

```
  ⏵⏵ accept edits on (shift+tab to cycle)
```

If I've already started `claude` but I forgot to specify that permission mode, I
can also toggle right into _accept edits_ by hitting `Shift+Tab`.

[source](https://www.youtube.com/watch?v=_IK18goX4X8)
