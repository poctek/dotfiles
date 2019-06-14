# FZF default command
FZF_DEFAULT_COMMAND='ag -g ""'

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded
DEFAULT_USER=poctek
# POWERLEVEL9K_MODE='awesome-fontconfig'
# POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
# ZSH_THEME="pygmalion"
ZSH_THEME=""

# PURE_PROMPT_SYMBOL=' 🐑  👉'
# PURE_PROMPT_SYMBOL='🦌 💥 💨  🤞'

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Tmux install

# Vim mode enabled
bindkey -M viins 'jj' vi-cmd-mode

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Add aliases
[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases

# Add env variables
[ -f ~/.zsh_env ] && source ~/.zsh_env

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git rails bundler osx rake vi-mode z h zsh-history-substring-search zsh-syntax-highlighting)

# User configuration

# export PATH="$PATH:/Users/poctek/.rvm/gems/ruby-2.2.3/bin:/Users/poctek/.rvm/gems/ruby-2.2.3@global/bin:/Users/poctek/.rvm/rubies/ruby-2.2.3/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/poctek/.rvm/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

autoload -U promptinit; promptinit
prompt pure

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

transfer() {
  # write to output to tmpfile because of progress bar
  tmpfile=$( mktemp -t transferXXX )
  curl --progress-bar --upload-file $1 https://transfer.sh/$(basename $1) >> $tmpfile;
  cat $tmpfile | grep https | pbcopy;
  pbpaste | echo;
  rm -f $tmpfile;
}

alias transfer=transfer

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='vim'
# fi
export GIT_EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Some paths
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
eval "$(rbenv init -)"
