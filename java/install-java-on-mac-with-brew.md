# Install Java On Mac With Brew

If you don't already have Java installed on your Mac, you can install it with
homebrew.

```bash
$ brew install java
```

This will take a bit to run and when all is complete, you'll go to run
something like a version check and see this:

```bash
$ java -version
The operation couldn’t be completed. Unable to locate a Java Runtime.
Please visit http://www.java.com for information on installing Java.
```

This is because [OpenJDK](https://openjdk.org/) the open-source implementation
of the Java Development Kit (Java platform) does not get fully set up by
homebrew.

You'll need to symlink `openjdk` and the exact command with correct paths can
be found from running the following:

```bash
$ brew info openjdk

...

For the system Java wrappers to find this JDK, symlink it with
  sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

...
```

The paths may look different for you, so copy the exact command and run that.
Once the symlink is set, check the version again.

```bash
$ java -version
openjdk version "23" 2024-09-17
OpenJDK Runtime Environment Homebrew (build 23)
OpenJDK 64-Bit Server VM Homebrew (build 23, mixed mode, sharing)
```

[source](https://stackoverflow.com/a/65601197/535590)
