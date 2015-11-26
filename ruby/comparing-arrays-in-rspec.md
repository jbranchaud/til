# Comparing Arrays In RSpec

Among its many built-in matchers, RSpec includes a set of array matchers.
One of the array matchers is `match_array` which compares two arrays
independent of ordering. This is handy if you need to check that a resulting
array matches your expectations when ordering is unimportant and not
necessarily deterministic. It can be used like so:

```ruby
expect([1,2,3]).to match_array([3,2,1])
```

This expectation is met, the test will pass.
