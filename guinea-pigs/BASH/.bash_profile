[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
export PATH=/usr/local/bin/:/usr/local/sbin/:/opt/local/bin/:/opt/local/sbin/:/Users/user-account/.rvm/rubies/ruby-1.8.7-p248/bin:/Users/user-account/.rvm/gems/ruby-1.8.7-p248/bin:/Users/user-account/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
export PATH=~/bin:$PATH

#export APACHE2="/usr/local/apache2/bin"
#export PATH="${APACHE2}:${PATH}"
#export EDITOR='mate -w'
#export CLICOLOR=1
#export LSCOLORS=ExFxCxDxBxegedabagacad
#export PAGER=most
 
alias start_mysql="/Library/StartupItems/MySQLCOM/MySQLCOM start"
alias stop_mysql="/Library/StartupItems/MySQLCOM/MySQLCOM stop"

#. /sw/bin/init.sh

function gemdir {
if [[ -z "$1" ]] ; then
echo "gemdir expects a parameter, which should be a valid rvm Ruby selector"
else
rvm "$1"
cd `rvm gemdir`
pwd
fi
}

#if [ -f ~/.bash_terminal ]; then
#source ~/.bash_terminal
#fi

if [ -f ~/.bash_aliases ]; then
source ~/.bash_aliases
fi

export PROMPT_COMMAND='pwd > /tmp/cwd.`ps -o tty= -p $$`'

# MacPorts Installer addition on 2011-09-10_at_19:45:21: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


GIT_HOME=/usr/local/git
PATH=${GIT_HOME}/bin:${PATH};export PATH
MANPATH=${GIT_HOME}/share/man:${MANPATH};export MANPATH
