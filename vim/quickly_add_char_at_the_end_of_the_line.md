# Quickly add ; or , at the end of the line

I get this tips from a local Vim meetup in Paris. It help to quickly add char
to the end of a line. At the begining I was only use it with `;` but I finally
add `,` too.

```viml
"lazy js. Append ; at the end of the line
nnoremap <Leader>; m`A;<Esc>``
nnoremap <Leader>, m`A,<Esc>``
```

It simply create a marker at backstick insert at the end of the line `;` or `,`
then escape and go back to the marker. w
