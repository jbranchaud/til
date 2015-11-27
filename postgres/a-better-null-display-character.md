# A Better Null Display Character

By default, `psql` will display null values with whitespace. This makes it
difficult to quickly identify null values when they appear amongst a bunch
of other data. You can pick a better display value for null characters with
`\pset null`. My preference is the following:

```
\pset null 'Ø'
```

I have this in my `.psqlrc` file so that it is used by default every time.
