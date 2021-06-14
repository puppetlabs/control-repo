#!/bin/sh

# Description:
# This setup.sh find and run the install-bin that is compatible to the installing environment

# Find this script's directory
utl_dir=`dirname $0`

# set the INSTALL_BINs directory
bin_dir=$utl_dir

# get all the INSTALL_BINs
install_bin_list=`ls $bin_dir | grep INSTALL.BIN`

#get shell to be used to run "BIN" files
 __machine=`uname`
shellInterpriter="/bin/ksh"
if [ $__machine = "Linux" ] ; then
  shellInterpriter="/bin/sh"
fi


# loop on the install_bin_list and find the first one that is compatible with the environment
for install_bin in $install_bin_list
do
  ${shellInterpriter} $bin_dir/$install_bin -m
  if [ $? -eq 0 ];then
    # Current install_bin is compatible with the environment was found, run it to install the FP
    $bin_dir/$install_bin $@
    exit $?
  fi
done

echo ERROR: There is no available installation file for this platform: `uname -a`
echo Installation files were found for the following platforms:
echo ${install_bin_list}|  tr " " "\n" | cut -f 2 -d_ | cut -f 1 -d.

exit 1

