#!/bin/bash

BASE_DIR=/tmp

NOW=`date +"%F_%T"`
echo "NOW: ${NOW}"
BACKUP_FOLDER=$BASE_DIR/backups/$NOW

# change to the directory this file is laying around
pushd pwd

echo `pwd`

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

popd
echo `pwd`
