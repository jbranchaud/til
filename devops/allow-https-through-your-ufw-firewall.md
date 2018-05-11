# Allow HTTPS Through Your UFW Firewall

UFW -- Uncomplicated Firewall -- is just what is sounds like. I have it
running on a DigitalOcean box and it is only letting through traffic on
ports 80 (HTTP) and 22 (SSH). I am setting up SSL for a domain hosted on
this box which means I need to also let through traffic on 443 (HTTPS).

The allowed ports can be checked with the `status` command:

```bash
$ sudo ufw status

Status: active

To                         Action      From
--                         ------      ----
OpenSSH                    ALLOW       Anywhere
Nginx HTTP                 ALLOW       Anywhere
OpenSSH (v6)               ALLOW       Anywhere (v6)
Nginx HTTP (v6)            ALLOW       Anywhere (v6)
```

As we can see, `HTTPS` has not yet been allowed by `ufw`. We can _allow_
HTTPS traffic with the `allow` command.

```bash
$ sudo ufw allow https
```

Check the status again and see that `HTTPS` is now included in the list.

[source](https://www.digitalocean.com/community/tutorials/how-to-setup-a-firewall-with-ufw-on-an-ubuntu-and-debian-cloud-server)

h/t Dillon Hafer
