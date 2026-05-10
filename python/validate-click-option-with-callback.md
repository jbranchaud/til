# Validate Click Option With Callback

I have a [click](https://click.palletsprojects.com/en/stable/) subcommand in my
[`py-vmt` project](https://github.com/jbranchaud/py-vmt) that includes an
`option` specified with the `--at` flag. This is what it originally looked like:

```python
# define `start` subcommand
@cli.command()
@click.argument("project-name")
@click.option("--at", help='Relative time in past to start the time, e.g. "2 hours ago", "33 minutes ago"')
@pass_cli
def start(cli_ctx: CliContext, project_name: str, at: str | None) -> None:
    # ...
```

The value of `at` needs to be in the past. I need a way validate that it is or
otherwise bail early with a useful error message. The optional
[`callback`](https://click.palletsprojects.com/en/stable/advanced/#callbacks-for-validation)
to `@click.option` plus `click.BadParameter` are a good way to handle that.

First, I define a callback handler that does the validation. I even take it a
step further and have it return the transformed value (`datetime`) that the
subcommand logic will need.

```python
def validate_past_time(_ctx, _param, value: str | None) -> datetime:
    now = datetime.now(timezone.utc)

    if value == None:
        return now

    start_at = time_helpers.parse_to_datetime(value)

    if start_time == None or start_at > now:
        raise click.BadParameter("must be a relative time in the past")

    return start_at
```

I ignore the first two arguments because I only need to work with `value`. Value
might be something like `"33 minutes ago"` and I attempt to transform that with
`dateparser` into a `datetime` instance. If it can't be parsed or it isn't in
the past, then I raise `click.BadParameter` which presents the user with useful
usage details.

This callback can then be incorporated into the subcommand like so:

```python
# define `start` subcommand
@cli.command()
@click.argument("project-name")
@click.option(
    "--at",
    help='Relative time in past to start the time, e.g. "2 hours ago", "33 minutes ago"',
    callback=validate_past_time
)
@pass_cli
def start(cli_ctx: CliContext, project_name: str, at: datetime) -> None:
    # ...
```

Now I can expect the incoming `at` option to be a `datetime` which helps
simplify several lines of logic in the `start` implementation.
