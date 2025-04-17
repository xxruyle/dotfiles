# Set up the prompt

autoload -Uz promptinit
promptinit
# prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
# autoload -Uz compinit
# compinit



# zstyle ':completion:*' auto-description 'specify: %d'
# zstyle ':completion:*' completer _expand _complete _correct _approximate
# zstyle ':completion:*' format 'Completing %d'
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*' menu select=2
# eval "$(dircolors -b)"
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*' list-colors ''
# zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
# zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
# zstyle ':completion:*' menu select=long
# zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
# zstyle ':completion:*' use-compctl false
# zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# HISTCONTROL=ignoreboth          # Not used in zsh; use HIST_IGNORE_SPACE & HIST_IGNORE_DUPS instead
# setopt HIST_IGNORE_SPACE        # Ignore commands starting with space
# setopt HIST_IGNORE_DUPS         # Ignore duplicate commands
# setopt APPEND_HISTORY           # Append to history file
# setopt INC_APPEND_HISTORY       # Write immediately, not at shell exit
# HISTSIZE=1000
# SAVEHIST=2000
# HISTFILE=~/.zsh_history

# Check window size after each command
autoload -Uz resize
TRAPWINCH() {
  resize >/dev/null
}

# Set variable identifying the chroot you work in (used in the prompt)
if [[ -z "$debian_chroot" && -r /etc/debian_chroot ]]; then
  debian_chroot=$(< /etc/debian_chroot)
fi

# Prompt
# autoload -Uz colors && colors
# if [[ "$TERM" == xterm-color || "$TERM" == *-256color ]]; then
#   color_prompt=yes
# fi

# Prompt with colors
# if [[ "$color_prompt" == yes ]]; then
#   PROMPT='${debian_chroot:+($debian_chroot)}%F{green}%n@%m%f:%F{blue}%~%f\$ '
# else
#   PROMPT='${debian_chroot:+($debian_chroot)}%n@%m:%~\$ '
# fi

# xterm title
case "$TERM" in
  xterm*|rxvt*)
    precmd() { print -Pn "\e]0;${debian_chroot:+($debian_chroot)}%n@%m: %~\a" }
    ;;
esac

# Enable color support of ls and handy aliases
if command -v dircolors &>/dev/null; then
  if [[ -r ~/.dircolors ]]; then
    eval "$(dircolors -b ~/.dircolors)"
  else
    eval "$(dircolors -b)"
  fi
  alias ls='ls --color=auto'
  # alias dir='dir --color=auto'
  # alias vdir='vdir --color=auto'
  # alias grep='grep --color=auto'
  # alias fgrep='fgrep --color=auto'
  # alias egrep='egrep --color=auto'
fi


# Terminal type
export TERMINAL=kitty

# Custom prompt (you can comment this out if using zsh themes)
export PS1=$'\n\e[0;33m%~\n\e[1;32m❯ \e[0m'

# Keyboard repeat and delay
[[ $DISPLAY ]] && command -v xset &>/dev/null && xset r rate 275 30

# Aliases
alias nvimbashrc="nvim ~/dotfiles/.bashrc"
alias cdnvim="cd ~/dotfiles/.config/nvim"
# alias neofetch="neofetch --ascii_distro Debian_small"
alias cdd="cd ~/dev"
alias cdconf="cd ~/dotfiles/.config"
alias confnotes="nvim ~/dev/notes/config-notes.md"
alias vtop="vtop --theme gruvbox"
alias kuplan="nvim ~/OneDrive/University\ of\ Kansas/2024\ Fall/fallplanner.md"
alias calendar="calcurse"

# Reload kitty terminal
kitty-reload() {
  kill -SIGUSR1 $(pidof kitty)
}

# yt-dlp alias
alias ytdlps="yt-dlp -f \"bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best\" -o '%(title)s-%(id)s.%(ext)s'"

# Path configuration
export PATH="$PATH:/usr/local/go/bin:/home/thinkpad/.local/bin:/home/thinkpad/dev/builds/jdk-21.0.6+7/bin"

# mdfpdf command
kumdpdf() {
  mdpdf -o "$1" --header "Xavier Ruyle, , $3" --footer "{date},{heading},{page}" "$2"
}

# Autocompletion behavior
# bindkey '^I' menu-complete
# zstyle ':completion:*' menu select

# traverse left or right with ctrl 
bindkey '^[[1;5C' forward-word     # Ctrl+Right
bindkey '^[[1;5D' backward-word    # Ctrl+Left


# VI mode 
bindkey -v

# Auto suggestion 
source /home/thinkpad/dotfiles/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


# auto suggest key 
bindkey '^I' autosuggest-accept

# default complete 
# bindkey '^E' complete
