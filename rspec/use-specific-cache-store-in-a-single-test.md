# Use Specific Cache Store In A Single Test

It is generally recommended to use `:null_store` as the default cache store
across your test suite. This is defined in `config/environments/test.rb`.

```ruby
  config.cache_store = :null_store
```

This generally simplifies tests by avoiding confusing stateful scenarios.

If there is a test where you want to observe specific caching behavior, then
you'll need to temporarily swap that for another store.

One way to do that is by mocking the cache with `MemoryStore` in a before
block.

```ruby
describe '#caching_feature' do
  # use MemoryStore cache for these tests
  before do
    allow(Rails)
      .to receive(:cache)
      .and_return(ActiveSupport::Cache::MemoryStore.new)
  end

  it 'does caching' do
    thing = Thing.caching_feature(1)

    expect(thing.value).to eq true

    thing.update(value: false)

    thing = Thing.caching_feature(1)

    expect(thing.value).to eq true
  end
end
```

[One source](https://stackoverflow.com/a/31932795/535590) and [another](https://makandracards.com/makandra/46189-how-to-rails-cache-for-individual-rspec-tests)
