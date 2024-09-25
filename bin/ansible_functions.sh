#!/usr/bin/env bash

# shellcheck disable=SC2317

help() {
	cat <<- DESCRIPTION >&2
	This script provides functions to run ansible-vault
	and ansible-playbook with the password provided by a
	custom askpass script for macOS' keychain.

	It will fail silently if the askpass script returns an
	empty string or if the askpass script is not found.

	USAGE

	    source $(dirname $0)/ansible_functions.sh
	DESCRIPTION
}

if [[ "$1" =~ ^(-h|--help)$ ]]; then
	help
	exit 0
fi

check_askpass_output() {
    local output
    output=$(askpass --vault)
    if [[ -z "$output" ]]; then
        echo "Error: askpass --vault returned an empty string" >&2
        return 1
    fi
    echo "$output"
}

ansible-vault() {
    local askpass_output
    askpass_output=$(check_askpass_output)
    if [[ -n "$askpass_output" ]]; then
        ANSIBLE_VAULT_PASSWORD_FILE=<(echo "$askpass_output") command ansible-vault "$@"
    else
        return 1 2>/dev/null || true
    fi
}

ansible-playbook() {
    local askpass_output
    askpass_output=$(check_askpass_output)
    if [[ -n "$askpass_output" ]]; then
        ANSIBLE_VAULT_PASSWORD_FILE=<(echo "$askpass_output") command ansible-playbook "$@"
    else
        return 1 2>/dev/null || true
    fi
}
