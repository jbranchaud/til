# Construct A File

There are probably a number of different ways to do this with different sets of
command line tools, but I thought it was cool to see how this could be done with
`jq`. Especially since I'm already using it for JSON-related tasks anyway.

Here is how I construct a JSON file with `jq` including pulling in the contents
of another file and using a couple different operations. I'm using the construct
file [to make a _text embedding_ request to AWS
Bedrock](/llm/generate-text-embeddings-with-aws-bedrock.md).

```bash
jq -n --rawfile body llm/count-number-of-tokens-in-a-file.md \
  '{inputText: ("llm: Count Number Of Tokens In A File\n\n" + $body)[:8000],
    dimensions: 1024,
    normalize: true}' > body.json
```

The `-n` flag tells `jq` to not read anything from `stdin` or a file. The `jq`
docs tip us off:

> This is useful when using jq as a simple calculator or to construct JSON data
> from scratch.

The `--rawfile` flag accepts a variable name (`body` in this case) and a path to
a file. I can now reference `$body` in the query and it will be replaced with
the contents of the file.

The rest is a `jq` query where I construct a JSON object with a few keys and
values. The first key (`inputText`) is the most interesting because I
concatenate a string literal with the `$body` (file contents) and then I
truncate the whole thing to the first `[:8000]` characters.

Lastly, the `> body` is a Unix capability that writes the result of the `jq`
command to a file.

See `man jq` for more details.
