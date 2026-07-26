# Jump From Section To Section

[Zed](https://zed.dev/) has some [Vim-mode](https://zed.dev/docs/vim) navigation
capabilities powered by
[`tree-sitter`](https://tree-sitter.github.io/tree-sitter/)'s syntax parsing and
representation (AST). You can perform all the standard Vim motion on _text
objects_ which are defined pieces of syntax that `tree-sitter` exposes.

While working on a Python file that was made up of many classes recently, I kept
finding myself holding the `k` key to go up to view something in one class and
then the `j` key to go back down. This is not the Vim way. There are much more
effective motions.

For instance, `[[` and `]]` are motions to the jump the start of the previous
and next _section_, respectively.

In a Python file, `tree-sitter`'s AST representation marks classes and top-level
methods as _sections_. As I need to jump up to the previous class, I can hit
`[[` and then when I'm ready to return back down to the next class I can hit
`]]`.

There is also `[]` and `][` to jump to the _end_ of the previous and next
section, respectively. Something about those combinations doesn't mesh well with
my muscle memory though, so I will jump to the previous or next section head and
then hit `k` a couple times to get to that section end.

This works in all kinds of files regardless of what the _section_ text object
means for that file. A markdown file has headings (`#`, `##`, `###`, ...) which
become section boundaries. I can quickly navigate the body of a markdown file
with these section motions.
