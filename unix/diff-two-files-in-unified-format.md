# Diff Two Files In Unified Format

The `diff` command is a standalone utility that can be used to get the
difference between two files. It is similar to what you might expect when
running `git diff` which compares two different versions of the same file. The
`diff` command predates `git` and its unified format is what became the standard
that `git` uses for its own diff implementation.

Running `diff` with two files as is gives output like the following:

```bash
❯ diff startup.sh startup2.sh
10,13c10,14
< declare -A SESSIONS=(
<   ["TIL"]="$HOME/dev/jbranchaud/til:setup_til"
<   ["PLP"]="$HOME/dev/jbranchaud/pool-league-pro:"
<   ["client-app"]="$HOME/dev/client/client-app:"
---
> # Sessions will be created in the order listed here
> SESSIONS=(
>   "TIL:$HOME/dev/jbranchaud/til:setup_til"
>   "PLP:$HOME/dev/jbranchaud/pool-league-pro:"
>   "client-app:$HOME/dev/client/client-app:"
73,74c74,75
<   for session_name in TIL PLP client-app; do
<     IFS=':' read -r directory setup_function <<<"${SESSIONS[$session_name]}"
---
>   for session_config in "${SESSIONS[@]}"; do
>     IFS=':' read -r session_name directory setup_function <<<"$session_config"
```

That's readable at a glance, but the unified format (with the `-u` flag) can
provide more context:

```bash
❯ diff -u startup.sh startup2.sh
--- startup.sh  2026-01-10 12:46:52
+++ startup2.sh 2026-01-10 12:48:00
@@ -7,10 +7,11 @@

 # Session configurations
 # Format: "session_name:directory:setup_function"
-declare -A SESSIONS=(
-  ["TIL"]="$HOME/dev/jbranchaud/til:setup_til"
-  ["PLP"]="$HOME/dev/jbranchaud/pool-league-pro:"
-  ["client-app"]="$HOME/dev/client/client-app:"
+# Sessions will be created in the order listed here
+SESSIONS=(
+  "TIL:$HOME/dev/jbranchaud/til:setup_til"
+  "PLP:$HOME/dev/jbranchaud/pool-league-pro:"
+  "client-app:$HOME/dev/client/client-app:"
 )

 # Setup function for TIL session
@@ -70,8 +71,8 @@
   echo ""

   # Create sessions in order
-  for session_name in TIL PLP client-app; do
-    IFS=':' read -r directory setup_function <<<"${SESSIONS[$session_name]}"
+  for session_config in "${SESSIONS[@]}"; do
+    IFS=':' read -r session_name directory setup_function <<<"$session_config"
     create_session "$session_name" "$directory" "$setup_function"
   done
```

Here we get additional context like surrounding lines and file name details.

While this is useful on its own, it also has the added benefit of making the
output compatible with other tools we may already be using. For instance, I'm
already using [delta](https://github.com/dandavison/delta) as my [git pager](https://github.com/jbranchaud/dotfiles/blob/main/gitconfig#L51) and [git differ](https://github.com/jbranchaud/dotfiles/blob/main/gitconfig#L139).

With the unified format, I can pipe the output directly to `delta` to get a
better view of the diff that is colorized and includes syntax highlighting.

```bash
❯ diff -u startup.sh startup2.sh | delta
```
