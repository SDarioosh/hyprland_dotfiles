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
    thunar \
    thunar-volman \
    thunar-archive-plugin \
    gvfs \
    ristretto \
    tumbler \
    ffmpegthumbnailer \
    libopenraw \
    webp-pixbuf-loader \
    poppler-glib \
    libgsf \
    freetype2 \
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
    openssh \
    mako \
    warp \
    signal-desktop \
    libappindicator-gtk3 \
    gnome-keyring \
    libsecret\
    seahorse

echo "Installing AUR packages..."
# Web browser, media players, and custom exit menu
paru -S --needed \
    brave-bin \
    plexamp-appimage \
    sone-bin \
    hyprshutdown \
    openbubbles-app-bin \
    python-easyeda2kicad-git


echo "Linking config files"
# 1. Ensure the parent .config directory exists
mkdir -p ~/.config

for app in rofi hypr waybar mako qalculate Thunar ristretto fish foot; do
    rm -rf ~/.config/$app
    ln -s ~/dotfiles/$app ~/.config/$app
    echo "Symlinked: $app -> ~/.config/$app"
done

echo "Setting Fish as the default shell..."
chsh -s /usr/bin/fish "$USER"

echo "Removing fish greeting"
fish -c "set -U fish_greeting ''"

echo "Installation complete! Please reboot or reload Waybar to apply fonts and start background services."
