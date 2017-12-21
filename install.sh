#! /usr/bin/env bash
set -e
###########################################################################
#
# Python Bootstrap Installer
# https://github.com/polymimetic/ansible-role-python
#
# This script is intended to replicate the ansible role in a shell script
# format. It can be useful for debugging purposes or as a quick installer
# when it is inconvenient or impractical to run the ansible playbook.
#
# Usage:
# wget -qO - https://raw.githubusercontent.com/polymimetic/ansible-role-python/master/install.sh | bash
#
###########################################################################

if [ `id -u` = 0 ]; then
  printf "\033[1;31mThis script must NOT be run as root\033[0m\n" 1>&2
  exit 1
fi

###########################################################################
# Constants and Global Variables
###########################################################################

readonly GIT_REPO="https://github.com/polymimetic/ansible-role-python.git"
readonly GIT_RAW="https://raw.githubusercontent.com/polymimetic/ansible-role-python/master"

###########################################################################
# Basic Functions
###########################################################################

# Output Echoes
# https://github.com/cowboy/dotfiles
function e_error()   { echo -e "\033[1;31m✖  $@\033[0m";     }      # red
function e_success() { echo -e "\033[1;32m✔  $@\033[0m";     }      # green
function e_info()    { echo -e "\033[1;34m$@\033[0m";        }      # blue
function e_title()   { echo -e "\033[1;35m$@.......\033[0m"; }      # magenta

###########################################################################
# Install Python
# https://www.python.org/
#
# https://www.digitalocean.com/community/tutorials/how-to-install-python-3-and-set-up-a-local-programming-environment-on-ubuntu-16-04
# https://www.rosehosting.com/blog/how-to-install-pip-on-ubuntu-16-04/
###########################################################################

install_python() {
  e_title "Installing Python"

  local python_deps=(
    build-essential
    libssl-dev
    libffi-dev
  )

  local python_pkgs=(
    python-minimal
    python-dev
    python-apt
    python-simplejson
    python-pycurl
    python-pip
    python3-pip
  )

  # Install python dependencies
  sudo apt-get install -yq "${python_deps[@]}"

  # Install python packages
  sudo apt-get install -yq "${python_pkgs[@]}"

  # Test python installation
  if ! python -V >/dev/null 2>&1; then
    e_error "Error installing Python"
    exit 1
  else
    e_info "Python version: $(python -V 2>&1) installed."
  fi

  # Test pip installation
  if ! pip -V >/dev/null 2>&1; then
    e_error "Error installing Pip"
    exit 1
  else
    e_info "Pip version: $(pip -V 2>&1) installed."
  fi

  e_success "Python installed"
}

###########################################################################
# Program Start
###########################################################################

program_start() {
  install_python
}

program_start