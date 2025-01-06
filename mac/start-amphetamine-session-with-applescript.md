# Start Amphetamine Session With AppleScript

I use the _Amphetamine_ app on Mac to keep my computer from going to sleep
during the day. It is a menu bar app that can be used to start a _Session_ of
time where it will keep your computer from going to sleep. At the start of my
day, I'll typically start an 8 hour _Session_. This is useful if I have to step
away fo 10 minutes or if I'm doing some writing in my notebook, my computer
won't go to sleep on me.

Though these sessions can be controlled from the menu bar app, I was excited to
learn that I can also programatically start a session with AppleScript.

Here is how to start a _Session_ (overriding an existing session) with options
that specify it is 8 hours long and the display should not be allowed to sleep.

```bash
$ osascript -e 'tell application "Amphetamine" to start new session with options {duration:8, interval:hours, displaySleepAllowed:false}'
```

The `interval` could also be `minutes` and then I could change the duration to
an amount of time that makes sense in minutes, e.g. `90` for 1.5 hours.

Note: the `with options {...}` segement is all or nothing. All three need to be included or don't include the clause at all.

Additionally, a session of indefinite duration can be started by including no options:

```bash
$ osascript -e 'tell application "Amphetamine" to start new session'
```

And any existing session can be ended with:

```bash
$ osascript -e 'tell application "Amphetamine" to end session'
```

[source](https://iffy.freshdesk.com/support/solutions/articles/48000078223-applescript-documentation)
