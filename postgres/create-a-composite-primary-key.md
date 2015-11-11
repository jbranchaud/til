# Create A Composite Primary Key

The unique identifier for a given row in a table is the *primary key*.
Generally, a row can be uniquely identified by a single data point (such as
an id), so the primary key is simply that single data point. In some cases,
your data can be more appropriately uniquely identified by multiple values.
This is where composite primary keys can lend a hand. Consider an example
`plane_tickets` table where each ticket can be uniquely identified by the
passenger and flight it is associated with:

```sql
create table plane_tickets (
  passenger_id integer references passengers not null,
  flight_id integer references flights not null,
  confirmation_number varchar(6) not null,
  seat_assignment varchar not null,
  primary key (passenger_id, flight_id)
);
```
