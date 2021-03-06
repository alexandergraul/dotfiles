# exports
export TERM="xterm-256color"
# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export SSH_KEY_PATH="~/.ssh/id_rsa"
export PAGER='less'
export EDITOR='nvim'

# Use modern completion system
#autoload -Uz compinit
#compinit

#zstyle ':completion:*' auto-description 'specify: %d'
#zstyle ':completion:*' completer _expand _complete _correct _approximate
#zstyle ':completion:*' format 'Completing %d'
#zstyle ':completion:*' group-name ''
#zstyle ':completion:*' menu select=2 eval "$(dircolors -b)"
#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion:*' list-colors ''
#zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
#zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
#zstyle ':completion:*' menu select=long
#zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
#zstyle ':completion:*' use-compctl false
#zstyle ':completion:*' verbose true

#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
#zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# aliases
# movement
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# list files
alias lh='ls -d .* --color=auto' # show hidden files/directories only
alias lsd='ls -aFhlG --color=auto'
alias la='ls -al --color=auto'
alias ls='ls -GFh --color=auto'
alias ll='ls -GFhl --color=auto'

# git
alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gb='git branch'
alias gc='git checkout'
alias gpu='git pull'
alias gcl='git clone'
alias gh='git hist' # hist is a .gitconfig alias

# applications
alias py3='python3'
alias py='python'
alias gdb='gdb -q'

# openSUSE
alias zse="zypper search"
alias zin="sudo zypper install"
alias zrm="sudo zypper remove"
alias zps="zypper ps -s"
alias zpsr="sudo zypper ps -s"
alias zup="sudo zypper dup --no-allow-vendor-change"
alias zif="zypper info"
alias zshr="sudo zypper sh"
alias zref="sudo zypper ref"

# steam fix
alias steam="LIBGL_DRI3_DISABLE=1 steam"

# netflix in chromium kiosk
alias netflix="chromium --user-data-dir=chromium-netflix --kiosk https://netflix.com"

# pcscd on / off (yubikey / GPG)
alias pcscdon="sudo systemctl start pcscd"
alias pcscdoff="sudo systemctl stop pcscd"


#Prompt
autoload -Uz colors && colors
PROMPT="%n@%m%{$fg[blue]%}:%{$fg[red]%}%~%{$fg[red]%}> %{$reset_color%}"

# this plugin overrides the prompt above
source /home/alex/powerless/powerless.zsh false
source /home/alex/powerless/utilities.zsh true

alias rt="sudo rails test"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#bindkey -v
