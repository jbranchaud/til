# List Available File Types

The `ack` utility allows you to filter the searched files based on file
type. If you'd like to know all of the file types available, you can use the
`--help-types` flag. This will include file types you've specified in your
`.ackrc` file.

Here is a sample of some of the output.

```
$ ack --help-types
    ...
    --[no]css          .css .less .scss
    --[no]dart         .dart
    --[no]delphi       .pas .int .dfm .nfm .dof .dpk .dproj .groupproj .bdsgroup .bdsproj
    --[no]elisp        .el
    --[no]elixir       .ex .exs
    --[no]erlang       .erl .hrl
    --[no]fortran      .f .f77 .f90 .f95 .f03 .for .ftn .fpp
    --[no]go           .go
    --[no]groovy       .groovy .gtmpl .gpp .grunit .gradle
    --[no]haskell      .hs .lhs
    --[no]hh           .h
    --[no]html         .html .mustache .handlebars .tmpl
    --[no]jade         .jade
    --[no]java         .java .properties
    --[no]js           .js
    ...
```

See `man ack` for more details.
