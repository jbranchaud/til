# Define Something Only Once

Clojure provides [`defonce`](https://clojuredocs.org/clojure.core/defonce)
which is a macro that defines something only once. Once a variable has been
bound to a value, subsequent attempts to do `defounce` for that variable
will go unevaluated. This will have no implications for how the `def`
special form works.

Here is an example:

```clojure
(defonce stuff 5)
#'user/stuff
user=> (defonce stuff "what")
nil
user=> stuff
5
user=> (def stuff "okay")
#'user/stuff
user=> stuff
"okay"
```
