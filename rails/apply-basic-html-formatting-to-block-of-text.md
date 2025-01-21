# Apply Basic HTML Formatting To Block Of Text

My Rails app has a form that allows a user to enter in free-form text. I enter
in a couple paragraphs and save the record. It is rendered on a show page with
a couple lines of ERB like so:

```ruby
<div class="max-w-3xl mx-auto">
  <div class="space-y-4">
    <div class="prose mt-8 text-gray-700">
      <%= @record.notes %>
    </div>
  </div>
</div>
```

When I view the erb-displayed version of that record's text, all those
carefully spaced paragraphs are clumped together. That is because those newline
(`\n` and `\n\n`) characters while understood to be whitespace do not have
formatting implications in the browser like a combination of HTML tags and CSS
do.

I can apply some basic formatting with [the aptly named `simple_format` method
available as an `ActionView`
helper](https://api.rubyonrails.org/classes/ActionView/Helpers/TextHelper.html#method-i-simple_format).

```ruby
<div class="max-w-3xl mx-auto">
  <div class="space-y-4">
    <div class="prose mt-8 text-gray-700">
      <%= simple_format(@record.notes) %>
    </div>
  </div>
</div>
```

This turns single `\n` characters into a `<br />` tag and double `\n\n` cause
the surrounding paragraphs to be wrapped in `<p>` tags. That simple formatting
combined with my existing TailwindCSS styles makes the formatting of my text
immediately look much better.
