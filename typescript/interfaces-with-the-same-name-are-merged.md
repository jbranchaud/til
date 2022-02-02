# Interfaces With The Same Name Are Merged

Here is the declartion of an interface in TypeScript.

```typescript
interface Person {
  name: string
}
```

What if I were to add a separate interface declaration with the same name,
`Person`?

```typescript
interface Person {
    age: number
}
```

TypeScript performs declaration merging. So the types of the two interfaces
would be combined. So, a variable of type `Person` can have an `name` and an
`age`.

```typescript
const person: Person = {
    age: 22,
    name: 'Bob'
}
```

See a [live
example](https://www.typescriptlang.org/play?ssl=12&ssc=2&pln=5&pc=1#code/JYOwLgpgTgZghgYwgAgArQM4HsTIN4BQyxyIcAthAFzIZhSgDmBAvgQaJLIiulNrkIlkcRtVIBXcgCNordghx1kAB0w4afAcgC8+IiVHiATMYA0B4mUo0A5ACEs02-IJr+OAHRGgA)
in the TS Playground.

This is different from how object type declarations handle it. If I were to try
to define two separate `type`s with the same name, that would result in a type
error.

[source](https://www.typescriptlang.org/docs/handbook/declaration-merging.html#merging-interfaces)
