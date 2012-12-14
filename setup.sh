#!/bin/bash

# store the folder we're coming from, we'll restore this eventually
SCRIPT_BASEFOLDER="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# load logging
. $SCRIPT_BASEFOLDER/lib/log.sh

BASE_DIR=/tmp #this will be $HOME after testing

NOW=`date +"%F_%T"` # used to form the backup folder for this run.
BACKUP_FOLDER=$BASE_DIR/backups/$NOW

# change to the directory this file is laying around

log "BACKUP_FOLDER: ${BACKUP_FOLDER}"

# function to backup the given file
# is backup folder existing?
function backup_file {
    create_backup_folder
}
# function to create the backup folder
function create_backup_folder() {
    if [ ! -d $BACKUP_FOLDER ]; then
#        mkdir -p $BACKUP_FOLDER
        log "created backup folder: $BACKUP_FOLDER$bBACKUP_FOLDER"
    fi
}

# function to copy the given file to $BASE_DIR

# function to test for a files existence
# if existing, backup
# copy over the replacement


# correctly exist the program with the last commands exit code.
exit
