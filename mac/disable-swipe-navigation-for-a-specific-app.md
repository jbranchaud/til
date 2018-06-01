# Disable Swipe Navigation For A Specific App

Mac's touch pad has a bunch of handy swipe gestures, including swiping two
fingers to the left or the right to navigate backward or forward. This
particular gesture can be globally enabled and disabled. I find it useful
for most apps and a pain in a few apps, such as Google Chrome.

From the terminal we can disable it for a specific app (like Google Chrome):

```bash
$ defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool FALSE
```

Restart the target application, in my case Chrome. The left and right swipe
navigation will no longer be triggered.

[source](https://apple.stackexchange.com/questions/21236/how-do-i-disable-chromes-two-finger-back-forward-navigation)
