# Pipe Into A Case Statement

The standard use of a case statement looks something like this:

```elixir
case HTTPoison.get(url) do
  {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
    IO.puts body
  {:ok, %HTTPoison.Response{status_code: 404}} ->
    IO.puts "Not found :("
  {:error, %HTTPoison.Error{reason: reason}} ->
    IO.inspect reason
end
```

If you are a fan of the pipe syntax, then you may enjoying writing the above
like this:

```elixir
url
|> HTTPoison.get()
|> case do
  {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
    IO.puts body
  {:ok, %HTTPoison.Response{status_code: 404}} ->
    IO.puts "Not found :("
  {:error, %HTTPoison.Error{reason: reason}} ->
    IO.inspect reason
end
```

Just like any function, the value from the previous line in the pipe will be
passed in and used as the value switched over in the case statement.
