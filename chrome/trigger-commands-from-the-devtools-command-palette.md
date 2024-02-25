# Trigger Commands From The Devtools Command Palette

There are a ton of tabs, drop downs, and nested menus in Chrome's devtools. If
I know what I am looking for, that is great, I can navigate to it without much
trouble. But for other features and commands, I'm stumped and can end up
spending minutes looking around.

For example, where is the option to 'Disable JavaScript'?

I don't know. And I don't need to know.

Instead of searching around for it, I can pop open the devtools _command
palette_ with `cmd+shift+p`. This is a modal menu that prompts me to search for
a command to run. I start typing `disab` and already `Disable JavaScript`
appears as one of the top options. I can select that option and JavaScript will
be disabled.

When I'm ready to turn it back on. I can hit `cmd+shift+p` again and search for
`enab`. The `Enable JavaScript` option appears and I can select it to turn it
back on.

Note: you'll need to have the devtools panel open and your focus will need to
be on it for the keybinding to be picked up.

[source](https://developer.chrome.com/docs/devtools/command-menu)
