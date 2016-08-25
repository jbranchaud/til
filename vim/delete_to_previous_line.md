# Delete from the current line to the previous

Today I had this piece of code
```ruby
special_partial: 'application_updates/edit_link_app_info_section',
can_publish: @can_publish }
```
And I wanted to remove from the `,` line to the `}` line two. You can do it using the `d` and a motion. It's simple.

## From the `,`
```ruby
special_partial: 'application_updates/edit_link_app_info_section',
                                                                ^
can_publish: @can_publish }
```
Then do `d/}` and then enter

## From the `}`
```ruby
special_partial: 'application_updates/edit_link_app_info_section',
can_publish: @can_publish }
                         ^
```
Then do `d?'` and then enter
