# ============= oh-my-zsh ===============

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh


# ============= zplug ===================
# 
# zplug is a zsh package manager 
# See https://github.com/zplug/zplug
# 
# Install zplug for the first time:
# 
# -- 1. export ZPLUG_HOME=/path/to/.zplug
# -- 2. git clone https://github.com/zplug/zplug $ZPLUG_HOME
#

# Path to  zplug installation.
export ZPLUG_HOME=~/.zplug

# source zplug
source $ZPLUG_HOME/init.zsh


# ============= z ======================
# 
# z is a fast jumping tool for zsh

# include Z, yo
source ~/.zshsup/z.sh


# zsh-interactive-cd is a plugin for to use fzf with cd in zsh
# source zsh-interactive-cd
. ~/.zshsup/zsh-interactive-cd.zsh


# =========== Prepend PATH ==============
#
#
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:

declare -a dirs_to_prepend
dirs_to_prepend=(
    "$HOME/Library/Android/sdk/platform-tools/"    # adb path
    "$HOME/Library/Android/sdk/tools/"
    "$HOME/.zplug/bin"
)

for dir in ${(k)dirs_to_prepend[@]}
do
    if [ -d ${dir} ]; then
        # If direrctory exits, then prepend it to existing PATH
        PATH="${dir}:$PATH"
    fi
done

unset dirs_to_prepend




# ============= Look and feel ===============
#
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

# ZSH_THEME="refined" # the "pure" theme
# ZSH_THEME="spaceship"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git npm zsh-syntax-highlighting git-flow)


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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# tmux color
export TERM=screen-256color


# ============ Shell dotfiles =================
for file in $HOME/.shell/{shell_exports,shell_alias,shell_functions,shell_config,shell_spaceship}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
    # echo "[OK]... source $file"
done
unset file;

for file in "$HOME/.functions"/*; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
    # echo "[OK]... source $file"
done
unset file;


# Source local extra (private) settings if exists
[ -f ~/.zsh.local ] && source ~/.zsh.local





# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tomaz/Dev/Py/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/tomaz/Dev/Py/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tomaz/Dev/Py/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/tomaz/Dev/Py/google-cloud-sdk/completion.zsh.inc'; fi

eval $(thefuck --alias)
