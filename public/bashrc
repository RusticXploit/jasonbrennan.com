alias shutdown="echo 'You must call \"sd\" to shutdown this machine.'"
alias reboot="echo 'You must call \"rb\" to reboot this machine.'"
alias sd="/usr/sbin/shutdown"
alias rb="/usr/sbin/reboot"

alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias python='python3'

#### WD
# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"

if [[ -d ~/.asdf/plugins/java ]]; then
  . ~/.asdf/plugins/java/set-java-home.bash
fi
#### End WD

export ANDROID_HOME=$HOME/Android/Sdk
export PATH="${ANDROID_HOME}/emulator:${PATH}"
export PATH="${ANDROID_HOME}/platform-tools:${PATH}"
