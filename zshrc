ZSH=$HOME/.oh-my-zsh

# themes are stored in ~/.oh-my-zsh/themes/
ZSH_THEME="robbyrussell"

# ZSH plugins
plugins=(git github osx rails ruby rvm textmate)

source $ZSH/oh-my-zsh.sh

# export PATH=$PATH:$HOME/.rvm/bin
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:~/.bin
export PATH=$PATH:/usr/local/share/npm/bin

export AWS_CREDENTIAL_FILE=~/.aws/credentials

alias proxy="ssh -ND 9999 "
alias makepvr="/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/texturetool"
alias github="open \`git config -l | grep 'remote.origin.url' | sed -En \
  's/remote.origin.url=git(@|:\/\/)github.com(:|\/)(.+)\/(.+).git/https:\/\/github.com\/\3\/\4/p'\`"

alias gitup='git fetch; git remote prune origin'
alias gl='git log'
alias gpom='git push origin master'
alias gpos='git push origin staging'
alias gs='git status'

alias fs='foreman start'
alias t='ruby -I test'
alias st='spring test'
alias rdm='rake db:migrate'
alias srdm='spring rake db:migrate'
alias rtp='rake test:parallel'
alias rtps='rake test:parallel_with_specs'
alias srtps='spring rake test:parallel_with_specs'

alias us='underscore print --color'

alias hrc='heroku run console --app '
alias hlt='heroku logs -t --app '

alias heroku='nocorrect heroku'
alias rspec='nocorrect rspec'

alias rm='trash'

bindkey '^R' history-incremental-search-backward

psgrep () {
  ps aux | grep -v grep | grep "$1" -i --color=auto
}

prep-db () {
  if [[ -f config/database.yml ]]; then
    rake db:migrate && (rake db:test:prepare ; rake parallel:prepare)
  fi
}

# when in a Rails-like environment, will drop, create, and call pg_restore on ~/database.dump
reset-db () {
  if [[ -f config/database.yml ]]; then
    echo "RAILS_ENV=development rake db:drop"
    RAILS_ENV=development rake db:drop
    echo "RAILS_ENV=development rake db:create"
    RAILS_ENV=development rake db:create

    DBNAME="$(basename `pwd`)_development"
    CORES=`sysctl -n hw.logicalcpu`
    echo "pg_restore -j $CORES--verbose --clean --no-acl --no-owner -h localhost -U `whoami` -d $DBNAME ~/$DBNAME.dump"
    pg_restore -j $CORES --verbose --clean --no-acl --no-owner -h localhost -U `whoami` -d $DBNAME ~/$DBNAME.dump

    echo "RAILS_ENV=development rake db:test:prepare"
    RAILS_ENV=development rake db:test:prepare
  else
    echo "Must be in a Rails project to use this command"
  fi
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM
rvm default

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
