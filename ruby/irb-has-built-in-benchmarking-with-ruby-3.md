# IRB Has Built-In Benchmarking With Ruby 3

As of Ruby 3.0.0, `irb`—Ruby's interactive console—comes with a `measure`
method. This can be used to turn the processing time feature on and off. With
it on, you can do rough benchmarking of how long different process take.

Ruby `measure` or `measure(true)` to turn on the timing feature.

```ruby
> measure
TIME is added.
=> nil
```

Once it is enabled, any command you run will including processing time details:

```ruby
> array = [1,2,3,4]
processing time: 0.000033s
=> [1, 2, 3, 4]
> array.zip(array).map { |a,b| a * b ** (a * b) }
processing time: 0.000057s
=> [1, 32, 59049, 17179869184]
```

[source](https://jemma.dev/blog/irb-measure)
