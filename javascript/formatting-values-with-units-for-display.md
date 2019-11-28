# Formatting Values With Units For Display

There are all kinds of values and units your app may need to display. The
[`Intl.NumberFormat`
API](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/NumberFormat)
that is available in modern browsers can help with standardizing that display.

How about formatting distances for display?

Here is a compact formatting of miles:

```javascript
> const milesFormat =
    Intl.NumberFormat("en-US", { style: "unit", unit: "mile" });
> milesFormat.format(1500)
"1,500 mi"
```

Here is two different formats for kilometers:

```javascript
> const kmFormat =
    Intl.NumberFormat("en-US", { style: "unit", unit: "kilometer" });
> kmFormat.format(1500)
"1,500 km"
> const kilometerFormat =
    Intl.NumberFormat("en-US", { style: "unit", unit: "kilometer", unitDisplay: "long" })
> kilometerFormat.format(1500)
"1,500 kilometers"
```

Give it a try with something else like `miles-per-hour`, `liter`, or `gallon`.

[source](https://twitter.com/jamesreggio/status/1196574375916400640?s=21)
