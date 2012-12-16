# @kjellski Dot Files

These are my very own dotfiles. In order to speed up the setup of new Bash_able machines. 
The requirements for this are now: 

```terminal
bash
```
Therefor, I would like to integrate profiles later, but for now, this is just maximally compatible.
The basic profile is compatible. Maybe I'll add my vundle and advanced, more customized stuff later.

## Installation
Run the following command in your terminal.
It will backup before it does anything destructive(into backup/datetime/). 

```terminal
git clone git://github.com/kjellski/dotfiles.git && \
cd dotfiles && \
./dotfiles --help
```
Feel free to customize all the files in the folders under profiles.

## Requirements
Really, just bash, no rvm, no ruby, no python no nothing, except bash.

You will get git completion and a nice promt with branch info when you've installed it but it's optional.

## Uninstall

At some point in time, I'll provide an uninstall task. :/ hopefully soon.
