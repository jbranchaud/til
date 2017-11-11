# Freeze An Object, Sorta

You can freeze a JavaScript object using `Object.freeze` which will help
enforce some immutability practices. Don't be fooled though, you can still
modify arrays and objects in the frozen object.

Here is what the docs have to say:

> The Object.freeze() method freezes an object: that is, prevents new
> properties from being added to it; prevents existing properties from being
> removed; and prevents existing properties, or their enumerability,
> configurability, or writability, from being changed, it also prevents the
> prototype from being changed.

And here is `Object.freeze` in action:

```javascript
> const things = {one: "two", hello: "world", cats: ["Von Neumann", "Sosa"]}
undefined
> Object.freeze(things)
{one: "two", hello: "world", cats: Array(2)}

> things.one = "three"
"three"
> things.dogs = []
[]
> delete things.hello
false

> things
{one: "two", hello: "world", cats: Array(2)}

> things.cats.push("Sneaky")
3

> things
{one: "two", hello: "world", cats: Array(3)}
```

See the [MDN
Docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/freeze)
for more details.

h/t Jake Worth
