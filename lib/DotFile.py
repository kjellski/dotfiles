#!/usr/bin/env python
import os.path, datetime, logging, shutil, sys, pdb

# this class represents a file of an profile
# its able to create a backup of the original file
# it will create a link to itself 
class DotFile: 

    # choosable prefix, maybe _ for windown?
    fileprefix = '.'
    # where this file lies arround
    profile_path = os.path.join('tmp', 'test')
    # where this file should be deployed
    target_path = os.path.join('tmp', 'target')
    # if existing, where should the target file be copied to
    backup_path = os.path.join('tmp', 
        'backups',
         datetime.datetime.now().strftime("%Y-%m-%d_%H:%M:%S"))

    # if file is not starting with ., add that
    def __init__(self, original_filename):
        if original_filename.startswith(DotFile.fileprefix):
            self.filename = original_filename
        else:
            self.filename = '.' + original_filename

        self.target_file_path = os.path.join(DotFile.target_path, self.filename)
        self.backup_file_path = os.path.join(DotFile.backup_path, self.filename)
        self.profiles_file_path = os.path.join(DotFile.profile_path, original_filename)

        logging.debug(self)

    # creates a link from the home folder to this file
    def link(self):
        # check for existence, backup
        self.backup()
        #link
        logging.info('linking from ' + self.profiles_file_path + \
            ' to ' + \
            self.target_file_path)
        # create the symlink for deployment
        os.symlink(self.profiles_file_path, self.target_file_path)

    # creates a backup for the file 
    def backup(self):
        # does it exist? 
        if os.path.exists(self.target_file_path):
            try:
                logging.info('backing up ' + self.target_file_path)
                if os.path.isdir(self.target_file_path):
                    # copy whole tree over to backup folder
                    shutil.copytree(self.target_file_path, self.backup_file_path)
                    logging.info('now deleting the backed up directory: ' + self.target_file_path)
                    # if the folder is a link, remove it like a file... 
                    if os.path.islink(self.target_file_path):
                        os.unlink(self.target_file_path)
                    else:
                        shutil.rmtree(self.target_file_path)

                else:
                    # copy the file 
                    shutil.copyfile(self.target_file_path, self.backup_file_path)
                    logging.info('now deleting the backed up file: ' + self.target_file_path)
                    os.remove(self.target_file_path)

            except Exception, e:
                logging.error(e)
                logging.error('while backing up, something failed, EXITING for data safety.')
                sys.exit(-1)

    def __str__(self):
        return 'DotFile(' + \
                '\n\tself.profiles_file_path=' + self.profiles_file_path + ', ' + \
                '\n\tself.target_file_path=' + self.target_file_path + ', ' + \
                '\n\tself.backup_file_path=' + self.backup_file_path + ', ' + \
                '\n\tself.filename=' + self.filename + \
            ')'