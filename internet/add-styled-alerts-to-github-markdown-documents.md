# Add Styled Alerts To GitHub Markdown Documents

The GFM (GitHub Flavored Markdown) variant of markdown adds some nice features
to our GitHub-rendered markdown documents.

One such feature that has been around for a couple years, but which I only just
learned about, are these styled alerts. There are five of them each with a
different color and icon to help convey meaning.

```
> [!NOTE]
> Useful information that users should know, even when skimming content.

> [!TIP]
> Helpful advice for doing things better or more easily.

> [!IMPORTANT]
> Key information users need to know to achieve their goal.

> [!WARNING]
> Urgent info that needs immediate user attention to avoid problems.

> [!CAUTION]
> Advises about risks or negative outcomes of certain actions.
```

I just added the following to the top of one of my project's READMEs to help me
remember that it is not under active development.

```
> [!WARNING]
> This repo is not under active development, you might be looking for
> [til-visualmode-dev](https://github.com/jbranchaud/til-visualmode-dev).
```

Visit the GitHub docs for
[Alerts](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax#alerts)
to see examples of how these render.

[source](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax#alerts)
