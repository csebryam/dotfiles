# If you come from bash you might have to change your $PATH.
  export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# ZSH=$HOME/.oh-my-zsh
  export ZSH="$HOME/.oh-my-zsh"

# Postgresql
# export POSTGRES="/usr/local/pgsql/bin"
# export PATH="/usr/local/opt/icu4c/bin:$PATH"
# export PATH="/usr/local/opt/icu4c/sbin:$PATH"
# export LDFLAGS="-L/usr/local/opt/icu4c/lib"
# export CPPFLAGS="-I/usr/local/opt/icu4c/include"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="afowler"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  ruby
  rails
  asdf
  ag
  gh
)

source $ZSH/oh-my-zsh.sh

# User configuration

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# AWS CONFIG
awsservercli () {
  aws ec2 describe-instances \
    --filters Name=instance-state-name,Values=running Name=tag-value,Values="*?" \
    --query "Reservations[*].Instances[*].{PrivateIP:PrivateIpAddress, Server:Tags[?Key=='Name']|[0].Value}" \
    --output table
}

# Dotfiles
# https://www.atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# NEOVIM
alias vim='nvim'

# Elixir
alias repry='fc -s mix\ test=iex\ -S\ mix\ test\ --trace mix\ test'

# Elixir - IEX: Enable History
export ERL_AFLAGS="-kernel shell_history enabled"

# Rails
alias rs='rails server'
alias rc='rails console'
alias rdbm='rails db:migrate'
alias rdbr='rails db:rollback'
alias rdbre='rails db:migrate:redo'

# -------------------------------------------------------------------
# THREEFLOW Configs
# -------------------------------------------------------------------
# GitHub Personal Access Token for GitHub packages
export NPM_TOKEN=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
export FONTAWESOME_NPM_AUTH_TOKEN=2412F0D5-A919-4DEE-8681-BA0839AC1D86


alias quick_db_dump="rm -R /tmp/quick_db_dump && time pg_dump -v -j 10 -Fd -f /tmp/quick_db_dump watchtower_development"

alias quick_db_restore="time pg_restore -v -j 10 --disable-triggers --format=d -C --dbname=watchtower_development /tmp/quick_db_dump"

#
# -------------------------------------------------------------------
# BINDINGS
# -------------------------------------------------------------------

# Adds a Preview window to:
# $ fzf
# $ ctrl-r
# $ ctrl-t
export FZF_DEFAULT_OPTS='--preview "[[ $(file --mime {}) =~ binary ]] &&
  echo {} is a binary file ||
  (bat --style=numbers --color=always {} ||
  highlight -O ansi -l {} ||
  coderay {} ||
  rougify {} ||
  cat {}) 2> /dev/null | head -500"'

fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d \
    -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

#
# -------------------------------------------------------------------
# FUNCTIONS
# -------------------------------------------------------------------

# return my IP address
function myip() {
  ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0       : " $2}'
  ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}

# ANDROID REACT-NATIVE Development Home
# export ANDROID_HOME=$HOME/Library/Android/sdk
# export PATH=$PATH:$ANDROID_HOME/emulator
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/tools/bin
# export PATH=$PATH:$ANDROID_HOME/platform-tools

# Git shortcuts/alias
# https://github.com/teto/fzf-gems
# Old setup for bindings. Might be worth looking into again for shortcuts
# source $HOME/.fzf/shell/fzf_git_keybindings.zsh
# source $HOME/.fzf/shell/fzf_git.zsh

# source $HOME/.zshenv
# source $HOME/.zprofile

# Allow [ or ] (brackets) whereever you want
unsetopt nomatch

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ASDF exec
. /usr/local/opt/asdf/libexec/asdf.sh

# OP - onepassword - 1password completion
eval "$(op completion zsh)"; compdef _op op

# This is used for AWS CLI autocompletion
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

