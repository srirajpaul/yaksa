#! /bin/sh
##
## Copyright (C) by Argonne National Laboratory
##     See COPYRIGHT in top-level directory
##

########################################################################
## Utility functions
########################################################################

echo_n() {
    # "echo -n" isn't portable, must portably implement with printf
    printf "%s" "$*"
}

error() {
    echo "===> ERROR:   $@"
    exit
}


########################################################################
## Parse user arguments
########################################################################

genpup_args=
for arg in "$@" ; do
    case $arg in
        -pup-max-nesting=*|--pup-max-nesting=*)
            genpup_args="$genpup_args $arg"
            ;;

        *)
            error "unknown argument $arg"
            ;;
    esac
done


########################################################################
## Generating required files
########################################################################

# backend pup functions
for x in seq cuda ; do
    echo_n "generating backend pup functions for ${x}... "
    ./src/backend/${x}/genpup.py ${genpup_args}
    echo "done"
done

# tests
./maint/gentests.py


########################################################################
## Autotools
########################################################################

# generate configure files
echo
echo "=== generating configure files in main directory ==="
autoreconf -vif
echo "=== done === "
echo


########################################################################
## Building maint/Version
########################################################################

# build a substitute maint/Version script now that we store the single copy of
# this information in an m4 file for autoconf's benefit
echo_n "Generating a helper maint/Version... "
if autom4te -l M4sugar maint/Version.base.m4 > maint/Version ; then
    echo "done"
else
    echo "error"
    error "unable to correctly generate maint/Version shell helper"
fi
