# Install rar and unrar packages on Ubuntu to work with .rar compressed files

Run these :

1. Enable multiverse respositories

   ```bash
   $ sudo software-properties-gtk
   ```
   select the unchecked options from dialog and close the dialog.

   OR you may use the add-apt-repository command. If your Ubuntu release is 'saucy':

   ```bash
   $ sudo add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ saucy universe multiverse"
   $ sudo add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ saucy-updates universe multiverse"
   ```

2. Install rar and unrar packages

   ```bash
   $ sudo apt-get update
   $ sudo apt-get install rar unrar
   ```

3. Optionally install unrar-free package from community
   ```bash
   $ sudo apt-get install unrar-free
   ```
