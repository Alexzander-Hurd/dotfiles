### Documentation

- [View screenshots](#screenshots) of the current set up and how to switch themes
- [Quickly get set up with these dotfiles](#quickly-get-set-up-with-these-dotfiles)
  - [Extra WSL 1 and WSL 2 steps](#extra-wsl-1-and-wsl-2-steps)
- [FAQ](#faq)
  - [How to personalize these dotfiles?](#how-to-personalize-these-dotfiles)
  - [How to add custom themes to the set-theme script?](#how-to-add-custom-themes-to-the-set-theme-script)
  - [How to use a different terminal in the set-theme script?](#how-to-use-a-different-terminal-in-the-set-theme-script)
  - [How to fix Vim taking a long time to open when inside of WSL?](#how-to-fix-vim-taking-a-long-time-to-open-when-inside-of-wsl)
- [About the author](#about-the-author)

### Themes

These dotfiles include a `set-theme` script that you can run from your terminal
to set your theme to any of the themes listed below. This script takes care of
configuring your terminal, tmux, Vim and fzf's colors in 1 command.

If you don't like the included themes that's no problem. You can use whatever
you want, there's no limitations. You could choose to manually change the
colors or [adjust the set-theme
script](#how-to-add-custom-themes-to-the-set-theme-script) to add a custom
theme.

Ater installing these dotfiles you can run this from your terminal:

```sh
# Switch to a supported theme.
# Theme names are listed below near the screenshots.
# You can also run set-theme --help to see a list of themes.
set-theme [theme_name]

# Switch between dark and light backgrounds for the active theme.
set-theme --toggle-bg

# Switch the theme and toggle the background in 1 command.
set-theme [theme_name] --toggle-bg
```

*If you get an error about your terminal config file not being found please
review [this FAQ
item](#how-to-use-a-different-terminal-in-the-set-theme-script).*

#### Gruvbox Community

`set-theme gruvbox`

![Dotfiles](https://nickjanetakis.com/assets/blog/dotfiles-c85f20a61decb0d4676530ff4c65a818ee9b362cf9f380a76c9d44e1254d03f3.jpg)

#### One

`set-theme one`

![Dotfiles](https://nickjanetakis.com/assets/blog/dotfiles-2020-04-14-e375233b9aaf52ab5d8411ba28963f098094c91860e069a7f1ee45916a051929.jpg)

## Quickly Get Set Up with These Dotfiles

There's an `./install` script you can run to automate installing everything.
That includes installing system packages such as tmux, Vim, zsh, etc. and
configuring a number of tools in your home directory.

It even handles cloning down this repo. You'll get a chance to pick the clone
location in the script as well as view and / or change any system packages that
get installed.

The install script is optimized for:

- Ubuntu 20.04 LTS+ (native or WSL)
- Debian 11+ (Debian 10 will work if you enable backports for tmux)
- macOS 10.15+

It will still work with other distros of Linux if you skip installing system
packages (more details are below).

**You can download and run the install script with this 1 liner:**

```sh
bash <(curl -sS https://raw.githubusercontent.com/Alexzander-Hurd/dotfiles/master/install)
```

*If you're not comfortable blindly running a script on the internet, that's no
problem. You can view the [install
script](https://github.com/Alexzander-Hurd/dotfiles/blob/master/install) to see exactly
what it does. Each section is commented. Sudo is only used to install system
packages. Alternatively you can look around this repo and reference the config
files directly without using any script.*

You can also run the script without installing system packages:

```sh
bash <(curl -sS https://raw.githubusercontent.com/Alexzander-Hurd/dotfiles/master/install) --skip-system-packages
```

That above could be useful if you're using a non-Debian based distro of Linux,
in which case you'll need to install the [dependent system
packages](https://github.com/Alexzander-Hurd/dotfiles/blob/master/install) on your own
beforehand. Besides that, everything else is supported since it's only dealing
with files in your home directory.

My set up targets zsh 5.0+ and tmux 3.0+. As long as you can meet
those requirements you're good to go.

### Did you install everything successfully?

Nice!

If you haven't done so already please close your terminal and open a new
one, then follow the step(s) below:

#### 1. Configure your git name and email

One of the things the install script did was copy a git ignored git config file
into your home directory. You're meant to put in your name and email address so
that your details are used when you make git commits.

```sh
vim ~/.gitconfig.user
```

#### 2. (Optional) confirm that a few things work

```sh
# Check to make sure git is configured with your name and email.
git config --list

# Sanity check to see if you can run some of the tools we installed.
vim --version
tmux -V
node --version
```

Before you start customizing certain config files, take a look at the
[personalization question in the FAQ](#how-to-personalize-these-dotfiles).

### Extra WSL 1 and WSL 2 steps

You should reboot to activate your `/etc/wsl.conf` file (the install
script created this). That will be necessary if you want to access your mounted
drives at `/c` or `/d` instead of `/mnt/c` or `/mnt/d`.

## FAQ

### How to personalize these dotfiles?

Chances are you'll want to personalize some of these files, such as various Vim
settings. Since this is a git repo you can always do a `git pull` to get the
most up to date copy of these dotfiles, but then you may find yourself
clobbering over your own personal changes.

Since we're using git here, we have a few reasonable options.

For example, from within this dotfiles git repo you can run `git checkout -b
personalized` and now you are free to make whatever changes that you want on
your custom branch.  When it comes time to pull down future updates you can run
a `git pull origin master` and then `git rebase master` to integrate any
updates into your branch.

Another option is to fork this repo and use that, then periodically pull and
merge updates. It's really up to you.

### How to add custom themes to the set-theme script?

Prefer a video? [Here's a video](https://www.youtube.com/watch?v=h509rn2xIyU&t=191s)
that demonstrates performing the steps below.

After installing these dotfiles you'll have a `~/.local/bin/set-theme` script.
It's a [zero dependency Python 3
script](https://github.com/Alexzander-Hurd/dotfiles/blob/master/.local/bin/set-theme).

1. Open the above file
2. Check out the `THEMES` dictionary near the top of the file
3. Copy one of the existing themes' dictionary items, such as `gruvbox` or `one`
4. Rename the dictionary's key to whatever your new theme's colorscheme name is in Vim
5. Adjust all of the colors and additional values in your new dictionary item as you see fit
6. Run `set-theme cooltheme`, replacing `cooltheme` with whatever name you used in step 4

Your terminal and tmux colors will update automatically, but if you have Vim
already open you'll need to manually run this command from within Vim to reload
your config `:so $MYVIMRC`.

If you added a theme with good contrast ratios please open a pull request to
get it added to the script.

### How to use a different terminal in the set-theme script?

I'm using the Microsoft Terminal but if you're using something else then your
terminal's colors won't get updated by this script because the script looks for
strings that are in MS terminal's config, but it's not painful to change.

*By the way, if you're using the Microsoft Terminal Preview edition you'll
still need to do step 1 below because the path of your MS terminal config file
will be different than the non-preview edition.*

You'll want to adjust the `set-theme` script by doing this:

1. Change the `TERMINAL_CONFIG` variable to reference your terminal config's path
2. Change the `terminal` attributes in the `THEMES` dictionary to use your terminal's config option names
3. Change the regex in the `change_terminal_theme` function based on your terminal's config option formatting rules
4. Optionally install Gruvbox, One or any other themes (the MS Terminal config in this repo includes them)
