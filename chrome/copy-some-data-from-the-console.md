# Copy Some Data From The Console

Sometimes you have some data that you are playing around with in the
console, something you logged from an API response. You then want to share
it, so you try to copy the whole thing into your system copy buffer. There
are a couple hacky ways of doing this, but Chrome supports a really smooth
way.

Use the `copy` function.

```javascript
characters
> (8) [{…}, {…}, {…}, {…}, {…}, {…}, {…}, {…}]
copy(characters[1])
```

My system copy buffer now contains the entire object that makes up the
second entry in that list. I can then paste it into Slack or wherever.

[source](https://twitter.com/addyosmani/status/1092686766375616517)
