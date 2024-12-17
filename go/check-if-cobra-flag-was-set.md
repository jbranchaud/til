# Check If Cobra Flag Was Set

When using [Cobra](https://github.com/spf13/cobra) to define a CLI, we can
specify a flag for a command like so:

```go
var Seed int64
myCmd.PersistentFlags().Int64VarP(&Seed, "seed", "", -1, "set a seed")
```

This `--seed` flag has a _default_ of `-1`. If the flag isn't specified, then
when we access that flag's value, we'll get `-1`.

But how do we differentiate between the _default_ `-1` and someone passing `-1`
to the `--seed` flag when running the program?

In the command definition, we can look at the flags and see, by name, if
specific ones were changed by user input rather than being the defaults.

```go
myCommand := &cobra.Command{
	// coommand setup ...
	Run: func(cmd *cobra.Command, args []string) {
		if cmd.Flags().Changed("seed") {
			seed, err := cmd.Flags().GetInt64("seed")
			if err != nil {
				fmt.Println("Seed flag is missing from `cmdFlags()`")
				os.Exit(1)
			}

			fmt.Printf("Seed was set to %d\n", seed)
		} else {
			fmt.Println("Seed was not set")
		}
	}
}
```

If we don't want to rely on the default and instead want to specify some other
behavior when the flag is not manually set by the user, we can detect that
scenario like this.
