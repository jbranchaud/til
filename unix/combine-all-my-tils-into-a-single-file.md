# Combine All My TILs Into A Single File

In [Build A Small Text-based Training
Dataset](https://www.visualmode.dev/build-a-small-text-training-dataset), I went
over my need for a sizeable and interesting corpus of text that I could use as a
training dataset I could use to run against [my own naive Byte Pair Encoding
implementation](https://github.com/jbranchaud/build-an-llm-from-scratch/blob/main/chapter-02/bpe_tokenizer.py).
My repo of hand-written TILs is a great candidate, but I need those smashed all
into one file.

Here is a formatted version of the one-liner I ended up with:

```bash
{
  cat README.md; \
  find */ -name '*.md' -print0 \
  | sort -z \
  | xargs -0 -I{} sh -c 'echo "<|endoftext|>"; cat "$1"' _ {}; \
} > combined.md
```

This combines all 1700+ of my TILs into a single file separated by the
`<|endoftext|>` delimiter.

The two things I find most interesting about this command are:

1. The use of a null byte (`\0`) separator between the filenames in case there
   is anything weird (like spaces) in those filenames. This starts with
   `-print0`. The `-z` of `sort` maintains that null byte separator. And then
   `xargs` knows to handle it by the `-0` flag.

2. We can coerce `xargs` into running multiple commands by having it spawn a
   single shell process that runs each of those commands. To reliably pass the
   filename into that shell process, we have `xargs` constitute it as the second
   argument (`$1`) by substituting in the filename where `{}` appears.
