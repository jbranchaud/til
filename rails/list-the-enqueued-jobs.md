# List The Enqueued Jobs

Many Rails apps need to delegate work to jobs that can be performed at a
later time. Both unit and integration testing can benefit from asserting
about the jobs that get enqueued as part of certain methods and workflows.
Rails provides a handy helper method for checking out the set of enqueued
jobs at any given time.

The
[`enqueued_jobs`](http://api.rubyonrails.org/classes/ActiveJob/QueueAdapters/TestAdapter.html#method-i-enqueued_jobs)
method will provide a store of all the currently enqueued jobs.

It provides a number of pieces of information about each job. One way to
use the information is like so:

```ruby
describe '#do_thing' do
  it 'enqueues a job to do a thing later' do
    Processor.do_thing(arg1, arg2)
    expect(enqueued_jobs.map { |job| job[:job] }).to match_array([
      LongProcessJob,
      SendEmailsJob
    ])
  end
end
```

To use this in your Rails project, just enable the adapter in your test
configuration file:

```ruby
Rails.application.config.active_job.queue_adapter = :test
```
