# Allow Key-Repeating With Cursor

I recently installed the Vim extension for Cursor. This is the same extension
for VSCode since Cursor is built on VSCode. A lot of the expected Vim behavior
was working. However there was one glaring point of friction.

I often hold down keys like `k` and `j` to go up and down several lines when
I'm absent-mindedly scrolling around. This wasn't working with the Vim mode
extension. I'd hold `j` down and the cursor would move down a single line and then
stop.

The first thing the Vim extension tells you to do is run a command to enable
key-repeating. These instructions are specific to VSCode:

```bash
$ defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
```

That won't work for cursor which is a separate application with a distinct
`CFBundleIdentifier`. You can check the current identifier in Cursor's
`Info.plist` file to be sure, but it should be `com.todesktop.230313mzl4w4u92`.

Run this to target Cursor:

```bash
$ defaults write com.todesktop.230313mzl4w4u92 ApplePressAndHoldEnabled -bool false
```

Then restart Cursor.

Now key-repeating in Vim mode should be working.

[source](https://github.com/getcursor/cursor/issues/777#issuecomment-1690996370)
