# Zip Two JSON Files Together Based On Shared ID

Let's say we have JSON file (`list1.json`) that contains an array of objects.
Maybe they represent metadata about some books. Something like this:

```json
[
  { 'slug': 'the-subtle-knife', 'title': 'The Subtle Knife', ... },
  { 'slug': 'all-systems-red', 'title': 'All Systems Red', ... },
  { 'slug': 'piranesi-abc123', 'title': 'Piranesi', ... },
  ...
]
```

And then we have another JSON file (`list2.json`) in a similar format that
contains an additional piece of metadata tied to each slug:

```json
[
  { 'slug': 'the-subtle-knife', 'author': 'Philip Pullman' },
  { 'slug': 'all-systems-red', 'author': 'Martha Wells' },
  { 'slug': 'piranesi-abc123', 'author': 'Susanna Clarke' },
  ...
]
```

And we want to pull the details from the second file and combine them into the
first file based on that shared identifier, in this case, the `slug`.

Instead of copying over a ton of values manually or writing a full-fledged
script to do this, we can use a `jq` one-liner with the `--slurpfile` flag.

```
jq --slurpfile list1 list1.json --slurpfile list2 list2.json -n '
  $list1[] as $item1
  | $list2[] as $item2
  | select($item1.slug == $item2.slug)
  | $item1 + $item2
'

[
  { 'slug': 'the-subtle-knife', 'title': 'The Subtle Knife', 'author': 'Philip Pullman', ... },
  { 'slug': 'all-systems-red', 'title': 'All Systems Red', 'author': 'Martha Wells', ... },
  { 'slug': 'piranesi-abc123', 'title': 'Piranesi', 'author': 'Susanna Clarke', ... },
  ...
]
```

This reads in both files as lists into named variables, selects for the items
that have matching `slug` values, and then unions those objects together. The
result will go to standard out, but it could also be redirected into a new JSON
file.
