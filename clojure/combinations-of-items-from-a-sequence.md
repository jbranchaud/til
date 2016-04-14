# Combinations Of Items From A Sequence

Sometimes we want all combinations of items from a list. For instance, we
may have 5 people and we want to know all the ways that we can unique pair
up 2 people from that group of 5. What we want is the number of
combinations of 2 people from the 5.

The
[clojure/math.combinatorics](https://github.com/clojure/math.combinatorics)
library provides a `combinations` function that gives us exactly that
functionality.

```clojure
(use '[clojure.math.combinatorics :as combo])

(combo/combinations ["Liz", "Tracy", "Kenneth", "Jack", "Jenna"] 2)
; (("Liz" "Tracy") ("Liz" "Kenneth") ("Liz" "Jack")
;  ("Liz" "Jenna") ("Tracy" "Kenneth") ("Tracy" "Jack")
;  ("Tracy" "Jenna") ("Kenneth" "Jack") ("Kenneth" "Jenna")
;  ("Jack" "Jenna"))
```

The `combinations` function takes a list of items and then a number for the
size of the grouping combinations that it is supposed to produce.
