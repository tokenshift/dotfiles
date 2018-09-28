function rand512() {
	dd count=1024 < /dev/urandom 2> /dev/null | shasum -a 512 | cut -d ' ' -f 1
}

function rand256() {
	dd count=1024 < /dev/urandom 2> /dev/null | shasum -a 256 | cut -d ' ' -f 1
}

function rand160() {
	dd count=1024 < /dev/urandom 2> /dev/null | shasum -a 1 | cut -d ' ' -f 1
}

function rand128() {
	rand256 | cut -c1-32
}

function rand64() {
	rand256 | cut -c1-16
}

function rand32() {
	rand256 | cut -c1-8
}

export CLICOLOR=
export LESS='-R'
export SECRET_KEY_BASE=`rand512`
export GREP_OPTIONS="--color=auto $GREP_OPTIONS"
export GO15VENDOREXPERIMENT=1

source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
PS1='\e[0;32m($(date "+%H:%M:%S")) \[\e[1;35m[\e[1;36m\]\u\[\e[1;35m\]@\h \[\e[0;33m\]\w$(__git_ps1)\[\e[1;35m]\]\n\[\e[0;31m\]$\[\e[m\] '
