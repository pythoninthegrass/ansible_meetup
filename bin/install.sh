#!/usr/bin/env bash

set -Eeuo pipefail

trap_card() {
	if [[ $? -eq 0 ]]; then
		echo "Successfully installed all dependencies"
	else
		echo "${FUNCNAME[1]}: failed"
	fi
}
# trap exit signals 0, 2, 1, 15
trap trap_card EXIT SIGINT SIGHUP SIGTERM

# env vars
ASDF_VERSION="0.14.0"
PYTHON_VERSION="3.11.6"
UNAME=$(uname -s)

# bins
ASDF=$(command -v asdf 2>/dev/null)
ANSIBLE=$(command -v ansible 2>/dev/null)
GIT=$(command -v git 2>/dev/null)
PYTHON=$(command -v python 2>/dev/null)
PRECOMMIT=$(command -v pre-commit 2>/dev/null)

# $USER
[[ -n $(logname >/dev/null 2>&1) ]] && logged_in_user=$(logname) || logged_in_user=$(whoami)

# $HOME
logged_in_home=$(eval echo "~${logged_in_user}")

# git
git_install() {
	if [[ $UNAME == "Darwin" ]]; then
		if [[ -z $GIT ]]; then
			brew install git
		else
			echo "git already installed"
			return 0
		fi
	elif [[ $UNAME == "Linux" ]] && [[ -n $GIT ]]; then
		apt-get update
		apt-get install -y git
	else
		echo "git already installed"
		return 0
	fi
}

# asdf
asdf_install() {
	if [[ -n $ASDF ]]; then
		echo "asdf already installed"
		return 0
	fi
	git clone https://github.com/asdf-vm/asdf.git "${logged_in_home}/.asdf" \
		--branch v${ASDF_VERSION}
	. "${logged_in_home}/.asdf/asdf.sh"
	echo "Please add the following to your .bashrc or .zshrc"
	echo ". ${logged_in_home}/.asdf/asdf.sh"
	asdf plugin-add python
}

# python
python_install() {
	if [[ -n $PYTHON ]]; then
		echo "python already installed"
		return 0
	fi
	asdf install python ${PYTHON_VERSION}
	asdf global python ${PYTHON_VERSION}
}

# ansible
ansible_install() {
	if [[ -n $ANSIBLE ]]; then
		echo "ansible already installed"
		return 0
	fi
	python -m pip install ansible --no-cache-dir
	python -m ansible-galaxy install -r requirements.yml
}

# pre-commit
pre_commit_install() {
	if [[ -n $PRECOMMIT ]]; then
		echo "pre-commit already installed"
		return 0
	fi
	python -m pip install pre-commit --no-cache-dir
}


main() {
	git_install
	asdf_install
	python_install
	ansible_install
	pre_commit_install
}
main "$@"

exit 0
