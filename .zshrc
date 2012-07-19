# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="blinks"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vim='/Users/.demar136.xahome/Applications/vim' 
alias tmux='tmux -f /Users/.demar136.xahome/.tmux'
alias ll='gls -a --color=auto --group-directories-first'
alias l='gls -la --color=auto --group-directories-first'

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin
export VIMINIT='let $MYVIMRC="/Users/Shared/Benjamin/.vimrc" | source $MYVIMRC'
export VIMRUNTIME=/Users/.demar136.xahome/Applications/MacVim.app/Contents/Resources/vim/runtime
export PATH=$PATH:/Users/Shared/Benjamin/homebrew/bin
export PATH=$PATH:/Users/Shared/Benjamin/Applications/homebrew/sbin
export PATH=$PATH:/Users/.demar136.xahome/Applications
export WORKON_HOME=$HOME/.venvs
export PROJECT_HOME=$HOME/Projects
export VIRTUALENVWRAPPER_VIRTUALENV="/Users/.demar136.xahome/Library/Python/2.7/bin/virtualenv"
source /Users/.demar136.xahome/Library/Python/2.7/bin/virtualenvwrapper.sh 
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#I_#P") "$PWD")'
share="/Users/Shared/Benjamin"
eval `gdircolors ~/.dircolors`
