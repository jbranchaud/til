# Basic Delve Debugging Session

When using [delve](https://github.com/go-delve/delve) to debug a Go program,
these are the series of things I usually find myself doing.

First, I start running the program with `dlv` including any arguments after a `--` (in my case, the `solve` subcommand and a filename).

```bash
$ dlv debug . -- solve samples/001.txt
```

`dlv` starts up and is ready to run my program from the beginning. I'll need to
set a couple breakpoints before continuing. I do this with the `break` command,
specifying the filename and line number.

```
(dlv) break main.go:528
Breakpoint 1 set at 0x10c1a5bea for main.traversePuzzleIterative() ./main.go:528
(dlv) break main.go:599
Breakpoint 2 set at 0x10c1a6dcc for main.traversePuzzleIterative() ./main.go:599 
```

Now I can continue which will run the program until hitting a breakpoint.

```
(dlv) continue
> [Breakpoint 2] main.traversePuzzleIterative() ./main.go:599 (hits goroutine(1):1 total:1) (PC: 0x10c1a6dcc)
   594:                                 }
   595:                         }
   596:
   597:                         topStackFrame := stack[len(stack)-1]
   598:                         // if the current stack frame has more values, try the next
=> 599:                         if len(topStackFrame.PossibleValues) > 0 {
   600:                                 nextValue := topStackFrame.PossibleValues[0]
   601:                                 topStackFrame.PossibleValues = topStackFrame.PossibleValues[1:]
   602:                                 topStackFrame.CurrValue = nextValue
   603:
   604:                                 // Undo the last placement and make a new one
```

I can see the context around the line we've stopped on. From here I can dig
into the current state of the program by looking at local variables (`locals`)
or printing out a specific value (`print someVar`). I can continue to step
through the program line by line with `next` or eventually run `continue` to
proceed to the next breakpoint.

```
(dlv) locals
diagnostics = main.Diagnostics {BacktrackCount: 0, NodeVisitCount: 1, ValidityCheckCount: 2,...+2 more}
stack = []main.StackData len: 1, cap: 1, [...]
emptyCellPositions = [][]int len: 3, cap: 4, [...]
emptyCellIndex = 1
status = "Invalid"
topStackFrame = main.StackData {RowIndex: 1, ColumnIndex: 7, PossibleValues: []int len: 8, cap: 8, [...],...+1 more}
(dlv) print topStackFrame
main.StackData {
        RowIndex: 1,
        ColumnIndex: 7,
        PossibleValues: []int len: 8, cap: 8, [2,3,4,5,6,7,8,9],
        CurrValue: 1,}
(dlv) next
> main.traversePuzzleIterative() ./main.go:600 (PC: 0x10c1a6dea)
```
