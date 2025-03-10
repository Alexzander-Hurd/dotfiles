# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.config/omzsh"
export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python3.10/dist-packages
export PATH=$PATH:/opt/flutter/bin

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="gnzh"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	z
	python
	zsh-autosuggestions
	zsh-syntax-highlighting
	sudo
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
function mkcd() {
	mkdir "$1"
	cd "$1"
}
function ntfypub() {
        declare data=${2:-$(</dev/stdin)}
        curl \
                -H "Title:$1" \
                -d "$data" \
                ntfy.mechjelly.duckdns.org/mechAlerts
}
function ntfyUptime() {
	while ! ping -c1 $1 &>/dev/null;
	  	do sleep 1;
	done;
	ntfypub "Server Up" "The server $1 is responsive"
}
function ntfyDowntime() {
        while ping -c1 $1 &>/dev/null;
                do sleep 1;
        done;
        ntfypub "Server Down" "The server $1 is unresponsive"
}

function testFont() {
	echo -e '\e[1mbold\e[22m'
	echo -e '\e[2mdim\e[22m'
	echo -e '\e[3mitalic\e[23m'
	echo -e '\e[4munderline\e[24m'
	echo -e '\e[4:1mthis is also underline (new in 0.52)\e[4:0m'
	echo -e '\e[21mdouble underline (new in 0.52)\e[24m'
	echo -e '\e[4:2mthis is also double underline (new in 0.52)\e[4:0m'
	echo -e '\e[4:3mcurly underline (new in 0.52)\e[4:0m'
	echo -e '\e[5mblink (new in 0.52)\e[25m'
	echo -e '\e[7mreverse\e[27m'
	echo -e '\e[8minvisible\e[28m <- invisible (but copy-pasteable)'
	echo -e '\e[9mstrikethrough\e[29m'
	echo -e '\e[53moverline (new in 0.52)\e[55m'

	echo -e '\e[31mred\e[39m'
	echo -e '\e[91mbright red\e[39m'
	echo -e '\e[38:5:42m256-color, de jure standard (ITU-T T.416)\e[39m'
	echo -e '\e[38;5;42m256-color, de facto standard (commonly used)\e[39m'
	echo -e '\e[38:2::240:143:104mtruecolor, de jure standard (ITU-T T.416) (new in 0.52)\e[39m'
	echo -e '\e[38:2:240:143:104mtruecolor, rarely used incorrect format (might be removed at some point)\e[39m'
	echo -e '\e[38;2;240;143;104mtruecolor, de facto standard (commonly used)\e[39m'

	echo -e '\e[46mcyan background\e[49m'
	echo -e '\e[106mbright cyan background\e[49m'
	echo -e '\e[48:5:42m256-color background, de jure standard (ITU-T T.416)\e[49m'
	echo -e '\e[48;5;42m256-color background, de facto standard (commonly used)\e[49m'
	echo -e '\e[48:2::240:143:104mtruecolor background, de jure standard (ITU-T T.416) (new in 0.52)\e[49m'
	echo -e '\e[48:2:240:143:104mtruecolor background, rarely used incorrect format (might be removed at some point)\e[49m'
	echo -e '\e[48;2;240;143;104mtruecolor background, de facto standard (commonly used)\e[49m'

	echo -e '\e[21m\e[58:5:42m256-color underline (new in 0.52)\e[59m\e[24m'
	echo -e '\e[21m\e[58;5;42m256-color underline (new in 0.52)\e[59m\e[24m'
	echo -e '\e[4:3m\e[58:2::240:143:104mtruecolor underline (new in 0.52) (*)\e[59m\e[4:0m'
	echo -e '\e[4:3m\e[58:2:240:143:104mtruecolor underline (new in 0.52) (might be removed at some point) (*)\e[59m\e[4:0m'
	echo -e '\e[4:3m\e[58;2;240;143;104mtruecolor underline (new in 0.52) (*)\e[59m\e[4:0m'
}
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
