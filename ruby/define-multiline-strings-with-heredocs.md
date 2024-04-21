# Define Multiline Strings With Heredocs

[A _heredoc_ (_here document_) is a special ruby
syntax](https://ruby-doc.org/core-2.5.0/doc/syntax/literals_rdoc.html#label-Here+Documents)
for defining formatted multiline strings. These are useful for any situation
where you need to define a block of text where newlines and indentation are
preserved -- e.g. output an error, help message, or some formatted SQL.

The standard syntax is defined with `<<` and some uppercase identifier (e.g.
`TXT`, `DOC`, `SQL`, etc.) to open and close the multiline string.

```ruby
def lookup_team(team_id)
  query = <<SQL
    select users.id from users
      join teams
        on teams.id = users.team_id
      where teams.id = #{team_id}
      order by created_at desc
      limit 10;
SQL

  team_member_ids = db.execute(query)
end
```

With the SQL formatted this way, it is easier to read and we can print/log out
this nicely formatted version to make debugging easier.

Notice that the terminating `SQL` identifier is fully left justified. I find
that visually off relative to the indentation of everything else, so I like to
use the _indented_ heredoc syntax (`<<-`).

```ruby
def lookup_team(team_id)
  query = <<-SQL
    select users.id from users
      join teams
        on teams.id = users.team_id
      where teams.id = #{team_id}
      order by created_at desc
      limit 10;
  SQL

  team_member_ids = db.execute(query)
end
```
