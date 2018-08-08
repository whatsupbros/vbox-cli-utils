#!/bin/bash

#
# Author: Denis Savenko
# Created: 08.08.2018
# Purpose: Takes a snapshot with the specified name for the specified virtual machine
#
# Usage: ./06_snapshot_take.sh [virtual_machine_name/UUID] [snapshot_name]
# Comments: If both parameters omitted, the names of virtual machine and snapshot are prompted
#           If second parameter omitted, the name of snapshot is prompted
#


# takes first command line parameter if exists as virtual machine name
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
# else promts the user to specify snapshot name
else
    # lists currently available snapshots for the machine
    echo -e "\nCurrent snapshots:"

    # saves list of snapshots into variable
    snapshotlist=$(vboxmanage snapshot $name list)

    if [ -n "$snapshotlist" ]; then
	echo -e "$snapshotlist"
    else
	echo -e "<no snapshots found for the VM specified>"
    fi

    echo -e "\n"
    read -p "Enter name of snapshot to TAKE: " snapshot;
fi

vboxmanage snapshot "$name" take "$snapshot"
