# Specify The Language For A File With Bat

The [`bat`](https://github.com/sharkdp/bat) utility is able to correctly
infer the language of most files it prints based on the file extension. In
some cases, you may want to specify a language other than the one it
guesses.

For instance, here is a React file printed with `bat`:

![bat with no CLI args](https://i.imgur.com/Jk0L6tB.png)

The `jsx` syntax doesn't look great because of the inferred language
highlighting doesn't account for it. We can get better results by telling
`bat` that the file should be parsed as `JavaScript (Babel)`.

![bat with language specified](https://i.imgur.com/yB1rYW4.png)

By including `--language=jsx` as a flag, `bat` uses a different language
parser and the output is now what I'm looking for.
