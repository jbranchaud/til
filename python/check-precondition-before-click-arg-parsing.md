# Check Precondition Before Click Arg Parsing

When setting up various [Click](https://click.palletsprojects.com/en/stable/)
subcommands with options, I ran into an issue with the order of some validation
checks. I was putting the same precondition validation logic at the beginning of
several subcommands. I was also putting callback validations on specific options
to those subcommands. Ideally the option validations could rely on those
precondition validations. However, the option callbacks run before anything in
the body of the subcommands.

The solution was to move those preconditions out of the subcommand body
(simplifying the subcommand) and into a `click.Command` subclass.

To demonstrate that, I'll first show the `click.Command` subclass:

```python
class RequireActiveSessionCommand(click.Command):
    def parse_args(self, ctx, args):
        if ctx.obj.active_session is None:
            msg = "No active session being tracked. Start a session first."
            raise click.UsageError(msg)

        return super().parse_args(ctx, args)
```

The only thing this subclass overrides is `parse_args` where it gets ahead of
the standard arg parsing logic to first check the precondition. In this case, I
check that there is an active session. If there isn't, then I can raise a
`click.UsageError`. Otherwise, it delegates back to the super-class
implementation of `parse_args`.

This subclass then gets used for the commands that need to enforce this
precondition. Two prime examples of that are the `stop` and `cancel` subcommands.

```python
@cli.command(cls=RequireActiveSessionCommand)
@click.option("--at", help='Hours previous to end the timer, e.g. "2 hours ago"', callback=validate_stop_at)
@pass_cli
def stop(cli_ctx: CliContext, at: datetime) -> None:
    # ... implementation omitted

@cli.command(cls=RequireActiveSessionCommand)
@pass_cli
def cancel(cli_ctx: CliContext):
    # ... implementation omitted
```

Other subcommands, like `start` and `status` that don't need to enforce this
precondition use the `@cli.command()` decorator without passing in a custom
subclass.

This example is pulled directly from [this commit](https://github.com/jbranchaud/py-vmt/commit/505109b7a4013e05f085cded666c6b1ac7c3c250)
of my [`py-vmt` time tracker tool](https://github.com/jbranchaud/py-vmt).
