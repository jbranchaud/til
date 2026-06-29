# Enable Pyright Type Checking In Cursor

In most ways [Cursor](https://cursor.com/), a clone of VS Code, behaves like VS
Code and uses the same extensions as VS Code. It even offers to clone all your
existing extensions and setup from VS Code when you first install it.

However, the Pyright type checking setup that I had in VS Code stopped working
when I opened up the same Python project in Cursor. It seems that to get Pyright
to reliably work with forks of VS Code, you need to use a compatible fork like
[Based Pyright](https://docs.basedpyright.com/latest/).

Once I installed _Based Pyright_ from the extension marketplace, I was able to
enable it in `.vscode/settings.json`:

```json
{
    ...,
    "basedpyright.analysis.typeCheckingMode": "basic"
}
```

I may have needed to restart Cursor at this point, I cannot remember exactly.
However, once this setup was in place the helpful type checking errors started
appearing as red squiggles.
