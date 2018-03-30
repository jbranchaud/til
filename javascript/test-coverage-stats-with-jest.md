# Test Coverage Stats With Jest

[Jest](https://facebook.github.io/jest/) is a delightful tool for JavaScript
testing from Facebook. As your project evolves and you add tests (or perhaps
choose to not add tests) you may wonder what kind of test coverage you have.
What is the overall coverage? Which files are well covered and which are
seriously lacking?

Use the `--coverage` flag to get this information.

```bash
$ jest --coverage
```

After running all of your tests a table will be output to the terminal with
a list of files and their respective coverage percentages in terms of
statement, branch, function, and line coverage.

```
---------------------------|----------|----------|----------|----------|----------------|
File                       |  % Stmts | % Branch |  % Funcs |  % Lines |Uncovered Lines |
---------------------------|----------|----------|----------|----------|----------------|
```

This can help guide you to what parts of your app may need more testing.
