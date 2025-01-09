# Use A Different Font With iTerm2

I wanted to give [`gh-dash`](https://github.com/dlvhdr/gh-dash) a try, but
after installing and opening it up, I was seeing a bunch of `?` characters
where specialized font icons were missing. Their README recommended installing
a [`Nerd Font`](https://github.com/ryanoasis/nerd-fonts) that includes those
icons, such as [`Fira Code`](https://github.com/tonsky/FiraCode).

I was able to install `font-fira-code-nerd-font` with homebrew:

```bash
$ brew install font-fira-code-nerd-font
```

Then to get iTerm2 to start using that font, I had to change the font setting
for my current profile.

Under the _iTerm2_ menu is _Settings..._. From there, I clicked the _Profiles_
section. For the _Default_ profile, I went to the _Text_ tab and under _Font_ I
selected _FireCode Nerd Font Mono_ from the dropdown.

That won't take effect on any current iTerm2 windows. Since I have everything
running through `tmux`, I could close my current window, open a new one
(`Cmd+N`), and reconnect to my existing `tmux` session. Now when I run `gh
dash`, I see all the font icons that were missing before.
