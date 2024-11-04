# Digraph Unicode Characters Have a Titlecase

Coming from primarily being exposed to the US American alphabet, I'm familiar
with characters that I type into the computer having one of two cases. Either
it is lowercase by default (`c`) or I can hit the shift key to produce the
uppercase version (`C`).

Unicode, which has broad support for character encoding across most languages,
has a couple characters that are called _digraphs_. These are single code
points, but look like they are made up of two characters.

A good example of this is `ǆ`. And if that character were to appear in an all
uppercase word, then it would display as `Ǆ`.

But what if it appears at the beginning of a capitalized word?

That's where _titlecase_ comes into the picture -- `ǅ`.

From [wikipedia](https://en.wikipedia.org/wiki/D%C5%BE):

> Note that when the letter is the initial of a capitalised word (like Džungla
> or Džemper, or personal names like Džemal or Džamonja), the ž is not
> uppercase. Only when the whole word is written in uppercase, is the Ž
> capitalised.

(I find it odd that wikipedia's article on this digraph code point is using
separate characters instead of the digraph.)

[source](https://devblogs.microsoft.com/oldnewthing/20241031-00/?p=110443)
