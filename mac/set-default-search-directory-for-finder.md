# Set Default Search Directory For Finder

In MacOS's Finder.app, when I click the Search (magnifying glass) icon and type
something in, it performs the search across all of "This Mac". This has always
really bugged me because I'm usually already in the directory that I want to be
specifically searching in.

A small quality-of-life improvement for me was to update the setting that
controls this to search in the current directory instead.

This can be done via the Finder.app menu at the bottom of the _Advanced_ section
in the _Settings_. The three setting options are:

- Search This Mac
- Search the Current Folder
- Search the Previous Search Scope

This can also be controlled from the command line using the `defaults write`
command. The specific setting is called `FXDefaultSearchScope` and the above
three settings translate to:

- `SCev` (Search This Mac)
- `SCcf` (Search the Current Folder)
- `SCsp` (Search the Previous Search Scope)

I can see the current default setting with `defaults read`:

```bash
❯ defaults read com.apple.finder FXDefaultSearchScope
SCev
```

I can then change it to the _Search the Current Folder_ option like so:

```bash
❯ defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
```

All the open Finder windows still hold the original setting. I need to do a
`killall Finder` to effectively reload them. Now if I try doing a search, it
should default to the current directory instead of _This Mac_.
