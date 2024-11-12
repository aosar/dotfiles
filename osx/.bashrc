#!/opt/local/bin/bash

# Add macports install location
export PATH=/opt/local/bin:$PATH

alias :wq='tmux detach'
alias tns='tmux new-session -s'
alias tmd='tmux detach'
alias tma='tmux attach -t'

alias python='/usr/bin/python3'
alias psql="psql15"
alias dk='docker'

#PS1='\u@\h:\w\$ '

export PS1="\[\033[0;32m\]\u@\h\[\033[00m\]:\[\033[0;35m\]\w\[\033[0;32m\]\[\033[00m\]\$ "

export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk20/Contents/Home"

export BASH_SILENCE_DEPRECATION_WARNING=1

alias grep='grep --color=auto'

source ~/.env

## IMPORT DEVTOOLS
source ~/devscripts/dockertools.sh
#source ~/devscripts/linkagg.sh

# get var from .env file in current dir
# (this is to avoid outputting secrets/pw to terminal)
getenv() {
  grep "$1" .env | cut -d '=' -f2
}

kill-on-port() {
  PORT=${1:-8081}
  PID=$(lsof -i 4tcp:$PORT -sTCP:LISTEN -Fp | sed 's/^p//')
  if [[ -n $PID ]]; then
    echo "Killing process on port $PORT with PID: $PID"
    kill -9 $PID
  else
    echo "No process to kill on port $PORT"
  fi
}

#alias rc-service="launchctl"

# list o mac svc stuff
# launchctl load -w /System/Library/LaunchDaemons/x
# launchctl unload /path/x
# launchctl list
# launchctl kickstart -k x # restart a service