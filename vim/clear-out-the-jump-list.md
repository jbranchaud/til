# Clear Out The Jump List

Vim uses a [jump list to track all they jumps you've
made](jump-back-to-the-latest-jump-position.md) during a session.  Vim can
even be configured to keep a record of those jumps between sessions.  This
is really handy for a long-lived project, but what if you want those jumps
cleared out?

You can clear them out for the current and subsequent windows using
`:clearjumps`. The jump list for existing windows will be unchanged and once
you start a new session, the full jump list will be restored.

See `:h :clearjumps` for more details.
