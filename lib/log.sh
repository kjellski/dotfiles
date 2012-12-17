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
    log "[INFO]: $@"
}

function verbose() {
    if [ $VERBOSE -eq 1 ]; then
        log "[VERBOSE] : $@"
    fi
}

function warn() {
    log "[WARN] : $@"
}
