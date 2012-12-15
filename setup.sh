#!/bin/bash

# store the folder we're coming from, we'll restore this eventually
SCRIPT_BASEFOLDER="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# load logging
. $SCRIPT_BASEFOLDER/lib/log.sh

# ----------------------------------------------------------------------------
# basic setup
# ----------------------------------------------------------------------------
DEPLOY_DIR=/tmp #this will be $HOME after testing
info "this scipt will deploy to this folder: ${DEPLOY_DIR}"

NOW=`date +"%F_%T"` # used to form the backup folder for this run.
BACKUP_FOLDER=$DEPLOY_DIR/backups/$NOW
info "backup folder is: ${BACKUP_FOLDER}"

# think for future profiles feature, not too coasty
DEFAULT_PROFILE=compatible
PROFILE=$DEFAULT_PROFILE
PROFILE_FOLDER=$SCRIPT_BASEFOLDER/$PROFILE
info "using profile ${PROFILE}, therefor folder: ${PROFILE_FOLDER}"

# ----------------------------------------------------------------------------
# functions to help actually do stuff
# ----------------------------------------------------------------------------
# function to backup the given file
# is backup folder existing?
function backup_file ()
{
    create_backup_folder
    if [ -e $BACKUP_FOLDER/$1 ]; then
        error "the file $1 was existing in the backup folder. won't go on, would mean we are overriding existing files. do that harm yourself please."
        log "[FAILURE]"
        exit -1
    fi
    log "cp $1 to $BACKUP_FOLDER"
}
# function to create the backup folder, if existing, does nothing.
function create_backup_folder() {
    if [ ! -d $BACKUP_FOLDER ]; then
        mkdir -p $BACKUP_FOLDER
        log "created backup folder: $BACKUP_FOLDER"
    fi
}

# deploys the file given as argument to $DEPLOY_DIR
function deploy_file () {
    backup_file $1
    # cp $1 BAS
    log "cp $1 to $DEPLOY_DIR/.$1"
}

# function to copy the given file to $BASE_DIR

# function to test for a files existence
# if existing, backup
# copy over the replacement

# ----------------------------------------------------------------------------
# deploy files for profile
# ----------------------------------------------------------------------------
for file in $PROFILE_FOLDER/* ; do
    # info "deploying file: $file ..."
    deploy_file $file
    info "$file deployed."
done

log "[SUCCESS]"
# correctly exist the program with the last commands exit code.
exit
