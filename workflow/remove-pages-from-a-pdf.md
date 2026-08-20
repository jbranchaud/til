# Remove Pages From A PDF

I have a two page PDF. I really only need to second page though. I want to send
that second page to someone and including the first page with it will only cause
confusion. I couldn't figure out a sane way to do this on MacOS with either
Preview or Notes (where the PDF originated).

So, I looked into a tool I'd heard of recently for manipulating PDFs called
[`qpdf`](https://github.com/qpdf/qpdf).

> qpdf is a command-line tool and C++ library that performs content-preserving
> transformations on PDF files.

I installed it with `homebrew` and then looked up how "removing" pages works.
Conceptually, `qpdf` is used to transform a PDF. That means there are a couple
ways I can think about approaching this.

If I want to preserve every page except for the first page, then I produce a PDF
that starts at page `2` and goes to the end (`z`) by specifying a range of
`2-z`.

```bash
qpdf in.pdf --pages . 2-z -- out.pdf
```

If I truly only want the 2nd page from the PDF and nothing else, then I can
produce a PDF made up of _only_ page `2`.

```bash
qpdf in.pdf --pages . 2 -- out.pdf
```

Yet another way to think about this is to produce a PDF that includes all pages,
but then explicitly mark page `1` for exclusion after the range with `x1`.

```bash
qpdf in.pdf --pages . 1-z,x1 -- out.pdf
```

And one last way, assuming that we are dealing specifically with a two-page PDF,
is to use the `rN` syntax where `N` is the number of pages from the back of the
list. `r1` is the last page, `r2` is the second to last page, and so forth. In a
two-page PDF, `r2` would then refer to the _first_page.

```bash
qpdf in.pdf --pages . 1-z,xr2 -- out.pdf
```

I know I said that was the last, but I'll also throw in that, again assuming a
two-page PDF, we could produce a PDF made up of only `:even` numbered pages
relative to the defined range.

```bash
qpdf in.pdf --pages . 1-z:even -- out.pdf
```

I'll stick with the first approach, but it was fun to experiment with all the
other ways this can be done with `qpdf`'s flexible syntax.
