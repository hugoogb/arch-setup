# Arch Linux setup

In this repo you will have my Arch Linux setup that conitues my [Arch Linux installation repo](https://github.com/hugoogb/arch-install)

# Table of contents

- [Arch linux setup](#arch-linux-setup)
  - [Install git](#install-git)
  - [Clone and execute script](#clone-and-execute-script)
  - [Curl command](#curl-command)
- [Keybindings](#keybindings)
  - [Windows](#windows)
  - [Apps](#apps)

## Clone and execute script

You can clone and execute the bootstrap script or just use the curl command below

### Clone repo

```sh
git clone https://github.com/hugoogb/arch-setup.git ~/arch-setup
```

### Bootstrap script

```sh
. ~/arch-setup/arch-setup.sh
```

## Curl command

```sh
curl -s https://raw.githubusercontent.com/hugoogb/arch-setup/master/arch-setup.sh | bash
```

# Keybindings

## Window manager

| Key                     | Action                           |
| ----------------------- | -------------------------------- |
| **mod + j**             | Next window (down)               |
| **mod + k**             | Next window (up)                 |
| **mod + shift + h**     | Decrease master                  |
| **mod + shift + l**     | Increase master                  |
| **mod + shift + j**     | Move window down                 |
| **mod + shift + k**     | Move window up                   |
| **mod + shift + f**     | Toggle floating                  |
| **mod + tab**           | Change layout                    |
| **mod + [1-9]**         | Switch to workspace N (1-9)      |
| **mod + shift + [1-9]** | Send Window to workspace N (1-9) |
| **mod + period**        | Focus next monitor               |
| **mod + comma**         | Focus previous monitor           |
| **mod + w**             | Kill window                      |
| **mod + ctrl + r**      | Restart wm                       |
| **mod + ctrl + q**      | Quit                             |

## Apps

| Key                 | Action                        |
| ------------------- | ----------------------------- |
| **mod + m**         | Launch rofi                   |
| **mod + shift + m** | Window nav (rofi)             |
| **mod + b**         | Launch browser (firefox)      |
| **mod + e**         | Launch file explorer (thunar) |
| **mod + return**    | Launch terminal (alacritty)   |
| **mod + s**         | Screenshot (scrot)            |
