export ZSH="/Users/fabiana/.oh-my-zsh"

ZSH_THEME="dracula"

ZSH_DISABLE_COMPFIX=false

plugins=()

source $ZSH/oh-my-zsh.sh

export ZSH_PROMPT=$PROMPT
kubeContext='$(kubectl config current-context)'
kubeNamespace='$(kubens -c)'
account='$(cat ~/.vtex/session/session.json | jq '.account' -r)'
workspace='$(cat ~/.vtex/session/workspace.json | jq '.currentWorkspace' -r)'
export PROMPT='%F{111}%B'$kubeContext' ('$kubeNamespace')%F{172}%B ['$account'/'$workspace']%f%b '$ZSH_PROMPT''
function dp() {
	export PROMPT=$ZSH_PROMPT
}

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
alias ga="git add -p"
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

# conda aliases
alias padsenv="conda activate master"
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

