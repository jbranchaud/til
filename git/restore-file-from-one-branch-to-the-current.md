# Restore File From One Branch To The Current

On one feature branch I have created some files and made changes to some
existing files as part of spiking a feature. Now I'm on a different branch
taking another shot at it. I want changes from one or two of the files. In the
past I've used `git-checkout` for this task. However, I believe this is one of
the use cases they had in mind when they added `git-restore`.

What I want to do is _restore_ the state of a file as it appears on some source
branch to my current branch. Here is what that looks like:

```bash
$ git restore --source=some-feature-branch app/models/contact.rb
```

Now when I check `git status` I'll see the state of that file on the
`some-feature-branch` branch overlayed on my current working copy. If the file
doesn't exist, it will be created.

See `man git-restore` for more details.
