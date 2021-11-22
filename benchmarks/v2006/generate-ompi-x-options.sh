#!/bin/sh

env | awk '\
BEGIN {FS="="; printf "-x PATH -x MANPATH"} \
/^(FOAM|LD|MPI|OPAL|PV|ParaView|TS|WM)_(\w|\d)+/ {printf " -x " $1} \
END {print ""}'
