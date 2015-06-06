# -*- mode: sh -*-
function folsym {
  if [[ -e $1 || -h $1 ]]; then
    file=$1
  else
    file=`which $1`
  fi
  if [[ -e $file || -L $file ]]; then
    if [[ -L $file ]]; then
      echo `ls -ld $file | perl -ane 'print $F[7]'` '->'
      folsym `perl -le   '$file = $ARGV[0];
                                $dest = readlink $file
                                if ($dest !~ m{^/}) {
                                    $file =~ s{(/?)[^/]*$}{$1$dest};
                                } else {
                                    $file = $dest;
                                }
                                $file =~ s{/{2, }}{/}g;
                                while ($file =~ s{[^/]+/\.\./}{}) {
                                    ;
                                }
                                $file =~ s{^(/\.\.)+}{};
                                print $file' $file`
    else
      ls -d $file
    fi
  else
    echo $file
  fi
}

function title {
  if [[ $TERM == "screen"* ]]; then
    print -nR $'\033k'$1$'\033\\'
    print -nR $'\033]0;'$2$'\a'
  fi
}

function cool-cd {
  builtin cd $1 && a
}

function drinf {
  mv ~/Downloads/$1.tar .
  rm -r $1
  x $1.tar
  rm $1.tar
}

function cddr {
  cd `pwd | sed "s/^\(.*\/\)app\/.*/\1/"`$1
}

function dapi {
  chromium-browser --app=http://api.drupal.org/api/search/6/$1
}

function wtf {
  echo "What the fuck, $1?"
}

function WTF {
  echo "What the FUCK, $1?!"
}

function crush {
  drush $1 cc all
}

function dapi7 {
  chromium-browser --app=http://api.drupal.org/api/search/7/$1
}

function sphp {
  chromium-browser --app="http://us2.php.net/manual-lookup.php?pattern=$1"
}

function diralias {
  echo "hash -d $1=$(pwd)" >> ~/.zsh/dirs.local
}

function venv {
  path=("${(@)path:#~/virtualenvs/*}")
  if [[ -n $1 && -d ~/virtualenvs/$1 ]]; then
    path=(~/virtualenvs/$1/bin $path)
    VIRTUALENV=$1
  else
    VIRTUALENV=
  fi
}

man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

# do we have ack? I'd like to say so.
if which ack-grep >/dev/null 2>&1
then
  alias ack=ack-grep
fi

# Catch if we don't have it. Alias returns 0 too.
if which ack >/dev/null 2>&1
then
  # add a function to wrap around ack.
  # annoyingly BSD xargs doesn't have -e
  vack()
  {
    if [ $#[@] -eq 1 ]
    then
      # We could have more args (like a dir, whatever..), so if we just
      # have one, assume that whole thing is the string to search for.
      # Also make vim go to the first line, then search for it
      # (otherwise wrapscan can get in the way).
      ack --no-color -l "$@" | /usr/bin/xargs -o vi +1 +/"$@"
    else
      ack --no-color -l $@ | /usr/bin/xargs -o vi
    fi
  }
fi
