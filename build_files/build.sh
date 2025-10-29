#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf copr enable -y dejan/lazygit
dnf5 install -y \
	alacritty \
	btop \
	direnv \
	docker \
	docker-compose \
	fastfetch \
	fd-find \
	fprintd \
	fprintd-pam \
	fzf \
	git \
	just \
	lazygit \
	libfprint \
	lnav \
	mackup \
	mkcert \
	neovim \
	nodejs \
	perl \
	podman-compose \
	python3-pip \
	python3-setuptools \
	ripgrep \
	ruby \
	tmux \
	zoxide \
	zsh

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
systemctl enable docker.socket
/ctx/nerd-font.sh
/ctx/gh-cli.sh
