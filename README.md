# @kjellski Dot Files

These are my very own dotfiles. In order to speed up the setup of new bashable machines(pun intendet). 
The requirements for this are now: 

```terminal
bash, curl and python
```
Therefor, I would like to integrate profiles later, but for now, this is just maximally compatible.
The basic profile is '''compatible'''. Maybe I'll add my vundle and advanced, more customized stuff later.

## How it works

The script will do three things in general for each call.
1. Create a backup folder for things that it finds are existing and copies them over to this folder.
2. Copy the whole folder of the profile that should be used over to the active folder
3. Create a link from the users home folder for each file or directory in the active directory

## Installation
Run the following command in your terminal.
It will backup before it does anything destructive(into backup/datetime/). 

Automatic Installation:

This will download the tgz file, unpack it, move it to ${HOME}/.dotfiles and deploy the compatible profile to ${HOME}
```terminal
curl -L https://raw.github.com/kjellski/dotfiles/master/bin/install | bash
```

Manual Installation:
```terminal
git clone git://github.com/kjellski/dotfiles.git && \
cd dotfiles && \
./dotfiles --help
```

Feel free to customize all the files in the folders under profiles.

## Requirements
Really, just bash and python, which is quite more often arround then ruby.
You will get git completion and a nice promt with branch info when you've installed it but it's optional.

## Uninstall
At some point in time, I'll provide an uninstall task. :/ hopefully soon.

## Author
For bugs and hints as well as other suggestions, contact:
@kjellski on twitter
also, file pulls here:
https://github.com/kjellski/dotfiles
