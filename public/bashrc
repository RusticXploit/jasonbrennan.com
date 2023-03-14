clip () { 
  file=$1;
  if [[ -z "$1" ]]
  then
    file=`jobs | grep '+' | awk '{print $NF}'`;
  fi

  cat $file | xclip -sel clip; 
}

myip () { wget -qO- http://ipecho.net/plain; printf '\n'; }

alias shutdown="echo 'You must call \"sd\" to shutdown this machine.'"
alias reboot="echo 'You must call \"rb\" to reboot this machine.'"
alias sd="/usr/sbin/shutdown"
alias rb="/usr/sbin/reboot"

alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias python='python3'
