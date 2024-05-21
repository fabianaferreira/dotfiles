export ZSH="/Users/fabiana.fonseca/.oh-my-zsh"

ZSH_THEME="dracula"
ZSH_DISABLE_COMPFIX=true
# history setup
setopt SHARE_HISTORY
HISTFILE=~/.zsh_history

plugins=(
	aws
	kube-ps1
)

source $ZSH/oh-my-zsh.sh

# Skip forward/back a word with opt-arrow
# bindkey '[C' forward-word
# bindkey '[D' backward-word

PROMPT='$(kube_ps1)'$PROMPT # or RPROMPT='$(kube_ps1)'

export GOPATH="$HOME/go"
export PATH=/opt/homebrew/bin:$PATH
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=/opt:$PATH

function code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

function lk8() {
  clientid="$1"
  clientenv="$2"
  if [[ -z $clientid || -z $clientenv ]]
  then
    echo 'usage: lk8 <clientid> <cluster_name>'
    return
  fi

  export KUBECONFIG=~/.clustersconfigs/kubeconfigs/$1-$2-kubeconfig
}

# kubectl alias
alias curlpod="kubectl run fabi --rm -it --image odise/busybox-curl -- /bin/sh"
alias k="kubectl "
alias kg="kubectl get "
alias kd="kubectl describe "
alias kgpo="kubectl get pods"
alias kgd="kubectl get deployment "

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# zsh alias
alias zshrc="nvim ~/.zshrc"
alias zshsrc="source ~/.zshrc"

# git aliases
alias gs="git status"
alias gsh="git stash "
alias ga="git add -N . && git add -p"
alias gc="git commit "
alias gd="git diff "
alias gco="git checkout "
alias gchp="git cherry-pick "
alias gdrop="git checkout -- ."
alias gr="git reset "
alias gp='git push -u origin $(git branch --show-current)'
alias gpf="git push --force"
alias gr="git rebase -i "
alias gro="git rebase --onto "
alias gl="git log --all --decorate --oneline --graph"
alias gl1="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias gl2="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)'"
alias gl3="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
alias lg=!"git lg1"

# go aliases
alias goprojects="cd /Users/fabiana.fonseca/go/src/github.com/FabianaFerreira"
alias govtex="cd $GOPATH/src/github.com/vtex/"

if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /Users/fabiana.fonseca/.config/op/plugins.sh
export PATH="/opt/homebrew/opt/node@18/bin:$PATH"
