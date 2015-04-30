# All or Nothing Database Transactions

When you are updating multiple records in an *all or nothing* scenario, you
can use [Active Record
Transactions](http://api.rubyonrails.org/classes/ActiveRecord/Transactions/ClassMethods.html)
to ensure that either everything is updated or none of it is updated.

For instance, if you are transferring *internet points* from one user's
account to another user's account, you need to be sure that the transfer
balances out. If updating one user is successful, but updating the other
fails, then there will be a discrepancy in the data. A transaction will
ensure that when any part of the update fails the entire transaction is
rolled back (at the database level).

```ruby
User.transaction do
  user1.internet_points += 20
  user2.internet_points -= 20
  user1.save!
  user2.save!
end
```
