# List The Available JDKs

Want to know what JDK versions are installed and available on your machine?
There is a command for that.

```bash
$ /usr/libexec/java_home -V
Matching Java Virtual Machines (3):
    9.0.4, x86_64:      "Java SE 9.0.4" /Library/Java/JavaVirtualMachines/jdk-9.0.4.jdk/Contents/Home
    1.8.0_162, x86_64:  "Java SE 8"     /Library/Java/JavaVirtualMachines/jdk1.8.0_162.jdk/Contents/Home
    1.8.0_161, x86_64:  "Java SE 8"     /Library/Java/JavaVirtualMachines/jdk1.8.0_161.jdk/Contents/Home

/Library/Java/JavaVirtualMachines/jdk-9.0.4.jdk/Contents/Home
```

The listed VMs show what JDK versions you have and the final line shows
which is currently the default version.
