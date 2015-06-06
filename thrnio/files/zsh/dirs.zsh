# vim: syntax=zsh
# General
hash -d dwn=~/Downloads
hash -d dev=~/Development

if [ -f ~/.zsh/dirs.local ]; then
  . ~/.zsh/dirs.local
fi
