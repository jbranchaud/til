# Get Help With A Rails App Update

Rails version upgrades can be pretty involved. The ecosystem and the framework
are under constant evolution. While each patch version will stay reliably
stable, as soon as you go to do a minor or major upgrade (which you should stay
on top of), you'll have lots to consider.

Rails helps with this via the `app:update` rake task.

When run, it will prompt you with a series of files that it wants to change.
For each one you'll have some options.

```bash
$ rails app:update

Overwrite my-app/config/boot.rb? (enter "h" for help) [Ynaqdhm]  h
        Y - yes, overwrite
        n - no, do not overwrite
        a - all, overwrite this and all others
        q - quit, abort
        d - diff, show the differences between the old and the new
        h - help, show this help
        m - merge, run merge tool
```

Start by using `d` to see a diff of the changes. If it's small and doesn't
overwrite important, existing settings, then you can use `y` to accept them.
For a lot of these files the changes will be too aggressive. So side-by-side
with the diff, update the file manually. Then use `n` to go to the next update.
