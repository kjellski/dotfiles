#!/bin/bash

# ----------------------------------------------------------------------------
# arguments parsing
# ----------------------------------------------------------------------------

# gets the second part of an option to the first part, e.g. -t or -p
function validate_profile() {
    # if the path does not exist.
    if [ ! -d $PROFILES_FOLDER/$1 ]; then
        usage_error_exit "the path \"$PROFILES_FOLDER/$1\" for argument \"-p|--profile\" does not exist"
    fi
    # return the valid profile
    $1
}

# sets the target folder to deploy to
function validate_target() {
    # if the path does not exist.
    if [ ! -d $1 ]; then
        usage_error_exit "the path \"$1\" for argument \"-t|--target\" does not exist"
    fi
    # return the valid profile
    $1
}

# prints the usage to standard out
function usage() {
    cat << EOF
usage: dotfiles [-h|--help] [-v|--verbose] [(-p|--profile) <profile>] [-t|--target <path>]

This programm is used to create or copy terminal and editor dotfiles from the choosen profiles folder to the \${HOME} folder.
The default profile is compatible. This is normally giving a [~]$ like promt, a bit of bash colors and default vim settings to behave sane.

Arguments:
    -t | --target <path>    deploys to the target path, e.g.: -t /tmp 
    -p | --profile          usese the given profile
    -v | --verbose          shows verbose output
    -h | --help             displays this text

author: @kjellski
EOF
}

function usage_error_exit() {
    usage
    error $1
    exit 1
}
