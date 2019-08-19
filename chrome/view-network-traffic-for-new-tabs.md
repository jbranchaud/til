# View Network Traffic For New Tabs

Generally when you open a new tab and pop open the Network panel in the chrome
devtools, you won't immediately see any traffic. This is because the initial
network requests to load the site happened before you accessed the Network
panel.

If you'd like to view the Network traffic immediately without having to refresh
the new tab, you'll have to make the devtools panel open automatically with new
tabs.

1. Click the _triple dot_ icon from the top of the devtools panel
2. Click 'Settings'
3. Find the 'DevTools' section
4. Check the box for 'Auto-open DevTools for popups'

Now, whenever you open a new tab, Chrome devtools will be open and the initial
network traffic will be recorded.

[source](https://stackoverflow.com/questions/16210468/chrome-dev-tools-how-to-trace-network-for-a-link-that-opens-a-new-tab)
