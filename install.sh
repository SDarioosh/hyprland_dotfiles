#!/bin/bash

echo "Updating system..."
sudo pacman -Syu

echo "Installing official repository packages..."
# Core applications, DE utilities, fonts, and Hyprland dependencies
sudo pacman -S --needed \
    hyprland \
    hyprpaper \
    waybar \
    polkit-kde-agent \
    qt5-wayland qt6-wayland \
    rofi-wayland \
    rofi-calc \
    dolphin \
    fish \
    libqalculate \
    kate \
    zip \
    7zip \
    stow \
    foot \
    wireplumber pipewire pipewire-pulse \
    playerctl \
    brightnessctl \
    grim \
    slurp \
    wl-clipboard \
    nwg-displays \
    ttf-font-awesome \
    ttf-nerd-fonts-symbols \
    ttf-nerd-fonts-symbols-mono \
    htop \
    intel-media-driver \
    libva-intel-driver \
    libva-utils \
    pavucontrol \
    blueman \
    bluez \
    bluez-utils \
    openssh

echo "Installing AUR packages..."
# Web browser, media players, and custom exit menu
paru -S --needed \
    brave-bin \
    plexamp-appimage \
    sone-bin \
    hyprshutdown

echo "Setting Fish as the default shell..."
chsh -s /usr/bin/fish "$USER"

echo "Removing fish greeting"
fish -c "set -U fish_greeting ''"

echo "Installation complete! Please reboot or reload Waybar to apply fonts and start background services."
