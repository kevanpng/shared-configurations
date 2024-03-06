########################## easy aliases ##########################
alias cl='clear'
alias h='history'
alias hg='history | grep'

########################## git aliases ##########################
alias ga='git add'
alias gst='git status'
alias gc='git commit'
alias gb='git branch'
alias ggp='git push'
alias gl='git pull'
alias glo='git log'
alias glog='git log --graph --decorate --oneline'
alias grb='git rebase'
alias grbi='git rebase -i'
alias gbD='git branch -D'
alias gco='git checkout'
alias gcl='git clone'
alias gsta='git stash save'
alias gstp='git stash pop'


########################### terraform aliases ##########################
alias taa='terraform apply -auto-approve'
alias tda='terraform destroy -auto-approve'
alias tr='terraform refresh'

####################################################
echo 'bashrc sourced'
function bashrc {
  vim ~/.bashrc
  source ~/.bashrc
}

########### for bash history on windows
# append to the history file, don't overwrite it
#shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
#HISTSIZE=1000
#HISTFILESIZE=2000
