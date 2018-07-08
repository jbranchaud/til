# Data Structures With Self-Referential Types

[ReasonML](https://reasonml.github.io/) has a powerful type system that
allows us to create types that represent all sorts of things. For data
structures like [linked lists](https://en.wikipedia.org/wiki/Linked_list),
we need a sort of recursive type, a type that can reference itself -- a
self-referential type.

Reason's type system allows us to define types that reference themselves.
Combine that with type arguments and variants -- we can create a type
definition to represents something like a linked list.

```reason
type linked_list('a) =
  | Empty
  | Node('a, linked_list('a));
```

A linked list is a chain of nodes. It can be an _empty_ list, hence the
first part of the variant. Otherwise, it is a node that has some data and
then points to another linked list (chain of nodes).

The `'a` part is a type argument. When creating a linked list, we can decide
what type the `'a` will be. Here is an `int`-based linked list:

```reason
let my_list: linked_list(int) = Node(25, Node(27, Empty));
/* my_list = [25] => [27] => [] */
```
