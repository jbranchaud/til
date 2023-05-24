# Count The Number Of ripgrep Pattern Matches

If I run [`ripgrep`](https://github.com/BurntSushi/ripgrep) with a pattern
against a project with many files, I may get a bunch of matches. So many
matches even that they scroll off the screen.

To get a summary of the number of matches in each file, I can include the `-c`
flag:

```bash
❯ rg -c taco
rails/parse-query-params-from-a-url.md:6
rails/params-is-a-hash-with-indifferent-access.md:4
ruby/fetch-warns-about-superseding-block-argument.md:1
ruby/add-comments-to-regex-with-free-spacing.md:1
ruby/create-a-csv-table-object.md:2
ruby/a-basic-case-statement.md:4
ruby/triple-equals-the-case-equality-operator.md:1
ruby/build-http-and-https-urls.md:4
rspec/check-specific-arguments-to-received-method.md:2
javascript/check-classes-on-a-dom-element.md:1
javascript/spread-merging-objects-includes-nil-values.md:2
xstate/custom-jest-matcher-for-xstate-machine-states.md:1
postgres/checking-inequality.md:1
case.rb:4
python/test-a-function-with-pytest.md:6
```

That is still a bunch of info and I may want to further summarize by getting a
count of the total number of matches. I can do this by piping these results to
an `awk` command that totals them up.

```bash
❯ rg -c taco | awk -F: '{total += $2} END {print total}'
40
```

[Using `:` as the field
seperator](https://www.gnu.org/software/gawk/manual/html_node/Full-Line-Fields.html),
`awk` is able to get the number on the left side (`$2`) for each and sum that
up.
