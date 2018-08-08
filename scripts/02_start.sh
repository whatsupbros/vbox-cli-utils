#!/bin/bash

#
# Author: Denis Savenko
# Created: 08.08.2018
# Purpose: Starts specified virtual machine headless
#
# Usage: ./02_start.sh [name/UUID]
# Comments: If parameter is not provided, the name of virtual machine is prompted
#


# takes command line parameter if exists
if [ -n "$1" ];
then
    name=$1;
# else prints list of virtual machines and promts the user for the virtual machine name to start
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
    read -p "Enter name or UUID of virtual machine to START: " name;
fi

vboxmanage startvm --type headless "$name"
