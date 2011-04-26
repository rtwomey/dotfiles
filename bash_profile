# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

#export SVN_SSH="ssh -i /home/rtwomey/.ssh/svn_id_rsa"
export SVN_EDITOR=vim
export PS1="[\u@\h \W]\$ "

alias rm="rm -i"

PATH=$PATH:$HOME/bin:/usr/local/mysql/bin:/usr/local/bin:/Users/rtwomey/Development/glassfish/bin:/Users/rtwomey/Development/groovy-1.0/bin:/opt/local/bin:/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/bin/:/Library/PostgreSQL/9.0/bin/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/local/lib
export PATH=$PATH:/Library/PostgreSQL/9.0/bin

export RUBYLIB=/opt/local/lib/ruby/vendor_ruby/1.8/i686-darwin9.1.0

export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
export GRAILS_HOME=/Users/rtwomey/Development/Java/grails-1.0.5
export ANT_HOME=/Users/rtwomey/Development/Java/apache-ant-1.6.5
export GROOVY_HOME=/Users/rtwomey/Development/Java/groovy-1.0
export JRUBY_HOME=/Users/rtwomey/Development/Java/jruby-1.3.0

JFREECHART=/Users/rtwomey/Development/Java/jfreechart-1.0.13/lib
export CLASSPATH=$JFREECHART/jfreechart-1.0.13.jar:$JFREECHART/swtgraphics2d.jar:$JFREECHART/jcommon-1.0.16.jar

export ACTIVEMQ_HOME=/Users/rtwomey/Development/Java/apache-activemq-5.2.0

export EC2_HOME=/Users/rtwomey/Development/Java/ec2-api-tools-1.3-34128
export EC2_AMITOOL_HOME=/Users/rtwomey/Development/Java/ec2-ami-tools-1.3-31780

export MTURK_CMD_HOME=/Users/rtwomey/Development/Java/aws-mturk-clt-1.3.0

PATH=$PATH:$GRAILS_HOME/bin:$JRUBY_HOME/bin:$EC2_HOME/bin:$EC2_AMITOOL_HOME/bin
export PATH
unset USERNAME

shopt -s cdspell

export HISTCONTROL=ignoredups
export HISTFILESIZE=1000000
export HISTSIZE=100000

shopt -s histappend
alias h="history | grep "

test -r /sw/bin/init.sh && . /sw/bin/init.sh

alias ls="ls -G"
alias js="jruby -S "

alias makepvr="/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/texturetool"

alias github="open \`git config -l | grep 'remote.origin.url' | sed -En \
  's/remote.origin.url=git(@|:\/\/)github.com(:|\/)(.+)\/(.+).git/https:\/\/github.com\/\3\/\4/p'\`"

export ARCHFLAGS="-arch x86_64"

if [ -f /opt/local/etc/bash_completion ]; then
	. /opt/local/etc/bash_completion
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # Load RVM into a shell session *as a function*

