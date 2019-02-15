# Connect To An RDS PostgreSQL Database

You can connect to an RDS PostgreSQL database remotely via `psql`. First,
you need to tell AWS that connections from your IP address are allowed. This
is done by configuring the VPC (Virtual Private Cloud) that is associated
with the RDS instance. You'll need to add an inbound rule to the Security
Group associated with that VPC. You'll add an inbound rule that allows a
Postgres connection on port 5432 from your IP address -- which is identified
by a [CIDR
address](https://www.digitalocean.com/community/tutorials/understanding-ip-addresses-subnets-and-cidr-notation-for-networking#cidr-notation).

![create inbound rule](https://i.imgur.com/Ypb9Du7.png)

Once this rule has been added to the security groups associated with the VPC
that is associated with your RDS instance, you'll be able to connect from
your machine with `psql`.

```bash
$ psql my-rds-endpoint.cbazqrhkmyo.us-east-1.rds.amazonaws.com \
    --port 5432 \
    --user rdsusername \
    postgres
```

Assuming the database username is `rdsusername` and the specific database is
named `postgres`, you'll be prompted for that user's password and then
connected.
