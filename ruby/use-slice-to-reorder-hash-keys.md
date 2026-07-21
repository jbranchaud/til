# Use Slice To Reorder Hash Keys

I recently ran into some code that was building up a hash keyed by _category_.
It was a series of chained method calls building and transforming to produce the
hash. It then ended with `.slice(*CATEGORIES)`.

That
[`Hash#slice`](https://docs.ruby-lang.org/en/master/Hash.html#method-i-slice)
call at the end was doing two things:

1. It was removing any key-value pairs not in `CATEGORIES`
2. It was reordering the hash keys based on the order they appeared in `CATEGORIES`

It was this second behavior that surprised me.

Let's look at a minimum example of this:

```ruby
> CATEGORIES = [:books, :clothes, :glassware]
=> [:books, :clothes, :glassware]
> items_by_category = { glassware: [1,2,3], media: [:a, :b, :c], books: [:e, 3, :g], clothes: [4, 5] }
=> {glassware: [1, 2, 3], media: [:a, :b, :c], books: [:e, 3, :g], clothes: [4, 5]}
> items_by_category.slice(*CATEGORIES)
=> {books: [:e, 3, :g], clothes: [4, 5], glassware: [1, 2, 3]}
```

- I first define `CATEGORIES` which is an (ordered) array of symbols that
  represent the categories I care about.
- Then I manufacture a hash of items by category. This is a bunch of dummy data,
  including extra categories, meant to demonstrate what `#slice` can do.
- Lastly I call `.slice(*CATEGORIES)` on this hash which both pairs it down to
  that set of categories and reorders the hash so that the keys appears in the
  same order they do in the `CATEGORIES` array.

This might be useful if I've defined `CATEGORIES` to be in a specific display
order and I'm preparing this hash for consumption in some UI layer.
