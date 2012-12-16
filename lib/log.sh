#!/bin/bash

# ----------------------------------------------------------------------------
# logging helper
# ----------------------------------------------------------------------------
function log() {
    echo "`date +"%F_%T"` - $@"
}

function error() {
    log "[ERROR]: $@"
}

function info() {
    if [ $VERBOSE -eq 1 ]; then
        log "[INFO] : $@"
    fi
}

function warn() {
    log "[WARN] : $@"
}
