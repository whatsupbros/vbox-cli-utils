#!/bin/bash

#
# Author: Denis Savenko
# Created: 08.08.2018
# Purpose: Deletes the snapshot with the specified name for the specified virtual machine
#
# Usage: ./08_snapshot_delete.sh [virtual_machine_name/UUID] [snapshot_name]
# Comments: If both parameters omitted, the names of virtual machine and snapshot are prompted
#           If second parameter omitted, the name of snapshot is prompted
#


# takes first command line parameter as virtual machine name if exists
if [ -n "$1" ]; then
    name=$1;
# else prints available virtual machines
# and promts the user to specify virtual machine name
else
    echo -e "\nAvailable virtual machines:"

    # saves list of VMs into variable
    vmslist=$(vboxmanage list vms)

    if [ -n "$vmslist" ]; then
	echo -e "$vmslist"
    else
	echo -e "<no VMs found>"
	exit
    fi

    echo -e "\n"
    read -p "Enter name or UUID of virtual machine: " name;
fi

# takes second command line parameter if exists as snapshot name
if [ -n "$2" ]; then
    snapshot=$2;
# else lists available snapshots for the machine 
# and promts the user to specify snapshot name or UUID to delete
else
    echo -e "\nAvailable snapshots:"

    # saves list of snapshots into variable
    snapshotlist=$(vboxmanage snapshot $name list)

    if [ -n "$snapshotlist" ]; then
	echo -e "$snapshotlist"
    else
	echo -e "<no snapshots found for the VM specified>"
	exit
    fi

    echo -e "\n"
    read -p "Enter name or UUID of snapshot to DELETE: " snapshot;
fi

vboxmanage snapshot "$name" delete "$snapshot"
