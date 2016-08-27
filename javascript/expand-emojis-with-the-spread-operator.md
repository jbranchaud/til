# Expand Emojis With The Spread Operator

There are a number of emojis that are not stand-alone unicode characters,
but instead are [a combination of two or more other
emojis](http://unicode.org/emoji/charts/full-emoji-list.html#1f468_200d_1f469_200d_1f466).
The two main places this happens is with family emojis and emojis using
non-simpsons skin tones.

You can use JavaScript's spread operator to expand these emojis to see what
their base components are. Here is a screenshot of a few that I expanded
from Chrome's dev tools.

![](http://i.imgur.com/ObagJJ2.png)

[source](https://twitter.com/wesbos/status/769228067780825088)
