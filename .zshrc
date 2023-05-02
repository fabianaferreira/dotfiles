export ZSH="/Users/fabiana/.oh-my-zsh"

ZSH_THEME="dracula"
ZSH_DISABLE_COMPFIX=true

plugins=(
	zsh-syntax-highlighting
	history-substring-search
	aws
)

source $ZSH/oh-my-zsh.sh

# Skip forward/back a word with opt-arrow
bindkey '[C' forward-word
bindkey '[D' backward-word

export ZSH_PROMPT=$PROMPT
export GOPATH="$HOME/go"


kubeContext='$(kubectl config current-context)'
kubeNamespace='$(kubens -c)'
account='$(cat ~/.vtex/session/session.json | jq '.account' -r)'
workspace='$(cat ~/.vtex/session/workspace.json | jq '.currentWorkspace' -r)'
export PROMPT='%F{111}%B'$kubeContext' ('$kubeNamespace')%F{172}%B ['$account'/'$workspace']%f%b '$ZSH_PROMPT''
function dp() {
	export PROMPT=$ZSH_PROMPT
}

function code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

function knewctx() {
	if [ -z "$1" ]
	then
		echo "knewctx {{CLUSTER}} {{SERVER}} {{TOKEN}}"
		return
	fi
	kubectl config set-cluster $1 --server=$2
	kubectl config set-credentials $1 --token=$3
	kubectl config set-context $1 --cluster=$1 --user=$1
}

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

export TEST_RANCHER_TOKEN=kubeconfig-u-iczhfeijqv:dq4jtsl6cpn4ffsm5g4jr45ggsnmht5r2rgr9mhgd4n7nrf4jqq64g

# router alias
alias rl="router-link -solution-root=/Users/fabiana/Documents/kube-router/src/Vtex.Kube.Router "

# kubectl alias
alias curlpod="kubectl run fabi --rm -it --image odise/busybox-curl -- /bin/sh"
alias k="kubectl "
alias kg="kubectl get "
alias kd="kubectl describe "
alias kgpo="kubectl get pods"
alias kgd="kubectl get deployment "

# kubectl alias
alias curlpod="kubectl run fabi --rm -it --image odise/busybox-curl -- /bin/sh"
alias k="kubectl "
alias kg="kubectl get "
alias kd="kubectl describe "
alias kgpo="kubectl get pods"

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
alias goprojects="cd /Users/fabiana/go/src/github.com/FabianaFerreira"
alias govtex="cd $GOPATH/src/github.com/vtex/"

# conda aliases
alias padsenv="conda activate trypanosoma-project"
alias envfile="conda env export > environment.yml"

function envcreate() {}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/fabiana/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/fabiana/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/fabiana/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/fabiana/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export GOPATH="$HOME/go"

export PATH="$PATH:$GOPATH/bin"
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"