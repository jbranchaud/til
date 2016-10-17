# Simulating Various Connection Speeds

I spend everyday building web apps from a machine that has a wired
connection to the internet. Though I spend a lot of time loading various
pages and experiencing the app like a user might, I end up having a pretty
narrow perspective. What will this app be like for people on various
qualities of mobile connections?

Chrome has a feature built in to its devtools that makes it easy to throttle
your connection to simulate various speeds. Open up devtools with
`Cmd+Opt+J`, navigate to the _Network_ tab, and then open the throttling
drop down.

![](http://i.imgur.com/EI3H9Oe.png)

From here we can select the connection speed we want to simulate. If we then
reload the page, we will not only experience the page load at that speed, we
will also see the numbers in that _Network_ tab.
