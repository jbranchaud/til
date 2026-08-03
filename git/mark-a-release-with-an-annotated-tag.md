# Mark A Release With An Annotated Tag

There are two kinds of tags in Git -- lightweight tags and annotated tags.

The [`git-tag` docs](https://git-scm.com/docs/git-tag) explain the distinction:

> Annotated tags are meant for release while lightweight tags are meant for
> private or temporary object labels.

When an annotated tag is created, a _tag object_ is created which has a creation
timestamp, a "tagger" (who created it), a message, and potentially a signature
if GPG commit signing is configured.

I can create an annotated tag for the `HEAD` commit like so:

```bash
❯ git tag -a v0.1.0 -m "Release v0.1.0"
```

I can then inspect what was created in a number of ways using `git tag --list`,
`git show`, `git cat-file`, and `git log --show-signature`.

```bash
❯ git tag --list
v0.1.0

❯ git show --no-patch v0.1.0
tag v0.1.0
Tagger: jbranchaud <jbranchaud@gmail.com>
Date:   Sun, 2 Aug 2026 13:57:37 -0500

Release v0.1.0

commit 8a533ecfda526ebd1a4695639830f5620dd8572d (HEAD -> main, tag: v0.1.0, origin/main, origin/HEAD)
Author: jbranchaud <jbranchaud@gmail.com>
Date:   Sun, 2 Aug 2026 12:51:41 -0500

    Add changelog with v0.1.0 release changes documented

❯ git cat-file -t v0.1.0
tag

❯ git cat-file -p v0.1.0
object 8a533ecfda526ebd1a4695639830f5620dd8572d
type commit
tag v0.1.0
tagger jbranchaud <jbranchaud@gmail.com> 1785697057 -0500

Release v0.1.0

❯ git log --show-signature
commit 8a533ecfda526ebd1a4695639830f5620dd8572d (HEAD -> main, tag: v0.1.0, origin/main, origin/HEAD)
gpg: Signature made Sun Aug  2 13:57:09 2026 CDT
gpg:                using RSA key B2570A9DA3E2A537781501B11A8656918A8D016B
gpg: Good signature from "jbranchaud <jbranchaud@gmail.com>" [ultimate]
Author: jbranchaud <jbranchaud@gmail.com>
Date:   Sun, 2 Aug 2026 12:51:41 -0500

    Add changelog with v0.1.0 release changes documented

...
```

This tag will be included in a push when I run either of the following:

```bash
❯ git push origin main
❯ git push origin v0.1.0
```

This tag, which is now tied to a _release_, can be seen at [_Releases /
v0.1.0_](https://github.com/jbranchaud/py-vmt/releases/tag/v0.1.0) on GitHub.

See `man git-tag` for more details.
