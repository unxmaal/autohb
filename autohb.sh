#!/bin/bash

_dir=$1
_name=$(basename "$_dir")
_outdir="/Users/eric/Desktop"

autohb(){
    /Applications/HandBrakeCLI -i "$_dir" -o "$_outdir/$_name".m4v --preset="Normal"
    _retval=$?

    return "$_retval"
}


dvdeject(){
   diskutil eject "$_dir"
}

main(){
   if [[ -z "${_dir}" ]] ; then
       echo "Usage: ./autohb.sh <path to dvd>"
   else
       autohb
          if [[ $? -ne 0 ]] ; then
             echo "Ripping Failed!"
             exit 1
          else
             echo "Ripping complete!"
             dvdeject
          fi
   fi 
}


main

exit 0
