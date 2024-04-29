# Find The Location Of User Settings JSON File

There are a ton ways to customize and fine-tune VS Code. All of the settings
have defaults which can then be customized on a workspace and user level.
Typically you'll access these files within VS Code via the Command Palette. I
was curious though: since it is just a JSON file, surely I can view and modify
it with any editor.

On a Mac, the user-level `settings.json` file is located at
`~/Library/Application\ Support/Code/User/settings.json`.

Open it up and you might see something like this:

```json
{
  "editor.formatOnSave": true,
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "window.zoomLevel": 1,
  "workbench.editor.showTabs": "single"
}
```

A handful of settings with specific overrides.

Feel free to edit what is in here or add other settings that you want to set.
Just make sure you know what you're doing and that you set valid values.

The VS Code docs list [the locations of these files on other operating
systems](https://code.visualstudio.com/docs/getstarted/settings#_settings-file-locations).

[source](https://stackoverflow.com/questions/53840644/location-of-vs-code-preferences)
