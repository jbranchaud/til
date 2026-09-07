# Generate Image Alt Text Across Various Claude Models

I sometimes experiment with what LLMs will come up with for _alt text_ for an
image to see how it compares to what I would have written. Especially with some
of the latest models I find that it is more comprehensive and detailed that I
would have been.

Here is an image that I used [in a recent blog post](https://www.visualmode.dev/parameterize-a-fixture-instead-of-a-test-case-with-pytest):

![Diagram comparing two test suites. Left, "Behavioral Tests": a single column of six test rows, four passing (green check) and two failing (red X). Right, "Parameterized Behavioral Tests": a list of three parameters (circle, triangle, diamond) with arrows fanning out to three columns, each rerunning the same six tests tagged with that parameter's shape — the circle column all passing, the triangle column with three failures, the diamond column with one failure.](https://cdn.visualmode.dev/blog/parameterized-behavioral-tests.png)

And here are four samples of alt text for that image that I requested from
various Claude models via inline prompts to the `claude` CLI:

```bash
❯ claude -p "Produce a concise alt text for the following image: @image.png" \
  --model opus --effort medium --output-format json \
  | jq '.result'
"Alt text:\n\n> Diagram comparing two test suites. Left, \"Behavioral Tests\": a single column of six test rows, four passing (green check) and two failing (red X). Right, \"Parameterized Behavioral Tests\": a list of three parameters (circle, triangle, diamond) with arrows fanning out to three columns, each rerunning the same six tests tagged with that parameter's shape — the circle column all passing, the triangle column with three failures, the diamond column with one failure."

❯ claude -p "Produce a concise alt text for the following image: @image.png" \
  --model sonnet --effort medium --output-format json \
  | jq '.result'
"Alt text: \"Diagram contrasting plain behavioral tests (a single list of pass/fail checks) with parameterized behavioral tests, where one test template is run against multiple parameter sets (circle, triangle, diamond), producing separate pass/fail results for each.\""

❯ claude -p "Produce a concise alt text for the following image: @image.png" \
  --model haiku --output-format json \
  | jq '.result'
"Diagram contrasting behavioral tests (list with pass/fail results) vs parameterized behavioral tests (matrix showing same tests run with different parameter shapes, each with pass/fail outcomes)."

❯ claude -p "Produce a concise alt text for the following image: @image.png" \
  --model fable --effort medium --output-format json \
  | jq '.result'
"Diagram comparing \"Behavioral Tests\" (one column of six test cards, four passing with green checks, two failing with red X's) against \"Parameterized Behavioral Tests\" (a set of three parameters shown as a purple circle, triangle, and diamond, each fanning out into its own column of six test cards, with the circle column all passing and the triangle and diamond columns containing a mix of passes and failures)."
```

I was surprised at how concise each of these were. When I was about to run each
of these, I was expecting the results to be closer to what I saw in [_Include A File With Message To `ant`_](include-a-file-with-message-to-ant.md)

> A hand-drawn style diagram comparing two testing approaches, split by a
> vertical line.
>
> On the left, under the heading "Behavioral Tests," is a single column of six
> rounded rectangular test rows: four outlined in green with green check-mark
> icons (passing) and two outlined in red with red X icons (failing), each
> containing black scribble lines representing text.
>
> On the right, under the heading "Parameterized Behavioral Tests," a bracketed
> list of three purple parameter symbols — a circle, a triangle, and a diamond —
> sits at the top, with arrows pointing down to three separate columns of six
> test rows each. Every row in a column is tagged with its corresponding
> parameter shape on the right edge. The circle column shows all six rows
> passing (green with check marks). The triangle column shows three passing and
> three failing (red with X marks). The diamond column shows five passing and
> one failing. The illustration conveys that a single behavioral test, when
> parameterized, expands into multiple variants whose pass/fail outcomes can
> differ per parameter.

I guess the "Be concise, _but descriptive_" made a difference.
