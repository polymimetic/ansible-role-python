# Ansible Role: Python

[![Build Status](https://img.shields.io/travis/polymimetic/ansible-role-python.svg?style=flat-square)](https://travis-ci.org/polymimetic/ansible-role-python)
[![Release](https://img.shields.io/github/tag/polymimetic/ansible-role-python.svg?style=flat-square)](https://github.com/polymimetic/ansible-role-python/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg?style=flat-square)](https://opensource.org/licenses/MIT)
[![Ansible Galaxy](https://img.shields.io/badge/galaxy-polymimetic.python-blue.svg?style=flat-square)](https://galaxy.ansible.com/polymimetic/python/)

Installs [Python](https://www.python.org/) and [Pip](https://pip.pypa.io) for GalliumOS.

## Requirements

No requirements.

## Dependencies

No dependencies.

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

    python_dependencies:
      - build-essential
      - libssl-dev
      - libffi-dev

Build dependencies for packages (will be installed with apt).

    python_apt_state: present

Determines the state for packages installed on the system. Available values are `present` or `latest`.

    python_packages:
      - python
      - python-dev
      - python-minimal
      - python-setuptools
      - python-simplejson
      - python-pip
      - python-apt
      - python-pycurl
      - python3-pip

Array of python apt packages.

    python_legacy_support: yes

Enable support for python 2.x.

    python_pip_executable: "/usr/bin/pip{{ 2 if python_legacy_support else 3 }}"

Path to python pip executable.

    pip_packages: []

A list of packages to install with pip. Examples below:

    pip_packages:
      # Specify names and versions.
      - name: docker
        version: "1.2.3"
      - name: awscli
        version: "1.11.91"
    
      # Or specify bare packages to get the latest release.
      - docker
      - awscli
    
      # Or uninstall a package.
      - name: docker
        state: absent
    
      # Or update a package ot the latest version.
      - name: docker
        state: latest
    
      # Or force a reinstall.
      - name: docker
        state: forcereinstall

## Example Playbook

To run the role, include it as follows:

    - hosts: all
      roles:
         - { role: polymimetic.python, x: 42 }

## Credits

This role takes inspiration from the following Ansible roles:

- [telusdigital.python](https://github.com/telusdigital/ansible-python)
- [geerlingguy.pip](https://github.com/geerlingguy/ansible-role-pip)
- [zerohacks.python](https://github.com/zerohacks/ansible-python)
- [andrewrothstein.python](https://github.com/andrewrothstein/ansible-python)
- [Stouts.python](https://github.com/Stouts/Stouts.python)
- [futurice.pip](https://github.com/futurice/ansible-pip)

## License

This software package is licensed under the [MIT License](https://opensource.org/licenses/MIT). See the [LICENSE](./LICENSE) file for details.

## Author Information

This role was created in 2017 by [Polymimetic](https://github.com/polymimetic).

* ansible-role-python generated using [ansible-role-skeleton](https://github.com/polymimetic/ansible-role-skeleton)