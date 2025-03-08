# Filter ActiveStorage Blobs To Only Images

If your Rails app is using `ActiveStorage` for both images and ActionMailbox
emails, then you're going to have a mix of both in the `active_storage_blobs`
table.

```sql
> select id, filename, content_type from active_storage_blobs limit 2;

| id | filename           | content_type   |
|----|--------------------|----------------|
|  1 | shirt-brothers.jpg | image/jpeg     |
|  2 | message.eml        | message/rfc822 |
```

In that case, you are going to want to make sure that any part of your system
that only cares to deal with images filters down to only blobs where the
`content_type` is one that you care about.

I expect that there might be a couple different image `content_type` values
that my system handles, so I filter my `active_storage_blobs` like so:


```ruby
@images =
  ActiveStorage::Blob
    .where(content_type: %w[image/jpeg image/png image/gif image/webp])
    .order(created_at: :desc)
    .first(10)
```
