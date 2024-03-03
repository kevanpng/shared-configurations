########################## easy aliases ##########################
alias cl='clear'

########################## git aliases ##########################
alias ga='git add'
alias gst='git status'
alias gc='git commit'
alias gb='git branch'
alias ggp='git push'
alias gl='git pull'
alias glo='git log'
alias grb='git rebase'
alias grbi='git rebase -i'
alias gbD='git branch -D'
alias gco='git checkout'
alias gcl='git clone'




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
