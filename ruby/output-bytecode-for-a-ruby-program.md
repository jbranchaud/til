# Output Bytecode For A Ruby Program

The `ruby` CLI comes with a flag to dump the disassembled YARV bytecode for the
given Ruby program. This can be a fun way to explore how a Ruby program is
interpreted under the hood.

Aaron Patterson demoed this behavior during his RubyConf 2024 talk.

Pass the `--dump` flag with `insns` along with either the path to your file or
an inline bit of Ruby.

Here is a really basic example:

```bash
❯ ruby --dump=insns -e '2 + 3'
== disasm: #<ISeq:<main>@-e:1 (1,0)-(1,5)> (catch: false)
0000 putobject                              2                         (   1)[Li]
0002 putobject                              3
0004 opt_plus                               <calldata!mid:+, argc:1, ARGS_SIMPLE>[CcCr]
0006 leave
```

And another quite basic example, but with local variables this time:

```bash
❯ ruby --dump=insns -e 'x = 2; y = 3; x + y'
== disasm: #<ISeq:<main>@-e:1 (1,0)-(1,19)> (catch: false)
local table (size: 2, argc: 0 [opts: 0, rest: -1, post: 0, block: -1, kw: -1@-1, kwrest: -1])
[ 2] x@0        [ 1] y@1
0000 putobject                              2                         (   1)[Li]
0002 setlocal_WC_0                          x@0
0004 putobject                              3
0006 setlocal_WC_0                          y@1
0008 getlocal_WC_0                          x@0
0010 getlocal_WC_0                          y@1
0012 opt_plus                               <calldata!mid:+, argc:1, ARGS_SIMPLE>[CcCr]
0014 leave
```

If you want to dig in to how to read everything that is going on in these
outputs, I'd recommend checking out this [Advent of YARV
series](https://kddnewton.com/2022/11/30/advent-of-yarv-part-0.html)
