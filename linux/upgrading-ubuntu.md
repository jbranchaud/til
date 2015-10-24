# Upgrading Ubuntu

I recently discovered that my Linode box was running a fairly old version of
Ubuntu. Because it is a remote box that I SSH into, there is no graphical
user interface. Upgrading to a newer release can be accomplished with the
following command line utility:

```
$ do-release-upgrade
```

It includes a series of prompts regarding choices about the upgrade and a
lot of waiting.

Adding the `-d` flag will upgrade to the latest development release.
