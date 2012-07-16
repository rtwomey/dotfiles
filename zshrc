ZSH=$HOME/.oh-my-zsh

# themes are stored in ~/.oh-my-zsh/themes/
ZSH_THEME="robbyrussell"

# ZSH plugins
plugins=(git textmate rails ruby github osx rvm)

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:$HOME/.rvm/bin
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:~/.bin

alias makepvr="/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/texturetool"
alias github="open \`git config -l | grep 'remote.origin.url' | sed -En \
  's/remote.origin.url=git(@|:\/\/)github.com(:|\/)(.+)\/(.+).git/https:\/\/github.com\/\3\/\4/p'\`"

alias gitup='git fetch; git remote prune origin'
alias gs='git status'
alias gl='git log'

# when in a Rails-like environment, will drop, create, and call pg_restore on ~/database.dump
reset-db () {
  if [[ -f config/database.yml ]]; then
    echo "RAILS_ENV=development rake db:drop"
    RAILS_ENV=development rake db:drop
    echo "RAILS_ENV=development rake db:create"
    RAILS_ENV=development rake db:create

    DBNAME="$(basename `pwd`)_development"
    echo "pg_restore --verbose --clean --no-acl --no-owner -h localhost -U `whoami` -d $DBNAME ~/database.dump"
    pg_restore --verbose --clean --no-acl --no-owner -h localhost -U `whoami` -d $DBNAME ~/database.dump

    echo "rake db:test:prepare"
    rake db:test:prepare
  else
    echo "Must be in a Rails project to use this command"
  fi
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM
rvm default
