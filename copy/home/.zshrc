# Path to your oh-my-zsh installation.
export ZSH=/Users/jallardice/.oh-my-zsh

# Check for updates every day instead of every 2 weeks.
export UPDATE_ZSH_DAYS=1

# Default Node version.
export NODE_VERSION=14

# Touchbar plugins.
export TOUCHBAR_GIT_ENABLED=true

# Set name of the theme to load.
ZSH_THEME="jallardice"

# _ and - will be interchangeable to autocomplete.
HYPHEN_INSENSITIVE="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Show timestamp in `history` output.
HIST_STAMPS="mm/dd/yyyy"

# Load Oh My Zsh plugins. Be wary of adding too many as it will slow down shell
# startup.
plugins=(git node npm brew osx redis-cli sudo emoji colorize)

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/opt/ansible/hacking/env-setup > /dev/null 2>&1

# Custom aliases.
alias lss="ls -Alsh --color"

# Separate history for each session
unsetopt share_history

# Add Homebrew utils to path so they can be used with their real names instead
# of having to include prefixes.
PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
MANPATH="/usr/local/man:$MANPATH"
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/findutils/libexec/gnuman:$MANPATH"
PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/gnu-tar/libexec/gnuman:$MANPATH"

# Add custom binaries to path.
PATH="/Users/jallardice/bin:$PATH"

# Source nvm.
export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"
nvm use $NODE_VERSION

# Initialise rbenv.
eval "$(rbenv init -)"
