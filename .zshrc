# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="alanpeabody"
#ZSH_THEME="terminalparty"
ZSH_THEME="gallifrey"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="gallois"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
plugins=(git ruby osx bundler brew rails)

source $ZSH/oh-my-zsh.sh

# User configuration

eval "$(rbenv init -)"

#export PATH="/Users/enomoto/.rvm/gems/ruby-2.0.0-p451@railstutorial_rails_4_0/bin:/Users/enomoto/.rvm/gems/ruby-2.0.0-p451@global/bin:/Users/enomoto/.rvm/rubies/ruby-2.0.0-p451/bin:/usr/local/heroku/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/enomoto/.rvm/bin"
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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export EDITOR=/Applications/MacVim.app/Contents/MacOS/mvim
alias mvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/mvim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# ocamlインタプリタの設定
RLWRAP_COMMAND=`which rlwrap`
alias ocaml="$RLWRAP_COMMAND ocaml"

alias LS='ls -alt'

# Git
alias gd='git d'
alias gg='git g'
alias gs='git s'
alias ctags=/usr/local/bin/ctags


# コマンド履歴から実行する ctrl + X, ctrl + R
function peco-execute-history() {
  local item
  item=$(builtin history -n -r 1 | peco --query="$LBUFFER")

  if [[ -z "$item" ]]; then
    return 1
  fi

  BUFFER="$item"
  CURSOR=$#BUFFER
  zle accept-line
}
zle -N peco-execute-history
bindkey '^x^r' peco-execute-history

# cdrの設定
autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs

function peco-cdr() {
  local item
  item=$(cdr -l | sed 's/^[^ ]\{1,\} \{1,\}//' | peco)

  if [[ -z "$item" ]]; then
    return 1
  fi

  BUFFER="cd -- $item"
  CURSOR=$#BUFFER
  zle accept-line
}
zle -N peco-cdr
bindkey '^xb' peco-cdr
