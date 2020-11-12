# Naming Of The Vercel Config File

[Vercel](https://vercel.com/), the company/service, used to be called Now. With
any renaming comes some consistency challenges, even at the level of software.

The naming of the file for configuring your project used to be `now.json`. It
is _now_ `vercel.json`.

For [backwards compatibility
reasons](https://vercel.com/docs/platform/frequently-asked-questions#conflicting-configuration-files),
you can still use either. You cannot and should not have both though.

If you're working with an existing project that uses `now.json`. It is fine to
continue with that naming. It may eliminate some future confusion if you are to
rename it to `vercel.json`. If you're starting a new project, I'd recommend
using `vercel.json`. All the documentation you'll read uses this newer naming
convention.
