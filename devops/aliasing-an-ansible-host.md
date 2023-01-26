# Aliasing An Ansible Host

When specifying the hosts that Ansible can interact with in the
`/etc/ansible/hosts` file, you can put just the IP address of the host
server, like so:

```yml
192.168.1.50
```

IP addresses are not particularly meaningful for a person to look at though.
Giving it a name serves as better documentation and makes it easier to see
what host servers are in play during a task.

Ansible makes it easy to alias host servers. For example, we can name our
host `staging` like so:

```yml
staging ansible_host=192.168.1.50
```

[source](https://docs.ansible.com/ansible/latest/inventory_guide/intro_inventory.html#inventory-aliases)
