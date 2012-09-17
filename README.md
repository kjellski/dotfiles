# Kjell Otto Dot Files

These are my very own dotfiles. In order to speed up the setup of new *nix machines. 
I'm not totally into licensing, but I completely removed all the stuff from [Ryan Bates aka the railscasts genius](https://github.com/ryanb/dotfiles). Maybe 2-10 lines are left over... anyways, I owe this guy more than a beer, checkout [railscasts.com](http://railscasts.com/) and [subscribe](http://railscasts.com/pro)!

## Requirements

My machines are somehow all apt capable till today, but feel free to replace it with the ones on your system:

```terminal
$ sudo apt-get install curl git
```

And then install rvm next, with ruby preinstalled:

```terminal
$ curl -L https://get.rvm.io | bash -s stable --ruby
```

## Installation

Run the following commands in your terminal. It will prompt you before it does anything destructive. 
Check out the Rakefile to see exactly what it does.

```terminal
git clone git://github.com/kjellski/dotfiles ~/.dotfiles
cd ~/.dotfiles
rake install
```

After installing, open a new terminal window to see the effects.

Feel free to customize all the .* files (all files that begin with a dot).


## Features
Just my 2 cents for a nice command prompt and some "good/my" defaults for bash aliases and vim setups

## Uninstall

At some point in time, I'll provide an uninstall task. :/ hopefully soon.