# Get User's Preferred Language From Browser

A great way to determine a user's preferred language if you aren't able to ask
them directly is to look at the language setting for their browser's UI.

We can get this from the instance of
[`Navigator`](https://developer.mozilla.org/en-US/docs/Web/API/Navigator) in the
user's JavaScript runtime within the browser.

My browser's UI is set to US English, which I can verify like so:

```javascript
> navigator.language
'en-US'
```

This is useful for all sorts of things like [formatting dates for
display](basic-date-formatting-without-a-library.md):

```javascript
> const now = new Date();
> Intl.DateTimeFormat(navigator.language).format(now)
'5/14/2026'
```

Or for [formatting other kinds of units for
display](formatting-values-with-units-for-display.md):

```javascript
> const milesFormat =
    Intl.NumberFormat(navigator.language, { style: "unit", unit: "mile" });
> milesFormat.format(1500)
"1,500 mi"
```
