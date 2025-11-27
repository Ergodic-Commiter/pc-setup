

- I want two users, `diego` for Plasma and `diego2` for Gnome. 
- Each user has its configuration files in their home folder.
- I need a shared folder for the work I do.  This is located in `/home/common/`.

```
$ sudo mkdir -p /home/common/{Code,conda,dot-ssh}
$ sudo groupadd my-group
$ sudo chgrp -R my-group /home/common
$ sudo chmod -R 775 /home/common
$ useradd -D -g my-group diego
$ useradd -D -g my-group diego2

```
Refence:  https://www.tutorialspoint.com/how-to-create-a-shared-directory-for-all-users-in-linux

 






