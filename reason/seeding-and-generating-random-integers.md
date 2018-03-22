# Seeding And Generating Random Integers

It is easy enough to generate a series of random numbers using the `Random`
module's `int` function.

```reason
Random.int(10);
```

This will generate a random integer between 0 and 9.

You may notice that the randomness is the same each time you run your
program. That is because you have fixed seed. To make sure you have a
different seed each time your program runs, you can initialize the random
number generator with something different at each run, such as the current
time.

```reason
Random.init(int_of_float(Js.Date.now()));
```

See a [live example
here](https://reasonml.github.io/en/try.html?reason=EoQwdgJg9gtgdASzAgLgCiSg+lAZl3AGyhHQCkBnOAEVIFM4woB3NASg4G4AobyuYgHM0oSLERh0ARgAMXPlSEjw0eJjSz5-JaNUTpctj21Rhu8es1GFA08rFrJGw5yA).
