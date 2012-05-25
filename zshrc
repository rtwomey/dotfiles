# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git textmate rails)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:~/.bin
export PATH=$PATH:$HOME/.rvm/bin

alias rvm-argos='rvm use ruby-1.9.3-p125@argos'
alias gitup='git fetch; git remote prune origin'

alias gs='git status'
alias gl='git log'

reset-db () {
  # check this is a Rails-like environment
  if [[ -f config/database.yml ]]; then
    echo "RAILS_ENV=development rake db:drop"
    RAILS_ENV=development rake db:drop
    echo "RAILS_ENV=development rake db:create"
    RAILS_ENV=development rake db:create

    echo "pg_restore --verbose --clean --no-acl --no-owner -h localhost -U `whoami` -d DATABASE ~/database.dump"
    pg_restore --verbose --clean --no-acl --no-owner -h localhost -U `whoami` -d DATABASE ~/database.dump

    echo "rake db:prepare"
    rake db:prepare
  else
    echo "Must be in a Rails project to use this command"
  fi
}

[[ -s "~/.rvm/scripts/rvm" ]] && source "~/.rvm/scripts/rvm"  # This loads RVM into a shell session.
