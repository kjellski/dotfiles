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
# function to create the backup folder, if existing, does nothing.
function create_backup_folder() {
    if [ ! -d $BACKUP_FOLDER ]; then
        mkdir -p $BACKUP_FOLDER
        log "created backup folder: $BACKUP_FOLDER"
    fi
}

# function to backup the given file
function backup_file ()
{
    # create the backup folder
    create_backup_folder
    
    # is the file existing? if so, exist, don't do harmful shit here...
    if [ -e $BACKUP_FOLDER/$1 ]; then
        error "the file $1 was existing in the backup folder. won't go on, would mean we are overriding existing files. do that harm yourself please."
        log "[FAILURE]"
        exit -1
    fi
    cp -i $1 $BACKUP_FOLDER
}

# deploys the file given as argument to $DEPLOY_DIR
function deploy_file () {
    # if the file exists, back it up, no matter what
    backup_file $DEPLOY_DIR/.$1
    # copy the file from profiles folder over to deploy folder
    cp -i $PROFILE_FOLDER/$1 $DEPLOY_DIR/.$1
}

# ----------------------------------------------------------------------------
# deploy files for profile
# ----------------------------------------------------------------------------
for file in $PROFILE_FOLDER/* ; do
    # info "deploying file: $file ..."
    deploy_file ${file##*/}
    info "$file deployed."
done

log "[SUCCESS]"
# correctly exist the program with the last commands exit code.
exit
