#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Starting automated installation process..."

# 1. Update system package databases
echo "Synchronizing package databases and updating system..."
sudo pacman -Syu --noconfirm

# 2. Define packages to install
PACKAGES=(
    rofi-wayland
    dolphin
    fish
    waybar
    hyprpaper
    libqalculate   # Provides the 'qalc' CLI engine used by rofi-calc
    qt5-wayland     # Ensures Dolphin works perfectly under Wayland
    qt6-wayland     # Ensures Dolphin works perfectly under Wayland
)

# 3. Install packages via pacman
echo "Installing core packages..."
sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"

# 4. Optional: Set fish as the default shell
echo "Setting fish as the default shell..."
chsh -s $(which fish)

echo "Installation complete! Core apps and qalc are ready."
