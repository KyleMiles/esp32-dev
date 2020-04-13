# Enables tab-completion
autoload -Uz compinit
compinit

# Enables command history tracking
HISTSIZE=2000
SAVEHIST=$HISTSIZE
HISTFILE=~/.histfile
setopt hist_ignore_all_dups
setopt hist_ignore_space

# Some misc options
unsetopt correct_all
setopt correct
setopt autocd     #cd muffling

# Advanced prompt support
autoload -Uz promptinit
promptinit

# More fun shit
autoload -Uz zcalc
autoload -Uz tetriscurses
alias calc='zcalc'
alias tetris='tetriscurses'

# Kyle's Colors
local userName="%B%F{green}%n%f%b"
local compcnct="%B%(?.%F{green}.%F{red})@%f%b"
local hostName="%B%F{green}%M%f%b"
local pathcnct="%F{51}:%f"
local pathName="%F{103}%~%f"
local prompter="%F{51}%(!.#.$) %f"
local textColr="%F{103}"
PROMPT=${userName}${compcnct}${hostName}${pathcnct}${pathName}${prompter}${textColr}

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# More aliases
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
alias gdb='gdb -q'
alias gitupdate="find . -maxdepth 1 -type d -exec sh -c '(cd {} && git pull)' ';'"
alias pipupdate="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install --user -U"
alias pip3update="pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install --user -U"


# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Give ZSH some style
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct #_approximate
#zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Enable CTRL-shortcuts
export WORDCHARS=''
bindkey ";5C" emacs-forward-word
bindkey ";5D" emacs-backward-word
bindkey '5~' kill-word
bindkey '^H' backward-kill-word
