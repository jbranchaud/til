# Generate Ruby Version And Gemset Files With RVM

[RVM](https://rvm.io), the ruby version manager, is a fairly flexible tool
that supports a number of workflows. The `rvm` utility can be used to
generate both a `.ruby-version` file and a `.ruby-gemset` file for a given
project.

```bash
$ rvm --ruby-version use 2.5.3@my_project
```

This will generate a `.ruby-version` file in your current project directory
that points RVM to the `2.5.3` version of Ruby. It will also create a
`.ruby-gemset` file that RVM will use for managing this project's gemset.
