# Generate Text Embeddings With AWS Bedrock

An embedding model is a special kind of model built on the same transformer
architecture as LLMs. It is trained in a way that contrasts inputs such that
related ones have more similar vectors than unrelated ones. This is useful for a
variety of things including classification and measuring text similarity. I find
the text similarity use case interesting because I'm trialing an approach that
combs through all my [TILs](https://github.com/jbranchaud/til) to find the most
similar posts for each.

There are a number of production-grade providers that host API access to
embedding models. One of those providers is AWS Bedrock.

Here are all the embedding models it offers. Notice it's not just text. There
are image, multilingual, and multimodal models as well.

```bash
❯ aws bedrock list-foundation-models --by-output-modality EMBEDDING \
  --query 'modelSummaries[].modelId'
[
    "amazon.nova-2-multimodal-embeddings-v1:0",
    "twelvelabs.marengo-embed-3-0-v1:0",
    "twelvelabs.marengo-embed-2-7-v1:0",
    "cohere.embed-v4:0",
    "amazon.titan-embed-g1-text-02",
    "amazon.titan-embed-text-v1:2:8k",
    "amazon.titan-embed-text-v1",
    "amazon.titan-embed-text-v2:0:8k",
    "amazon.titan-embed-text-v2:0",
    "amazon.titan-embed-image-v1:0",
    "amazon.titan-embed-image-v1",
    "cohere.embed-english-v3:0:512",
    "cohere.embed-english-v3",
    "cohere.embed-multilingual-v3:0:512",
    "cohere.embed-multilingual-v3"
]
```

Here I run one of my TIL posts through [the `amazon.titan-embed-text-v2:0`
model](https://docs.aws.amazon.com/bedrock/latest/userguide/model-card-amazon-titan-text-embeddings-v2.html).

```bash
❯ jq -n --rawfile body ~/dev/jbranchaud/til/llm/count-number-of-tokens-in-a-file.md \
    '{inputText: ("llm: Count Number Of Tokens In A File\n\n" + $body)[:8000],
      dimensions: 1024,
      normalize: true}' > body.json

❯ aws bedrock-runtime invoke-model \
  --region us-east-1 \
  --model-id amazon.titan-embed-text-v2:0 \
  --content-type application/json --accept application/json \
  --body fileb://body.json \
  out.json
{
    "contentType": "application/json"
}
```

I can then use `jq` to inspect some properties of the output file:

```bash
❯ jq '.embedding | length' out.json
1024

❯ jq '.inputTextTokenCount' out.json
326
```

It doesn't matter whether I passed it a few tokens or hundreds of tokens, it is
going to produce an embedding that is 1024 dimensions.

Here is a peek at what is in the file:

```bash
❯ jq '.' out.json | head -n 8
{
  "embedding": [
    -0.039784759283065796,
    -0.014103486202657223,
    0.0918450877070427,
    0.024694688618183136,
    -0.007761063985526562,
    -0.013740465976297855,
```

Where this gets interesting is when I store embeddings like this for a bunch of
content and then use that to do _cosine similarity_ searches. Note that because
I normalized the embedding, the cosine similarity is just the dot product of two
embeddings.
