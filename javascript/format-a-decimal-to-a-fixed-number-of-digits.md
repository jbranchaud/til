# Format A Decimal To A Fixed Number Of Digits

The `Intl.NumberFormat` object is a reliable way to format numbers in an
i18n-friendly way. It available with Node and all modern browsers.

If I want to format number that I expect to contain decimals, I can do so by
setting up a formatter using the `decimal` style.

```javascript
const locale = "en-US";
const options = {
  style: "decimal",
};

const formatter = new Intl.NumberFormat(locale, options);

console.log(formatter.format(1234))
//=> 1,234
console.log(formatter.format(1234.5678))
//=> 1,234.568
```

Because of my locale (`en-US`), it adds a comma to deliniate the thousandth
place. By default, it formats to three decimal places excluding decimals
altogether if it is a whole number.

If I want to specify a fixed number of decimal places including for a whole
number, I can use the `minimumFractionDigits` and `maximumFractionDigits`
options.

```javascript
const locale = "en-US";
const options = {
  style: "decimal",
  minimumFractionDigits: 2,
  maximumFractionDigits: 2,
};

const formatter = new Intl.NumberFormat(locale, options);

console.log(formatter.format(1234))
//=> 1,234.00
console.log(formatter.format(1234.5678))
//=> 1,234.57
```

Here, it includes the `.00` on the whole number and it truncates the number
with more than 2 decimal places rounding as necessary.

See the [`Intl.NumberFormat`
docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/NumberFormat)
for more details.
