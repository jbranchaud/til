# Copying Nested Directories With Ditto

You can copy nested directories with `cp` using the `-R` (_recursive_) flag.
The way `cp` works is that it replaces the target location with the source
directory, wiping out whatever files or directories reside at the target
location.

Conversely, the `ditto` utility, available on OS X's version of Unix, does
_recursive_ directory copies by default and merges the contents of any existing
directories.

As an example, here are two folders, `folder1` and `folder2`:

```bash
❯ exa -T folder1
folder1
├── cats
│  └── sneaky
└── dogs
   └── fido

❯ exa -T folder2
folder2
└── cats
   └── oreo
```

Using `ditto` to copy `folder1` to `folder2`

```bash
❯ ditto folder1 folder2
```

we get a `folder2` where directories from `folder1` are created and existing
directories are merged together.

```bash
❯ exa -T folder2
folder2
├── cats
│  ├── oreo
│  └── sneaky
└── dogs
   └── fido
```

See `man ditto` for more details.
