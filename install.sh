#!/bin/bash

echo "Updating system..."
sudo pacman -Syu

echo "Installing official repository packages..."
# Including hyprland, wayland utilities, your new additions, and requested apps
sudo pacman -S --needed \
    hyprland \
    hyprpaper \
    waybar \
    polkit-kde-agent \
    qt5-wayland qt6-wayland \
    rofi-wayland \
    dolphin \
    fish \
    libqalculate \
    kate \
    zip \
    7zip \
    stow

echo "Installing AUR packages..."
# brave-bin, plexamp, tidal
paru -S --needed \
    brave-bin \
    plexamp-appimage \
    tidal-hifi-bin

echo "Setting Fish as the default shell..."
chsh -s /usr/bin/fish

echo "Installation complete!"
