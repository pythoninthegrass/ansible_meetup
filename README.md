# ansible_meetup

## Minimum Requirements

* macOS/Linux
* [Homebrew](https://brew.sh)
* Tart
* Ansible

## Recommended Requirements

* Devbox

## Quickstart

### Environment

Create the virtual environment and install the requirements.

```bash
python3 -m venv .venv
python3 -m pip install --upgrade pip
python3 -m pip install -r requirements.txt
```

Activate the virtual environment.

```bash
# activate
source .venv/bin/activate

# exit
# deactivate
```

### Ansible

Install third-party roles.

```bash
cd ./ansible
ansible-galaxy install -r requirements.yml
```

Copy the `ansible.cfg.example` file to `ansible.cfg`.

```bash
# change any settings as needed
cp ansible.cfg.example ansible.cfg
```

Edit the `hosts` file to include the IP address of the target machine.

```bash
[servers]
192.168.105.5    ansible_user=admin
```

Run a quick smoke test.

```bash
# ping the target machine
ansible -m ping 192.168.105.5

# ping a group of machines
ansible -m ping servers

# ping all machines
ansible -m ping all
```

> [!NOTE]
> `ansible` is an "agentless" configuration management tool.
>
> This means that you do not need to install any software on the target machine.
>
> However, you do need to have SSH access to the target machine.

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

# start macos guest (manual)
tart clone ghcr.io/cirruslabs/macos-sonoma-base:latest sonoma-base
tart set sonoma-base --disk-size 40
tart run sonoma-base
ssh-copy-id admin@$(tart ip sonoma-base)
ssh admin@$(tart ip sonoma-base)

# vagrant via task (automatic)
# * macos, ubuntu, fedora are supported
task vagrant:plugin
task vagrant:up -- macos
task vagrant:ssh -- macos
task vagrant:halt -- macos
task vagrant:destroy -- macos
task vagrant:validate -- macos
```

## TODO

* Ansible
  * ~~Install~~
  * ~~Setup~~
  * Playbooks
    * Pare down to useful examples for short demo
    * Ideas
      * kind cluster
      * cron job
      * dev environment
      * wallpaper 
* Vagrant
  * Use provisioning with ansible to install minimum requirements in each vm
* Tart
  * Orchard
    * Orchestrate VMs
  * Snapshots?
  * Packer
    * Build custom images (e.g., Fedora 40, Ubuntu 24.04)
* Test
  * gum install on fedora and ubuntu
  * Run on fresh Mac (remember devbox 😭)

## Further Reading

* [General tips — Ansible Community Documentation](https://docs.ansible.com/ansible/latest/tips_tricks/ansible_tips_tricks.html)
* [Allaman/mac-setup: My Ansible Playbook to configure my MacBook](https://github.com/Allaman/mac-setup)
