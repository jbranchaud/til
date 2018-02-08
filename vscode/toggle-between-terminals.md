# Toggle Between Terminals

VSCode allows you to have multiple terminal tabs, but you have to manually
switch between them with a drop down. For me, that is a lot of mouse action.
I'd prefer to have a keyboard shortcut that allows me to switch between
them. Fortunately, there are commands for going to the next and previous
terminal which can be attached to keybindings.

Try adding the following two entries to your `keybindings.json` file:

```json
[
  { "key": "cmd+shift+k", "command": "workbench.action.terminal.focusNext" },
  { "key": "cmd+shift+j", "command": "workbench.action.terminal.focusPrevious" },
]
```

Save the file and then start toggling between your different VSCode
terminals.

[source](https://github.com/Microsoft/vscode/issues/37937)
