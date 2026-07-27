# Include A File With Message To `ant`

The [Anthropic CLI tool](https://github.com/anthropics/anthropic-cli) (`ant`)
allows including files, such as images, directly in the message being sent to
the model. This is done with the `@` symbol followed by a relative path to the
image on the file system.

I have a file `parameterized-behavioral-tests.png` in my current directory that
I'd like to include. In the `content` array of the message I include an object
of type `image` along with some `source` metadata. Within `source` the image
file is referenced with the `data` field.

With that set, I then include a `text` object with my prompt asking for alt text
of this image.

```bash
❯ ant messages create \
  --model claude-opus-5 \
  --max-tokens 1024 \
  --message '{role: user, content: [
    {type: image, source: {type: base64, media_type: image/png, data: "@./parameterized-behavioral-tests.png"}},
    {type: text, text: "Produce a concise, but descriptive alt text for this image."}
  ]}' \
  --transform 'content.#(type=="text").text' --raw-output

A hand-drawn style diagram comparing two testing approaches, split by a vertical
line.

On the left, under the heading "Behavioral Tests," is a single column of six
rounded rectangular test rows: four outlined in green with green check-mark
icons (passing) and two outlined in red with red X icons (failing), each
containing black scribble lines representing text.

On the right, under the heading "Parameterized Behavioral Tests," a bracketed
list of three purple parameter symbols — a circle, a triangle, and a diamond —
sits at the top, with arrows pointing down to three separate columns of six test
rows each. Every row in a column is tagged with its corresponding parameter
shape on the right edge. The circle column shows all six rows passing (green
with check marks). The triangle column shows three passing and three failing
(red with X marks). The diamond column shows five passing and one failing. The
illustration conveys that a single behavioral test, when parameterized, expands
into multiple variants whose pass/fail outcomes can differ per parameter.
```

This is for [the image toward the top of this post on parameterized tests in
pytest](https://www.visualmode.dev/parameterize-a-fixture-instead-of-a-test-case-with-pytest).
The description is a bit wordier than I would have liked, but it is spot on. It
is both visually descriptive and conveys what is being conceptually illustrated.

This whole thing was 3800 input tokens, 328 output tokens, and cost ~$0.02.
