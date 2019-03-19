# Run The Test At A Specific Line Number

You can tell `mix test` to only run tests that appear in a specific file by
naming the file:

```bash
$ mix test test/module/file_test.exs
```

You can even point it to a specific line number in that file like so:

```bash
$ mix test test/module/file_test.exs:45
```

Behind the scenes, `mix test` is using tags to build a list of exclusions
and inclusions that result in only the test at line 45 running. Here is an
equivalent of the above command:

```bash
$ mix test test/module/file_test.exs --exclude test --include line:45
```

This will exclude every test. It will then re-include the test that
corresponds to having a tag `line:45`.
