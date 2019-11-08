#!/usr/bin/env zsh
export EDITOR="vim"

## ZSH and oh-my-zsh
ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$HOME/Workspace/dotfiles/oh-my-zsh"
ZSH_THEME="kolo"
ZSH_DISABLE_COMPFIX=true
_Z_DATA="$HOME/.zdata"
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

export LC_CTYPE=en_US.UTF-8

export PATH="./node_modules/.bin:$PATH" # node
export PATH="./vendor/bin:$PATH" # composer

export GNUPGHOME="~/MEGAsync/gpg"
export GPG_TTY=$(tty)

if which neofetch >/dev/null 2>&1; then
  neofetch
fi

if which xclip >/dev/null 2>&1; then
  alias pbcopy="xclip -sel clip"
  alias pbpaste="xclip -o"
fi

# usage: pwcopy      -- generates, print, and copy into clipboard a 32 characters long secure password
# usage: pwcopy 10   -- generates, print, and copy into clipboard a 10 characters long secure password
pwcopy() {
  pwgen -sN1 ${1:-32} ${@[@]:2} | head -c-1 | tee /dev/stderr | pbcopy
}
