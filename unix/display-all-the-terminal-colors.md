# Display All The Terminal Colors

The following snippet of bash scripting will print out a nicely formatted
collection of all the terminal colors.

```bash
for x in {0..8}; do 
    for i in {30..37}; do 
        for a in {40..47}; do 
            echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "
        done
        echo
    done
done
echo ""
```

This is a great way to figure out the escape codes you need for coloring and
styling text in a bash script.

[source](https://askubuntu.com/questions/27314/script-to-display-all-terminal-colors)

h/t Dillon Hafer
