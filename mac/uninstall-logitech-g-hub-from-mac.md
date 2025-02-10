# Uninstall LogiTech G Hub From Mac

I rarely uninstall software from my Mac. And unless the software is nice enough
to provide a clear 'Uninstall' flow, it is not straightforward how to do it. In
fact, it probably varies quite a bit from app to app.

In the case of LogiTech's G Hub, I was able to find the following instructions
for uninstalling it. The thing of note is that the updater app can take an
`--uninstall` flag.

```bash
sudo /Applications/lghub.app/Contents/MacOS/lghub_updater.app/Contents/MacOS/lghub_updater --uninstall
```

I still had to remove the app launcher from my `Applications` directory.

[source](https://www.reddit.com/r/LogitechG/comments/bluth5/comment/lbhctx1/)
