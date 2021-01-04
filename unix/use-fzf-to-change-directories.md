# Use fzf To Change Directories

When you install fzf (e.g. `brew install fzf`), you can also install
completions and a few keybindings by running the `/usr/local/opt/fzf/install`
binary.

Included with the keybindings is `Alt+c` which opens an fzf prompt for the
directories nested under your current directory. You can type into the prompt
to narrow down the results with fzf's fuzzy-finding capabilities. When you see
the directory you wan, you can use the arrows to navigate over it and then hit
end. You'll be `cd`'ed into that directory.

On my Mac, the `Alt` key is the `Option` key. Hitting `Opt+c` outputs the `ç`
character instead of opening this fzf prompt. It turns out, you can
alternatively hit `Esc+c` to trigger this prompt.
