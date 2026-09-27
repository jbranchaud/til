# Translate To Canonical Tags With Small Model

In [Don't Classify, Hallucinate](https://softwaredoug.com/blog/2026/08/10/hypothetical-classifications),
Doug Turnbull discusses a technique for hallucinating classifications for a
product and then using MiniLM to translate those classifications to actual
product classifications in your system / vocabulary.

The second step in the process he described seemed most interesting to me, so I
wanted to experiment with it.

First, here is my classification system -- that is, these are all the categories
of [TIL posts](https://github.com/jbranchaud/til) that I write.

```bash
# from my TIL repo
❯ git ls-files '*/*.md' | cut -d/ -f1 | sort -u | paste -sd\| - | sed 's/.*/"&"/'
"ack|ansible|astro|aws|bash|brew|chrome|claude-code|clojure|css|cursor|deno|devops|docker|drizzle|elixir|gatsby|git|github|github-actions|go|groq|heroku|html|http|inngest|internet|java|javascript|jj|jq|kitty|linux|llm|mac|math|mise|mongodb|mysql|neovim|netlify|next-auth|nextjs|phoenix|planetscale|pnpm|postgres|prisma|python|rails|react|react_native|react-testing-library|reason|remix|rspec|ruby|sed|shell|sqlite|streaming|tailwind|taskfile|tmux|typescript|unix|vercel|vim|vscode|webpack|workflow|xstate|yaml|zed|zod|zsh"
```

I'll grab that output and use it in the following set of Python REPL steps. Here
I need to import
[`sentence_transformers`](https://sbert.net/docs/quickstart.html#sentence-transformer)
which is "applicable for a wide range of tasks, such as semantic textual
similarity, semantic search, clustering, classification, paraphrase mining, and
more."

```python
# I initiate this REPL with:
# ❯ uv run --with sentence_transformers python
>>> from sentence_transformers import SentenceTransformer
>>> model = SentenceTransformer("sentence-transformers/all-MiniLM-L6-v2")
>>> raw_tags = "ack|ansible|astro|aws|bash|brew|chrome|claude-code|clojure|css|cursor|deno|devops|docker|drizzle|elixir|gatsby|git|github|github-actions|go|groq|heroku|html|http|inngest|internet|java|javascript|jj|jq|kitty|linux|llm|mac|math|mise|mongodb|mysql|neovim|netlify|next-auth|nextjs|phoenix|planetscale|pnpm|postgres|prisma|python|rails|react|react_native|react-testing-library|reason|remix|rspec|ruby|sed|shell|sqlite|streaming|tailwind|taskfile|tmux|typescript|unix|vercel|vim|vscode|webpack|workflow|xstate|yaml|zed|zod|zsh"
>>> tags = raw_tags.split("|")
>>> tag_vecs = model.encode(tags, normalize_embeddings=True)
>>> def resolve(fake_tags, threshold=0.5):
...     fake_vecs = model.encode(fake_tags, normalize_embeddings=True)
...     scores = fake_vecs @ tag_vecs.T
...     best, best_score = scores.argmax(1), scores.max(1)
...     return {tags[i] for i, s in zip(best, best_score) if s >= threshold
...
```

With that all set up, I take a set of tags for a post like this one that
you're reading and see if I can get them to resolve to one or more tags directly
from the canonical tag vocabulary.

```python
>>> resolve(["Python 3.13", "uv", "ML / LLM / Classification"])
{'python', 'llm'}
```

A set of tags with varying structure and specificity can be translated into the
relevant canonical tags that I started with.

I can also experiment a little with the threshold. Where is the line for
"Version Control" being associated to "git"?

```python
>>> resolve(["Version Control"])
set()
>>> resolve(["Version Control"], 0.2)
{'git'}
>>> resolve(["Version Control"], 0.3)
{'git'}
>>> resolve(["Version Control"], 0.4)
{'git'}
>>> resolve(["Version Control"], 0.5)
set()
>>> resolve(["Version Control"], 0.45)
set()
>>> resolve(["Version Control"], 0.42)
{'git'}
```

A quick note on what is happening in the `resolve` function above. We have the
normalized embedding vectors for the _fake tags_ and the set of canonical tags.
We then compute the dot product of the fake tags embeddings with the
_transposed_ canonical tags. This gives us the cosine similarly between all of
them which is an indication of how similar each fake tag vector is to each
canonical tag vector. The ones above the `0.5` threshold make the cut and that
set is returned. We may match one tag, a couple tags, or even no tags.
