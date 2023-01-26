# Loop Over A List Of Dictionaries

Ansible's `loop` can iterate over a list of dictionaries in a task. That task
will be evaluated for each `item` in that list. Since each `item` is a
dictonary, we can access the fields on the `item` directory with dot notation —
`item.name`.

Here is what this would look like for a task that is setting up authorized SSH
keys.

```yaml
---
- hosts: all
  vars:
    dev_users:
      - name: alice
        ssh_key_url: https://github.com/dev1.keys
      - name: bob
        ssh_key_url: https://github.com/dev2.keys
  tasks:
    - name: Set authorized keys taken from url
      ansible.posix.authorized_key:
        user: "{{ item.name }}"
        state: present
        key: "{{ item.ssh_key_url }}"
      loop: "{{ dev_users }}"
```

Notice the `loop` over the `dev_users` variable gives us access to an `item` in
the task. Because each `item` has a `name` and an `ssh_key_url`, we can access
those fields in the task.

[source](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_loops.html#standard-loops)
