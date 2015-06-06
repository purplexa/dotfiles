# -*- mode: sh -*-
function prompt_char {
  git branch >/dev/null 2>/dev/null && echo '±' && return
  echo -n '%#'
}

function prompt_name {
  echo -n "%{$fg[green]%}%n%{$fg[blue]%}@%{$fg[yellow]%}%m %{$terminfo[sgr0]%}"
}

function prompt_venv {
  if [[ -n $VIRTUALENV ]]; then
    echo -n "%{$fg[blue]%}with env %{$fg[red]%}$VIRTUALENV "
  fi
}

function prompt_drush {
  f="${TMPDIR:-/tmp/}/drush-env/drush-drupal-site-$$"
  if [[ -f $f ]]; then
    echo -n "%{$fg[blue]%}using %{$fg[red]%}$(cat "$f")%{$terminfo[sgr0]%} "
  fi
}

function

function precmd {
  vcs_info
}

PROMPT='
$(prompt_name)%{$fg[blue]%}[%{$fg[magenta]%}%?%{$fg[blue]%}] $vcs_info_msg_0_$(prompt_drush)$(prompt_venv)
 %{$fg[blue]%}$(prompt_char)%{$terminfo[sgr0]%} '

RPROMPT='%{$fg[blue]%} at %{$fg[yellow]%}%~%{$fg[blue]%}%{$terminfo[sgr0]%}'

PS2='%{$fg[green]%}(%{$fg[magenta]%}%_%{$fg[green]%})%{$fg[blue]%}>%{$terminfo[sgr0]%} '
