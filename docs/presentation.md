# Automation with Ansible

<!-- https://simpleslides.dev/exographicskip/automation-with-ansible -->

## `whoami`

I work as a [DevOps Engineer](https://www.linkedin.com/in/lancestephens/) at a local voter analytics company.

Learned Python over a decade ago (2.7 baby!) and dabble in other languages but my main is always Python.

Founded Pythonistas in September 2021 (three years as of this month!) with 17 members initially. We're now up to 195 members! We'd love to continue to provide meaningful content and host events that are focused around Python and software development in general!


## Agenda

* What is Ansible?
* Why use Ansible?
* Key Concepts
* Install Ansible
* Setup environment
* Demo


## What is Ansible?

Ansible was [created in 2012 by Michael DeHaan](https://en.wikipedia.org/wiki/Ansible_(software)) and acquired by Red Hat in 2015.

Ansible is a [configuration management tool](https://www.atlassian.com/microservices/microservices-architecture/configuration-management-tools) that is written in Python but uses [YAML](https://docs.ansible.com/ansible/latest/reference_appendices/YAMLSyntax.html) to provision devices over SSH on Unix operating systems and WinRM on Windows [without installing an agent](https://www.ansible.com/how-ansible-works/).

It's not necessary to know Python to use Ansible, but understanding Ansible's [declarative syntax](https://docs.ansible.com/ansible/latest/reference_appendices/glossary.html#term-Declarative) is crucial to being proficient at leveraging its capabilities to automate tasks.


## Why use Ansible?

It's a mature framework that has major backing by Red Hat (IBM) and a large open source community.

Unlike some other configuration management tools from around the same time (e.g., Chef, Puppet, Saltstack), Ansible has maintained its dominance in the IT and software fields in large part due to its ease of use and parallel growth with [cloud native technology](https://docs.ansible.com/ansible/latest/collections/kubernetes/core/k8s_module.html).


## Key Concepts

* [Idempotency](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_intro.html#desired-state-and-idempotency)
* SSH / WinRM
* Inventory (`hosts`)
* [Privilege escalation](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_privilege_escalation.html)
* `ansible.cfg`
* Playbooks
* Templating (Jinja2)
* Collections
* Roles
* Tasks


## Install Ansible

See the [official docs](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-and-upgrading-ansible) for more info but to quickly get started, we'll use [pipx](https://pypa.github.io/pipx/installation/).

* Install Ansible with dependencies
```bash
pipx install --include-deps ansible
```

* Add `argcomplete` for shell completion and add to `$PATH`
```bash
pipx inject --include-apps ansible argcomplete
```


## Setup Environment

* Clone the demo repo
    ```bash
    git clone https://github.com/pythoninthegrass/ansible_meetup.git
    cd ansible_meetup/
    ```
* Navigate to the `ansible` directory
    ```bash
    cd ansible/
    ```
* Copy the example configuration files to a new file
    ```bash
    cp ansible.cfg.example ansible.cfg
    cd vars/
    cp all.yml.example all.yml
    cd ..
    ```
* Edit relevant items (hosts, fact caching, etc.)
* Copy a public SSH key to the Unix host set in `hosts`
    ```bash
    ssh-copy-id <user@hostname_or_ip_address>
    ```
* Run a quick health check
    ```bash
    ansible all -i <ip_address>, -m ping -u <admin>
    ```
* Install community collections and roles
    ```bash
    ansible-galaxy install -r requirements.yml
    ```


## Demo

![GitHub Repo](qr.png)
