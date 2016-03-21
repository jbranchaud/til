# Attach A File With Capybara

There are two ways to attach a file with
[Capybara](https://github.com/jnicklas/capybara). The more conventional way
is with the
[`attach_file`](http://www.rubydoc.info/github/jnicklas/capybara/Capybara%2FNode%2FActions%3Aattach_file)
method.

Assuming there is a form with a file input similar to the following:

```html
<label for='data-file'>Data File</label>
<input type='file' name='data-file' />
```

```ruby
attach_file('data-file', 'path/to/file.csv')
```

The first argument to `attach_file` is a locator which refers to the `name`
attribute on the `input` tag.

If for some reason there is no `name` attribute on the `input` tag, the file
can be attached with a standard `find` and `set`.

```ruby
find('form input[type="file"]').set('path/to/file.csv')
```
