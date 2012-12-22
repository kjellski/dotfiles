#!/usr/bin/env python

import os.path, datetime, logging

# this class represents a file of an profile
# its able to create a backup of the original file
# it will create a link to itself 
class DotFile: 

    # where this file lies arround
    working_path = os.path.join('tmp', 'test')
    # where this file should be deployed
    target_path = os.path.join('tmp', 'target')
    # if existing, where should the target file be copied to
    backup_path = os.path.join('tmp', 
        'backups',
         datetime.datetime.now().strftime("%Y-%m-%d_%H:%M:%S"))

    def __init__(self, filename):
        self.filename = filename

        print self

    # creates a link from the home folder to this file
    def link():
        # check for existence, backup
        logging.info('link')

    # creates a backup for the file 
    def backup():
        # does it exist? 
        logging.info('backup')
        #copy over to backup folder

    def __str__(self):
        return 'DotFile(working_path=' + DotFile.working_path + ', ' + \
            'target_path=' + DotFile.target_path + ', ' + \
            'backup_path=' + DotFile.backup_path + ', ' + \
            'self.filename=' + self.filename + ')'