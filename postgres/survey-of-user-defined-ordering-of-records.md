# Survey Of User-Defined Ordering Of Records

### Approaches

#### Positional Indexes

Assign an integer position to everything in the list. To insert something in
the middle of the list, you assign it that position and then increment the
position each item in the list after it by one. Can require a lot more writes
than other approaches.

#### Positional Averaging

You can insert an item between two others with a single operation by taking the
average of the positional values (indexes) of the two surrounding items and
making that the position of the item being inserted.

- Decimal / Floating-Point - runs out of precision fairly quickly
- Fractional / True Fractions - much more precision, trickier to implement
- Large Int Boundaries - add first item at `0`, add second item at average of
  `0` and `MAX_INT`. Need to insert at the front of the list, average lowest
  index item with `MIN_INT`. [source](https://github.com/brendon/ranked-model/blob/master/lib/ranked-model.rb#L8-L11)

#### LexoRank

Similar to the (numeric) positional averaging approaches, but uses strings
instead to get much more precision. Lexicographical ordering is used. To insert
between two items, add a character to the end of the string that will position
it between the two items.

#### Stored Array

Store an ordered array of element IDs either as a `jsonb` column or stringified
JSON in a `text` column on the _collection_ table. If you have `list_items`
that are ordered, then the `lists` table will have an `ordering` column of
`list_items` IDs. You lose referential integrity with this approach.

Here is an [example
implementation](https://gist.github.com/jbranchaud/a00e0d6d17d562bec3007e3a4bcace94).

#### Linked List

A singly or doubly linked list where each item points to the next item in the list (and in the case of the doubly, points back to its previous item).

[source](https://news.ycombinator.com/item?id=25802129)

### References

- [User-defined Order in SQL](https://begriffs.com/posts/2018-03-20-user-defined-order.html)
- [Building Sortable Relations with PostgreSQL](https://brunoscheufler.com/blog/2022-09-26-building-sortable-relations-with-postgresql)
- [User Defined Ordering Made Easy](https://steve.dignam.xyz/2020/03/31/practical-ordering/)
- [Realtime Editing of Ordered Sequences](https://www.figma.com/blog/realtime-editing-of-ordered-sequences/#fractional-indexing/) (fractional indexing)
- [Numeric and String Indexing](https://stackoverflow.com/questions/9536262/best-representation-of-an-ordered-list-in-a-database/49956113#49956113)
- [Keeping an ordered collection in PostgreSQL](https://medium.com/the-missing-bit/keeping-an-ordered-collection-in-postgresql-9da0348c4bbe)
- [Jira’s ranking system explained](https://tmcalm.nl/blog/lexorank-jira-ranking-system-explained/)
- [JIRA LexoRank Explained](https://www.youtube.com/watch?v=OjQv9xMoFbg)
- [User-defined Order in SQL | Hacker News](https://news.ycombinator.com/item?id=16635440)

### Examples / Implementations

- [Ranked Model - big integer positional averaging](https://github.com/brendon/ranked-model/blob/master/lib/ranked-model/ranker.rb#L174-L181)
- [LexoRank Ruby Gem](https://github.com/richardboehme/lexorank)
