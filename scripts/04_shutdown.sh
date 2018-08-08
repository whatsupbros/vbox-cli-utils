#!/bin/bash

#
# Author: Denis Savenko
# Created: 08.08.2018
# Purpose: Sends signal to the specified virtual machine like the power button was pressed
#
# Usage: ./04_shutdown.sh [name/UUID]
# Comments: If parameter is not provided, the name of virtual machine is prompted
#


# takes command line parameter if exists
if [ -n "$1" ]; then
    name=$1;
# else prints currently running virtual machines
# and promts the user to specify virtual machine name to shutdown
else
    echo -e "\nRunning virtual machines:"

    # saves list of running VMs into variable
    vmslist=$(vboxmanage list runningvms)

    if [ -n "$vmslist" ]; then
	echo -e "$vmslist"
    else
	echo -e "<no running VMs>"
	exit
    fi

    echo -e "\n"
    read -p "Enter name or UUID of virtual machine to SHUTDOWN: " name;
fi

vboxmanage controlvm "$name" acpipowerbutton
echo "Signal sent"
