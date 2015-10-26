# List All Users

On unix-based systems, all system users are listed with other relevant
information in the `/etc/passwd` file. You can output a quick list of the
users by name with the following command:

```
$ cut -d: -f1 /etc/passwd
```

[source](http://askubuntu.com/questions/410244/a-command-to-list-all-users-and-how-to-add-delete-modify-users)
