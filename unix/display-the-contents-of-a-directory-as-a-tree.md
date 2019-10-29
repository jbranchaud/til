# Display The Contents Of A Directory As A Tree

The [`exa` utility](https://github.com/ogham/exa) is a speedy replacement for
`ls` that offers some additional features. One of those extra features is the
_tree_ display.

By including the `-T` (or `--tree`) flag, `exa` will recurse into a directory
and display the entirety of the contents as a tree.

```bash
❯ exa -T
.
├── folder1
│  ├── cats
│  │  └── sneaky
│  └── dogs
│     └── fido
└── folder2
   ├── cats
   │  ├── oreo
   │  └── sneaky
   └── dogs
      └── fido
```

You can target a specific directory:

```bash
❯ exa -T folder2
folder2
├── cats
│  ├── oreo
│  └── sneaky
└── dogs
   └── fido
```

See `man exa` for more details.
