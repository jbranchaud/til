# `npm run` Has Some Typo Aliases

The developers of the `npm` CLI know that sometimes we are trying to run
commands in a hurry. It's easy to be trying to type `npm run` and instead type
`npm rum` or `npm urn`. No worries though, the command will still work.

If I run `npm help run`, I'll see a manpage that opens with the following:

```
NPM-RUN(1)                                                                    NPM-RUN(1)

NAME
       npm-run - Run arbitrary package scripts

   Synopsis
         npm run <command> [-- <args>]

         aliases: run-script, rum, urn

  ...
```

Notice it lists a few _aliases_ including `rum` and `urn`.

Here are two examples of me running my test suite with `rum` and then `urn`.

```bash
❯ npm rum test:run

> test:run
> vitest run


 RUN  v3.0.7 /Users/lastword/dev/jbranchaud/still

 ✓ app/javascript/utils/urlUtils.test.js (6 tests) 2ms
 ✓ app/javascript/utils/clipboardImage.test.js (20 tests) 3ms

 Test Files  2 passed (2)
      Tests  26 passed (26)
   Start at  22:07:53
   Duration  298ms (transform 17ms, setup 0ms, collect 22ms, tests 5ms, environment 270ms, prepare 63ms)


❯ npm urn test:run

> test:run
> vitest run


 RUN  v3.0.7 /Users/lastword/dev/jbranchaud/still

 ✓ app/javascript/utils/urlUtils.test.js (6 tests) 3ms
 ✓ app/javascript/utils/clipboardImage.test.js (20 tests) 3ms

 Test Files  2 passed (2)
      Tests  26 passed (26)
   Start at  22:07:58
   Duration  305ms (transform 20ms, setup 0ms, collect 25ms, tests 6ms, environment 269ms, prepare 61ms)
```

See `npm help run` for more details.
