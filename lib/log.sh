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
    log "[INFO] : $@"
}

function warn() {
    log "[WARN] : $@"
}
