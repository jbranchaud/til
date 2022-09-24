# Pause JavaScript From The Source DevTools Panel

You know that moment when you accidentally introduce an infinite loop in some
JavaScript code. You've just refreshed the page in the browser and everything
seems to both hang and loop. And the browser slows to a crawl.

If you're trying to get to the bottom of things, you may be `console.log`'ing
some data points. However, because of the infinite loop, the logs are flying by
in the console. It would be great if you could bring things to a halt.

I assume you already have devtools open, since you're looking at the logs. If
not, hit `F12`.

Then go to the _Sources_ tab which is where the JavaScript debug tools are
located. From here, you can find and click the pause button. It should be the
first in the panel of debug controls. Alternatively, as long as you have the
_Source_ tab in focus, you can simply hit `F8`.

Once you've paused that infinite loop, you can go back to the console and have
a look around.
