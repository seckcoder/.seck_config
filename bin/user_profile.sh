#!/bin/bash

UNKNOWNOS=1
readonly USER=`who am i | awk '{print $1}'`
function user_home_robust
{
    . ~/bin/os_profile.sh
    case "${OS}" in
        mac)
            HOMEDIR=/Users/$USER
            ;;
        redhat|suse|madrake|debian)
            HOMEDIR=/home/$USER
            ;;
        *)
            echo "unknown"
            exit $UNKNOWNOS
            ;;
    esac
}
function user_home_simple
{
    HOMEDIR=$(eval echo ~${SUDO_USER})
}


function get_user_home
{
    user_home_simple
    readonly HOMEDIR
}
get_user_home
