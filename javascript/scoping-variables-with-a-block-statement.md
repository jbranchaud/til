# Scoping Variables With A Block Statement

A solid way to keep code readable and easy to understand is to ditch the
terse one-liners in favor of breaking things up across multiple lines and
using self-documenting variable names. This isn't all good though. Each new
variable that is defined is a handle on some data that can be misused later
in the syntax scope.

JavaScript has a nice way of being clear about the scope of certain
variables:

```javascript
let parsedDate;
{
  let [month, day, year] = input.split('-');
  parsedDate = new Date(year, month, day);
}

// do something with parsedDate
```

The `month`, `day`, and `year` variables are scoped to the `{ ... }` which
is a [block
statement](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/block).
This helps communicate and enforce that those variables are only to be used
in that very specific context. Other developers and our future selves won't
be able to erroneously use those variables.

Of course, breaking out a function is another way of accomplishing this.
Sequestering code in a different part of the file is not always the best
answer though. Sometimes you want it locally fenced off. For those times,
use a block statement.
