# Generate Permutations Of All Valid 9-ball Racks

I wanted to produce a full listing of all valid rack arrangements for the game
of [9-ball](https://en.wikipedia.org/wiki/Nine-ball). The constraints on how a
9-ball rack can be arranged are, first, that the 1 ball must be placed at the
head of the diamond and, second, that the 9 ball must be placed at the center of
the diamond. After that, all other balls (2 through 8) can be placed in any
arrangement.

Because each of those seven remaining balls can be arranged in distinct
orderings where each ball is placed once, this is a
[_permutation_](https://en.wikipedia.org/wiki/Permutation) problem.

> In elementary combinatorics, the k-permutations, or partial permutations, are
> the ordered arrangements of k distinct elements selected from a set. When k is
> equal to the size of the set, these are the permutations in the previous
> sense.

For this problem, the seven distinct elements can be arranged into `7!` (seven
factorial) unique permutations. That is, 5040 permutations.

I can use [Ruby's `Array#permutations`
method](https://docs.ruby-lang.org/en/4.0/Array.html#method-i-permutation) to
enumerate these 5040 permutations like so:

```ruby
[2,3,4,5,6,7,8].permutation.map do |perm|
  [1, *perm[0..2], 9, *perm[3..7]]
end.to_a
=> [[1, 2, 3, 4, 9, 5, 6, 7, 8],
 [1, 2, 3, 4, 9, 5, 6, 8, 7],
 [1, 2, 3, 4, 9, 5, 7, 6, 8],
 [1, 2, 3, 4, 9, 5, 7, 8, 6],
 [1, 2, 3, 4, 9, 5, 8, 6, 7],
 [1, 2, 3, 4, 9, 5, 8, 7, 6],
 [1, 2, 3, 4, 9, 6, 5, 7, 8],
 ...
 [1, 8, 7, 6, 9, 5, 3, 2, 4],
 [1, 8, 7, 6, 9, 5, 3, 4, 2],
 [1, 8, 7, 6, 9, 5, 4, 2, 3],
 [1, 8, 7, 6, 9, 5, 4, 3, 2]]
```
