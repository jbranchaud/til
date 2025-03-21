# Find And Copy A Value From Large JSON Output

I've been using [`fx`](https://github.com/antonmedv/fx) for years as a sidekick
to [`jq`](https://jqlang.org/) when I want to explore a JSON document or JSON
output that I'm not yet familiar with. A more recent version of `fx` added the
ability to _yank_ (copy) values and keys you find in the document.

For instance, I may be looking for some info about my AWS RDS instances, so I
pipe that command to `fx`.

```bash
$ aws rds describe-db-instances --output json | fx
```

This takes a moment to process and then the `fx` viewer is populated with a
large blob of JSON. I can then hit `/` to start a document search, type in
something like `Endpoint`, and then look around for the specific key-value pair
I'm interested in.

I can then hit `y` to indicate that I want to copy the element under my cursor.
If it is a key-value pair I will then be prompted to pick whether I want the
value (`v`), the key (`k`), or the JSON path to this value (`p`).
