# Path to your oh-my-zsh installation.
export ZSH=/Users/jallardice/.oh-my-zsh

# Check for updates every day instead of every 2 weeks.
export UPDATE_ZSH_DAYS=1

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
plugins=(git node npm brew osx redis-cli sudo emoji)

# Source nvm. This needs to happen before sourcing Oh My Zsh because the custom
# Oh My Zsh theme relies on Node.
export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Custom aliases.
alias lss="ls -Alsh --color"

# Separate history for each session
unsetopt share_history

# Add Homebrew utils to path so they can be used with their real names instead
# of having to include prefixes.
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export MANPATH="/usr/local/man:$MANPATH"
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/findutils/libexec/gnuman:$MANPATH"

# Add custom binaries to path.
PATH="/Users/jallardice/bin:$PATH"

# Initialise rbenv.
eval "$(rbenv init -)"
