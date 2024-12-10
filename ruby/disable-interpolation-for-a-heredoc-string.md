# Disable Interpolation For A Heredoc String

As a matter of convenience, a heredoc performs string interpolation by default.

Here is an example of that.

```ruby
irb(main):087> word = 'taco'
=> "taco"
irb(main):088" puts <<-TEXT
irb(main):089"   I want to eat a #{word}!
irb(main):090> TEXT
  I want to eat a taco!
=> nil
```

A much less common scenario is that we don't want string interpolation to take
place. For whatever reason, we want the exact string to be preserved. To
achieve that, we can wrap the opening heredoc identifier in single quotes.

As you can see, the `#{word}` portion is preserved.

```ruby
irb(main):091> word = 'taco'
=> "taco"
irb(main):092' puts <<-'TEXT'
irb(main):093'   I want to eat a #{word}!
irb(main):094> TEXT
  I want to eat a #{word}!
=> nil
```

This syntax puts the heredoc in single-quote mode. I left the IRB line preamble
in for each codeblock so that you can see the difference. The first example
(lines 88 and 89) shows the heredoc is double-quoted. The second example (lines
92 and 93) shows the heredoc is single quoted.

Note: the closing heredoc identifier (`TEXT` in this case) is not wrapped in
single quotes, just the opening one.

[source](https://ruby-doc.org/3.3.6/syntax/literals_rdoc.html#label-Here+Document+Literals)
