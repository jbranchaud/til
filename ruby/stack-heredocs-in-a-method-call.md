# Stack Heredocs In A Method Call

When you put a heredoc directly in a method call as an argument, it is only the
opening identifier that goes in the argument list.

That looks like this:

```ruby
execute_in_transaction(<<~SQL)
  update reading_statuses
  set status = 'abandoned'
  where started_at < (now() - '2 years'::interval)
    and finished_at is null;
SQL
```

You might imagine then that we can put multiple heredocs in a method call. That
leads to [_stacked
heredocs_](https://www.visualmode.dev/ruby-operators/heredoc#stacked-heredocs).

```ruby
execute_in_transaction(<<~SQL1, <<~SQL2, <<~SQL3)
  update reading_statuses
  set status = 'abandoned'
  where started_at < (now() - '2 years'::interval)
    and finished_at is null;
SQL1
  insert into activity_log (name, description)
  values ('abandon_books', 'Mark unread books as abandoned');
SQL2
  delete from background_jobs
  where id = #{job_id}; -- better to sanitize values like this
SQL3
```

Notice we terminate the body of each heredoc with its closing identifier and
immediately begin the body of the next one.
