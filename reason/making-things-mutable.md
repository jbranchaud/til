# Making Things Mutable

In [ReasonML](https://reasonml.github.io/en/), things that we create with
`let` are immutable -- which means that we can't change them.

```reason
let num = 5;
```

Once `num` is _bound_ to `5` it is stuck with that value for the duration
of it's scope.

ReasonML doesn't completely restrict us to immutability though. The
`ref` construct allows us to bind a variable to a sort of box that holds a
value. We can then look in the box and change what is in the box.

```reason
let num = ref(5); /* put 5 in the box */

Js.log(num^); /* use `^` to look in the box */

num := 3; /* remove 5, put 3 in the box */
```

We use `ref` to bind our variable to a box with some initial value. The `:=`
assignment operator allows us to change what's in the box. Anytime we want
to refer to what's in the box, we postfix our variable with `^`.

Also of note: while `list` instances are not mutable, `array` instances are.

[source](https://reasonml.github.io/docs/en/mutation)
