# Quitting IEx

There are two ways to quit out of an Interactive Elixir shell. The standard
way is with `Ctrl-c`. This gives you a list of options, one of which is `a`
for _abort_. This will terminate your IEx session and drop you back on the
command line where the process started.

Additionally, IEx also understands `Ctrl-\` which is control key that will
terminate just about any interactive environment. This command will cause
IEx to immediately exit with no prompt.

Note: IEx does not, however, respond to `Ctrl-d`.

[source](http://blog.plataformatec.com.br/2016/03/how-to-quit-the-elixir-shell-iex/)
