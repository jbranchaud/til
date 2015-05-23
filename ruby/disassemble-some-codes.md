# Disassemble Some Codes

The
[`RubyVM::InstructionSequence`](http://ruby-doc.org/core-2.2.0/RubyVM/InstructionSequence.html)
class makes it easy to compile, disassemble, and inspect bits of Ruby code.
We can quickly take a peek under the hood at a simple ruby statement, such
as `a = 1 + 2`, like so:

```ruby
> ruby_code = 'a = 1 + 2'
=> a = 1 + 2
> compiled_code = RubyVM::InstructionSequence.compile(ruby_code)
=> <RubyVM::InstructionSequence:<compiled>@<compiled>>
> puts compiled_code.disasm
== disasm: <RubyVM::InstructionSequence:<compiled>@<compiled>>==========
local table (size: 2, argc: 0 [opts: 0, rest: -1, post: 0, block: -1, kw:
-1@-1, kwrest: -1])
[ 2] a
0000 trace            1                                               (   1)
0002 putobject_OP_INT2FIX_O_1_C_
0003 putobject        2
0005 opt_plus         <callinfo!mid:+, argc:1, ARGS_SIMPLE>
0007 dup
0008 setlocal_OP__WC__0 2
0010 leave
=> nil
```

It is a bit archaic, but when we get to the line starting with `0002`, we
see values (`1` and then `2`) pushed onto the stack, then operated on, and
finally set on the local variable `a`. Fun!
