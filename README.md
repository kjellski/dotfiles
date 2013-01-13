# .dotfiles

This profile management environment was created in order to speed up the setup of new bashable machines(pun intendet). 
It somehow evolved from that to a more general solution that anybody could use to switch and maintain different 
environments for their own. Just add a folder with appropriate config files under the profiles folder and stuff 
things in there.

The requirements for this are now: 

```terminal
bash, curl and python
```

I would like to integrate profiles later, but for now, this is just maximally compatible.
The basic profile is '''compatible'''. Maybe I'll add my vundle and advanced, more customized stuff later.

Also, if you want to include git submodules, use them but the installation is still a TODO with git. 

## How To

In order to just install the '''compatible''' profile, you can use the following command as a copy and past to your bash:

```terminal
curl -L https://raw.github.com/kjellski/dotfiles/master/bin/install | bash
```


## How it works

The script will do three things in general for each call.
1. Create a backup folder for things that it finds are existing and copies them over to this folder.
    * look for each existing file or folder under the profiles folder, is there something that would be 
      replaced by this profiles version of the file? If so, copy it over the the actual backup.
    * TODO: If there is a link instead of a file, remove the link and create a new one to the target in the backup 
      folder.
2. Copy the whole folder of the profile that should be used over to the active folder
    * This will literaly just copy over the whole content of the choosen folder to a working copy.
3. Create a link from the users home folder for each file or directory in the active working copy directory.

## Installation
Run the following command in your terminal.
It will backup before it does anything destructive(into backup/datetime/). 

### Automatic Installation:

This will download the tgz file, unpack it, move it to ${HOME}/.dotfiles and deploy the compatible profile to ${HOME}
```terminal
curl -L https://raw.github.com/kjellski/dotfiles/master/bin/install | bash
```

### Advanced Installation:
This is the more customizable way to use dotfiles. It will actually check out my very own repo and git all my 
profiles added as submodules.
```terminal
git clone git://github.com/kjellski/dotfiles.git && \
        cd dotfiles && \
        git submodule update --init --recursive
        ./dotfiles --help
```

Feel free to customize all the files in the folders under profiles.

## Requirements
Really, just '''bash''' and '''python''', which is quite more often arround then ruby. Also '''git''' if you would like to
maintain your own profiles with git submodules.

You will get git completion and a nice promt with branch info when you've installed it but it's optional.

## Uninstall
At some point in time, I'll provide an uninstall task. :/ hopefully soon.

## Author
For bugs and hints as well as other suggestions, contact:
@kjellski on twitter
also, file pulls here:
https://github.com/kjellski/dotfiles
