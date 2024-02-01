# Step Through Project-Wide Search Results

When you do a project-wide search in VS Code, the Search tray opens and
displays a listing of all the matches file-by-file. This view is handy to
glance at the results and quickly navigate to a specific one. If you need to
look at every single result, clicking through them one by one is slow and
tedious.

A better option for doing this is to use the keybindings for stepping forward
and backward through the results.

Hitting `F4` will go to the next match in the search results. Hitting
`shift+F4` will go to the previous match. Even if you move around, make edits,
and navigate to other files, your position in the search results will be
preserved for the next time you hit `F4`.

[source](https://github.com/Microsoft/vscode/pull/18073)
