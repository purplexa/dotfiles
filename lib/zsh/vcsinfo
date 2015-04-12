# -*- mode: sh -*-
autoload -Uz vcs_info

FMT_BRANCH="%{$fg[blue]%}on %{$fg[magenta]%}%b%{$terminfo[sgr0]%}%c%u (%{$fg[cyan]%}%7.7i%{$terminfo[sgr0]%})"
FMT_ACTION="(%F{red}%a%f%)"   # e.g. (rebase-i)
FMT_NVCSPATH="%F{244}%~%f"

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'  # display ¹ if there are unstaged changes
zstyle ':vcs_info:*' stagedstr '+'    # display ² if there are staged changes
zstyle ':vcs_info:*' actionformats "${FMT_BRANCH} ${FMT_ACTION} "
zstyle ':vcs_info:*' formats       "${FMT_BRANCH} "
zstyle ':vcs_info:*' nvcsformats   ""                             "${FMT_NVCSPATH} "
