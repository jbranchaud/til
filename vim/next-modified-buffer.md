# Next Modified Buffer

After working for a while on a feature that involves looking at a number of
files, I end up with a decent buffer list. I will have inevitably edited a
few of those files and occasionally I'll inadvertently leave one of the
buffers modified. Instead of opening
the buffer list (`:ls`), finding the modified buffer, and navigating to it,
I can just jump straight to it. I can do this with `:bmodified` or just
`:bm`. This jumps straight to the next modified buffer. If there is no
modified buffer, it tells me *No modified buffer found*.

See `:h bmodified` for more details.
