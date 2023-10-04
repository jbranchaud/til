# Format Test Results As A JSON File

The most common output format for RSpec test results is _progress_ which shows
the dot (`.`) or `F` for each test pass and fail. RSpec supports other formats,
including JSON.

You'd typically want to use the JSON format when you want to programmatically
work with the results. And the results would be most accessible if they ended
up in a file.

So, when formatting the results to JSON, we typically also want to specify an
output file. We'll need to use two flags — `--format` and `--out`.

```bash
$ rspec --format json --out test_run_1.json
```

When this test run completes, we will have the results in JSON format in the
newly created `test_run_1.json` file in the current directory.

See `rspec --help` for more details.
