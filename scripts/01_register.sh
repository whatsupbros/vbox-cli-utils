#!/bin/bash

#
# Author: Denis Savenko
# Created: 08.08.2018
# Purpose: Registers specified virtual machine
#
# Usage: ./01_register.sh [path_to_vbox_filename]
# Comments: If parameter is not provided, the filename is prompted
#


if [ -n "$1" ];
then
    filename=$1;
else
    read -p "Enter path to virtual machine VBOX file to REGISTER: " filename;
fi

vboxmanage registervm "$filename"
echo "Done"