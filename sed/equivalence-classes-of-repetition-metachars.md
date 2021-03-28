# Equivalence Classes Of Repetition MetaChars

There are two types of Repetition MetaChars. The simple ones are `*`, `+`, and
`?`. The general ones are ranges specified inside `{` and `}`. Here are
equivalence classes between these two sets.

_These use the -E (extended regex) option for OSX's `sed`._

1. `*` is equivalent to `{0,}`

_Zero or more of the preceeding character._

```bash
$ echo 'abc123' | sed -E 's/[[:alpha:]]*/!/'
!123

$ echo 'abc123' | sed -E 's/[[:alpha:]]{0,}/!/'
!123
```

2. `+` is equivalent to `{1,}`

_One or more of the preceeding character._

```bash
$ echo 'fix   the spacing' | sed -E 's/[ ]+/ /g'
fix the spacing

$ echo 'fix   the spacing' | sed -E 's/[ ]{1,}/ /g'
fix the spacing
```

3. `?` is equivalent to `{0,1}`

_Exactly zero or one of the preceeding character._

```bash
$ echo '#1, 2, 1oz' | sed -E 's/#?1/ONE/g'
ONE, 2, ONEoz

$ echo '#1, 2, 1oz' | sed -E 's/#{0,1}1/ONE/g'
ONE, 2, ONEoz
```

[source](https://www.goodreads.com/book/show/19407377-definitive-guide-to-sed)
