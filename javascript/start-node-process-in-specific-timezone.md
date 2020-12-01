# Start Node Process In Specific Timezone

When running a node process on your machine locally, it will adopt your
machine's local timezone.

I can observe this by starting a `node` process and outputting a date with
`toLocaleString()`.

```javascript
> new Date().toLocaleString()
'11/30/2020, 8:48:17 PM'
```

This is the time that I'm writing this post, in Chicago (CST).

I can then start the process in another timezone, such as UTC.

```bash
$ TZ=utc node
```

With that `node` process, I can now do the same experiment.

```javascript
> new Date().toLocaleString()
'12/1/2020, 2:52:40 AM'
```

The time jumps ahead about 6 hours because it is going from CST (UTC-6) to UTC.

Similarly, I could start the Node process for the west coast like so,

```bash
$ TZ='America/Los_Angeles' node
```
