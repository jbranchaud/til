# Read In The Contents Of A File

Deno offers some nice utilities out of the box like reading in the contents of
a file from the filesystem. The `readTextFile` function is available on the
`Deno` object.

```typescript
// Read a file using Deno
const text: string = await Deno.readTextFile("./first_input.txt");
```

You use a top-level await with the function call and, assuming the file exists,
it will read the contents in. In this case, I assign them to the `text`
variable.

For the file reading to work when the program is executed, you must use the
`--allow-read` flag.

```bash
$ deno run --allow-read program.ts
```

[source](https://deno.land/manual@v1.14.0/examples/read_write_files)
