# Jump Out Of A Nested Context With Throw/Catch

Ruby's `throw/catch` construct, not to be confused with its `raise/rescue`
exception handling syntax, allows you to jump out of a nested context. This is
similar to [loop
labels](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/label)
in other languages.

For example, in my recent [Advent of Code
solution](https://www.youtube.com/watch?v=Hvp07gTQhF4), I was able to employ
this construct. Once within a doubly-nested loop, I can `throw` when I find the
answer I'm looking for to both break out of the loop and return an value.

```ruby
answer =
  catch do |obj|
    input.each_with_index do |input1, x|
      input.each_with_index do |input2, y|
        next unless x != y

        next unless input1 + input2 == 2020

        throw(obj, input1 * input2)
      end
    end

    raise StandardError, 'No answer found'
  end

puts answer
```

If I were to never reach the `throw` before exhausting the doubly-nested loop,
then the catch would product whatever value is returned within the block. In
this case, I raise an error because it'd be exceptional for the `throw` to
never be reached.

[source](https://apidock.com/ruby/Kernel/catch)
