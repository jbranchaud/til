# Watch This Run Repeatedly

I usually reach for a quick bash for loop when I want to run a particular
process a bunch of times in a row. The `watch` command is another way to
run a process repeatedly.

```
watch rspec spec/some/test.rb
```

The default is 2 seconds in between subsequent executions of the command.
The period can be changed with the `-n` flag though:

```
watch -n 2 rspec spec/some/test.rb
```
