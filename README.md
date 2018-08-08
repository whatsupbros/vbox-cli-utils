# VirtualBox Command Line Interface Utilities

This is a repository for utility scripts which make our lifes easier when it comes to managing **Oracle VirtualBox** virtual machines using [`VBoxManage`](https://www.virtualbox.org/manual/ch08.html).

All scripts take necessary command line arguments. If an argument is not provided, value for the variable is prompted. Additionaly, for more convenience, scripts usually print some info to help users woth the input.

Usage example of the restore snapshot script (**usage notes for other scripts are given in the annotation section inside the scripts**):

    ./07_snapshot_restore.sh [virtual_machine_name/UUID] [snapshot_name]

If both parameters are omitted, the user is prompted to specify the virtual machine name or UUID (the list of *available machines* is printed on the screen), and then to specify the snapshot name to be restored (the list of available snapshots is printed on the screen as well).

The user can also omit only the second parameter, like this:

    ./07_snapshot_restore.sh CentOS7

Where `CentOS7` is the name of a virtual machine. In such a case the script will print the list of *available snapshots* for the machine `CentOS7` and will prompt the user to input the snapshot name to restore, then will restore the specified snapshot.
