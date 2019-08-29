# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

export PATH=$PATH:/home/gonzalhu/deps/go/bin
export PATH=$PATH:/home/gonzalhu/go/bin
export PATH="$PATH:/snap/bin/"
source /opt/rh/rh-git29/enable 
alias cbox="cd /eos/home-g/gonzalhu/"
kinit -R && eval "$(ssh-agent -s)" && ssh-add /eos/home-g/gonzalhu/Private/keys/github.key

alias greva="cd /home/gonzalhu/Development/reva"
alias gcs3apis="cd /home/gonzalhu/Development/cs3apis"
alias gbox="cd /home/gonzalhu/Development/it-puppet-hostgroup-box"
alias geos="cd /home/gonzalhu/Development/it-puppet-hostgroup-eos"
alias music="(nohup spotify &>/dev/null &) &&  exit"

