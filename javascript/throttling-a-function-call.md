# Throttling A Function Call

Imagine you have a JavaScript function that makes a request to your server.
Perhaps it is sending user input from a `textarea` to be processed by the
server. You may want to wrap this function in a keyboard event listener so
that you are sure to react immediately to any user input. However, as the
user starts typing away into this text area you may find that way to many
requests are being fired off to the server. The request needs to be
*throttled*.

You can roll your own approach to sufficiently intermittent server calls.
Though, it turns out that [underscore.js](http://underscorejs.org/) comes
with two functions out of the box for this kind of behavior.

- [`throttle`](http://underscorejs.org/#throttle) will give you a function
  that wraps your function in a way that essentially rate-limits it to being
  called at most once every `N` milliseconds.

- [`debounce`](http://underscorejs.org/#debounce), on the other hand, will
  give you a function that only calls your function once `N` milliseconds
  has passed since it was last called.

These are two subtly different approaches to making sure a function gets
called, just not too often.

h/t [Jake Worth](https://twitter.com/jwworth)
