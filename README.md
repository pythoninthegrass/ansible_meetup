# ansible_meetup

## Minimum Requirements

* macOS/Linux
* [Homebrew](https://brew.sh)
* Tart
* Ansible

## Recommended Requirements

* Devbox

## Quickstart

```bash
# ansible
# * TODO
```

## Dev

```bash
# install tart
brew install cirruslabs/cli/tart

# tart commands
tart clone <image>
tart run <name>
tart list
tart stop <name>
tart delete <name>

# start macos guest
tart clone ghcr.io/cirruslabs/macos-sonoma-base:latest sonoma-base
tart set sonoma-base --disk-size 40
tart run sonoma-base
ssh-copy-id admin@$(tart ip sonoma-base)
ssh admin@$(tart ip sonoma-base)

# start ubuntu guest
tart clone ghcr.io/cirruslabs/ubuntu:latest ubuntu
tart set ubuntu --disk-size 20
tart run ubuntu &
ssh-copy-id admin@$(tart ip ubuntu)
ssh admin@$(tart ip ubuntu)

# start fedora guest
tart clone ghcr.io/cirruslabs/fedora:latest fedora
tart set fedora --disk-size 20
tart run fedora &
ssh-copy-id admin@$(tart ip fedora)
ssh admin@$(tart ip fedora)
```

## TODO

* Ansible
  * Install
  * Setup
  * Playbooks
    * Pare down to useful examples for short demo
* Tart
  * Orchard
    * Orchestrate VMs
  * Snapshots?
  * Packer
    * Build custom images (e.g., Fedora 40, Ubuntu 24.04)
* Test
  * Run on fresh Mac (remember devbox 😭)

## Further Reading

* [General tips — Ansible Community Documentation](https://docs.ansible.com/ansible/latest/tips_tricks/ansible_tips_tricks.html)
