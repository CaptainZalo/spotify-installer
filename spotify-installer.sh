#!/bin/bash
# Installer script v0.1. Intended for Debian ARM-based SoC-distribution and GIRL v9.5.0. http://girl.software
# Check if Synaptic packagemanager is installed.
set -e
if ! hash apt-get 2>/dev/null; then
        echo "Sorry. This script requires a distribution with Synaptic package manager (Debian distributions)."
        exit 1
fi
# Check if script is running in root context.
if [ "$(id -u)" -ne "0" ]; then
        echo "This script requires root."
        exit 1
fi
# 1. Add the Spotify repository signing key to be able to verify downloaded packages
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
# 2. Add the Spotify repository
echo deb "http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
# 3. Update list of available packages and install Spotify
sudo apt-get update && sudo apt-get -y install spotify-client -noauthentication
