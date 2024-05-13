# Format Time Zone Identifier

Though there are surely libraries that can help with this task, we now have
full support in the [`Intl.DateTimeFormat`
API](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat)
for formatting a date's time zone identifier in various ways.

To do this, we have to create a formatter specifying the locale, the `timeZone`
option, and any formatting options. For the formatting, I'll try the
`timeZoneName` with both `short` and `longGeneric`.

Then we `formatToParts` on any date object and extract the `timeZoneName`
value:

```javascript
const options = { timeZone: 'America/Chicago', timeZoneName: "short" }
const formatter = new Intl.DateTimeFormat("en-US", options)

formatter.formatToParts(new Date()).find((part) => part.type === "timeZoneName").value
//=> 'CDT'
```

Now, let's try this for `longGeneric`:

```javascript
const options = { timeZone: 'America/Chicago', timeZoneName: "longGeneric" }
const formatter = new Intl.DateTimeFormat("en-US", options)

formatter.formatToParts(new Date()).find((part) => part.type === "timeZoneName").value
//=> 'Central Time'
```

There are several more options for the `timeZoneName` as well as a bunch more
you can do with the `Intl.DateTimeFormat` API.
