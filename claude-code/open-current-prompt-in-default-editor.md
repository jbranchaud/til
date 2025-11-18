# Open Current Prompt In Default Editor

[Claude Code](https://www.claude.com/product/claude-code) gives you a single
line to write a prompt. You can write and write as much as you want, but it will
all be on that single line. And avoid accidentally hitting 'Enter' before you're
done.

I found myself wanting to space out my thoughts, create a code block as part of
a prompt, and generally have a scratch pad instead of just a text box. By
hitting `ctrl-g`, I can move the current prompt into my default editor (in my
case, `nvim`). From there I can continue to write, edit, and format with all the
affordances of an editor.

Once I'm done crafting the prompt, I can save (e.g. `:wq`) and Claude Code will
be primed with that text. I can then hit 'Enter' to let `claude` do its thing.
