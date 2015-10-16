# Delete Lines That Match A Pattern

The `:g` command can be used to execute an Ex command over the entire buffer
for all lines that match a given pattern. By choosing `d` (delete) as the Ex
command, all lines that match the given pattern will be deleted. For
instance, if I want to remove all lines that contain `binding.pry`, I can
execute the following command:

```
:g/binding\.pry/d
```

See `:h :g` for more details.

h/t Chris Erin
