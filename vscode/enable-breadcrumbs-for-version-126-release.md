# Enable Breadcrumbs For Version 1.26 Release

The latest release of Code ([Version
1.26](https://code.visualstudio.com/updates/v1_26)) brings about a lot of
exciting new features -- including file breadcrumbs at the top of each file
editor view.

![Breadcrumbs feature in action](https://i.imgur.com/wubUn6c.png)

By default this feature is not enabled. You can enable it from User Settings
(`Cmd+Shift+P`, 'User Settings'). From the User Settings view, you can
search for `breadcrumbs` and you'll see the following item:

```json
  "breadcrumbs.enabled": false,
```

Use the pencil to override it to `true` and you'll have that trail of
breadcrumbs waiting for you.
