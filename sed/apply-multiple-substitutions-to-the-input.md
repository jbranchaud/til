# Apply Multiple Substitutions To The Input

You can apply multiple substitutions to the input of a `sed` command a couple
ways.

One of those ways is to use the `-e` flag multiple times to define
substitutions that should be _appended_ to the `sed` script.

```bash
$ echo 123 | sed -e 's/3/three/' -e 's/1/one/'
one2three
```

Another way is to define a single string as the `sed` script and separate each
substitution with a `;` (semicolon).

```bash
$ echo 123 | sed 's/3/three/; s/1/one/'
one2three
```

Each of these will run each substitution in the `sed` script sequentially for
each line in the input.
