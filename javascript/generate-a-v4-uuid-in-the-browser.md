# Generate A V4 UUID In The Browser

The [Web Crypto
API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Crypto_API) provides
a
[`randomUUID`](https://developer.mozilla.org/en-US/docs/Web/API/Crypto/randomUUID)
function for generating v4 UUID values which are cryptographically random.

It works like this:

```javascript
> crypto.randomUUID()
'f2050c5e-af52-4ca2-b4d6-23758b3396c9'
> crypto.randomUUID()
'079d5186-84d4-41d6-a660-edafb6a74c86'
```

No two UUIDs will be the same. This is a great way to generate IDs that are
guaranteed to be unique. Or if you need a value that is practically impossible
to guess.

I was surprised to see that as of writing this, this function has great browser
support. Modern versions of all browsers except Internet Explorer have
implemented `randomUUID`.
