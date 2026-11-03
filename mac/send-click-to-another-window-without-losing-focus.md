# Send Click To Another Window Without Losing Focus

This is a fun trick for MacOS -- you can `Cmd+Click` on a window that is out of
focus to send a click to that window without transitioning focus from the
current window to that one. Put another way, you can click-through on an
inactive window without changing the active window.

Let's say I have my [logseq](https://logseq.com/) notes window focused. In the
background is a Chrome window that I'm referencing as I type notes. However
there is a pop up obscuring the Chrome window. Typically to dismiss that pop up,
I'd have to click on Chrome once just to transition focus to Chrome. Then I
would have to click the `x` to dismiss the pop-up. Then I would have to click
back on the logseq window to transition focus back to it.

Instead, I can hold down `cmd` as I click on the `x` in Chrome. The click will
get sent through to Chrome dismissing the pop up and logseq will remain the
focused window. That's one click instead of three.

I wish I could remember where I learned this trick so that I could give credit.
I have a feeling it might have been [Justin Searls](https://justin.searls.co/)
though. And I unfortunately cannot find any official Apple documentation on
this.

One thing to note is that while this will probably work across most apps, I
believe it can be overridden by certain apps that implement custom UIs.
