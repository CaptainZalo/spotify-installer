#!/bin/bash
# Installer script v0.1. Intended for Debian ARM-based SoC-distribution and GIRL v9.5.0. http://girl.software
# Check if Synaptic packagemanager is installed.
set -e
if ! hash apt-get 2>/dev/null; then
        echo "Sorry. This script requires a distribution with Synaptic package manager (Debian distributions)."
        exit 1
fi
# Check if script is ran in root context.
if [ "$(id -u)" -ne "0" ]; then
        echo "This script requires root."
        exit 1
fi
# 1. Add the Spotify repository signing key to be able to verify downloaded packages
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
# 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
# 3. Update list of available packages
sudo apt-get -y update
# 4. Install Spotify
sudo apt-get -y install spotify-client
