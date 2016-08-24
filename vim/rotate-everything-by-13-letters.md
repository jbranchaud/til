# Rotate Everything By 13 Letters

For some inane reason, Vim comes with a
[ROT-13](https://en.wikipedia.org/wiki/ROT13) feature. So, if you are ever
in need of rotating the letters of some portion of the file by 13, you can
do that with the simple `g?` binding.

For example, if you hit `g??` on the following line:

```
Six dollar eggs
```

you will get

```
Fvk qbyyne rttf
```

As you can see, casing is preserved.

The only practical uses of this are Vimgolf and convincing people at coffee
shops that you are a hacker.

See `:h g?` for more details.
