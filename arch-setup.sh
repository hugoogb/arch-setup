#!/bin/bash

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'

BOLD='\033[1m'
ITALIC='\033[3m'
NORMAL="\033[0m"

color_print() {
  if [ -t 1 ]; then
    echo -e "$@$NORMAL"
  else
    echo "$@" | sed "s/\\\033\[[0-9;]*m//g"
  fi
}

stderr_print() {
  color_print "$@" >&2
}

warn() {
  stderr_print "$YELLOW$1"
}

error() {
  stderr_print "$RED$1"
  exit 1
}

info() {
  color_print "$CYAN$1"
}

ok() {
  color_print "$GREEN$1"
}

program_exists() {
  command -v $1 &> /dev/null
}

# modify
REPO=arch-setup

ACTUAL_DIR=`pwd`
REPO_DIR=$HOME/$REPO
TEMP_DIR=$HOME/temp
CONFIG_DIR=$HOME/.config

if [ ! -d $TEMP_DIR ]; then
  mkdir $TEMP_DIR
fi

if [ ! -d $CONFIG_DIR ]; then
  mkdir $CONFIG_DIR
fi

ok "Welcome to @hugoogb $REPO!!!"
info "Starting process..."

sleep 1

if ! program_exists "git"; then
  error "ERROR: git is not installed"
fi

# Dotfiles update
update_repo() {
  cd $REPO_DIR
  info "Updating $REPO..."
  git config --global pull.rebase false
  git pull origin master
  cd $REPO_DIR
}

clone_repo() {
  if [ -d $REPO_DIR]; then
    warn "WARNING: $REPO directory already exists"
  else
    info "Cloning $REPO..."
    git clone https://github.com/hugoogb/$REPO.git $REPO_DIR
  fi

  update_repo

  ok "$REPO cloned and updated"
}

clone_update_repo() {
  clone_repo
}

# qtile setup
qtile_setup() {
  info "Setting up qtile..."

  # needed to show wifi widget
  pip install psutil

  cp -rfv $REPO_DIR/.config/qtile $CONFIG_DIR
}

# Rofi setup
rofi_setup() {
  info "Setting up rofi..."

  git clone https://github.com/davatorium/rofi-themes.git $TEMP_DIR/rofi-themes
  sudo cp -fv $TEMP_DIR/rofi-themes/User\ Themes/onedark.rasi /usr/share/rofi/themes/

  sudo cp -fv $REPO_DIR/.local/themes/onedark.rasi /usr/share/rofi/themes/

  cp -rfv $REPO_DIR/.config/rofi $CONFIG_DIR
}

# Ranger setup
ranger_setup() {
  info "Setting up ranger..."

  cp -rfv $REPO_DIR/.config/ranger $CONFIG_DIR

  RANGER_PLUGIN_DIR=$CONFIG_DIR/ranger/plugins

  if [ ! -d $RANGER_PLUGIN_DIR ]; then
    git clone https://github.com/alexanderjeurissen/ranger_devicons $CONFIG_DIR/ranger/plugins
  else
    warn "WARNING: ranger plugins already installed"
  fi
}

# Alacritty
alacritty_setup() {
  info "Setting up alacritty..."

  cp -rfv $REPO_DIR/.config/alacritty $CONFIG_DIR

  info "Installing pycritty..."

  # Pycritty
  pip install pycritty
}

# Openbox setup
openbox_setup() {
  info "Setting up openbox..."

  cp -rfv $REPO_DIR/.config/openbox $CONFIG_DIR
  cp -rfv $REPO_DIR/.config/tint2 $CONFIG_DIR
}

arch_setup() {
  qtile_setup
  rofi_setup
  ranger_setup
  alacritty_setup
  openbox_setup
}

main() {
  arch_setup
}

main

rm -rf $TEMP_DIR

ok "$REPO done!!!"
warn "WARNING: don't forget to reboot in order to get everything working properly"