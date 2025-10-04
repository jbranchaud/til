# Allow Number Input To Accept Decimal Values

Here is a number input element:

```html
<input type="number" id="amount" required class="border" />
```

This renders an empty number input box with up and down arrows which will, by
default, increment or decrement the value by **1**.

Of course, I can manually edit the input typing in a value like `1.25`.

However, when I submit that via an HTML form, the submission will be prevented
and the browser will display a validation error.

> Please enter a valid value. The two nearest valid values are 1 and 2.

If I want to be able to input a decimal value like this, I need to change the
`step` value. It defaults to `1`, but I could change it to `2`, `10`, or in
this case to `0.01`.

```html
<input type="number" step="0.01" id="amount" required class="border" />
```

Notice now that as you click the up and down arrows, the value is incremented
and decremented by **0.01** at a time.

If I want to maintain the step value of `1` while allowing decimal values, I
can instead set the `step` value to be `any`.

```html
<input type="number" step="any" id="amount" required class="border" />
```

See the [MDN docs on number
inputs](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/number)
for more details.
