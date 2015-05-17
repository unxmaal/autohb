#!/bin/bash

_dir=$1
_name=$2

_outdir="/Users/eric/Desktop"

autohb(){
    if [[ -z "$_name" ]] ; then
        _name=$(basename "$_dir")
    fi

    /Applications/HandBrakeCLI -i "$_dir" -o "$_outdir/$_name".m4v --preset="Normal"
    _retval=$?

    return "$_retval"
}


dvdeject(){
   diskutil eject "$_dir"
}

main(){
   if [[ -z "${_dir}" ]] ; then
       echo "Usage: ./autohb.sh <path to dvd> (<alternative name>)"
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
