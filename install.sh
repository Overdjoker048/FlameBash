#!/usr/bin/env bash
set -e

echo "[FlameBash] Checking system..."

if ! grep -qi ubuntu /etc/os-release; then
    echo "[FlameBash] Error: Ubuntu is required."
    exit 1
fi

echo "[FlameBash] Updating system..."

sudo apt update
sudo apt upgrade -y
sudo apt full-upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y

if apt-cache show linux-generic &>/dev/null; then
    sudo apt install --install-recommends linux-generic -y
fi

command -v ubuntu-drivers &>/dev/null && sudo ubuntu-drivers install || true
command -v snap            &>/dev/null && sudo snap refresh          || true
command -v flatpak         &>/dev/null && flatpak update -y          || true

echo "[FlameBash] Installing required packages..."

sudo apt install -y \
    git \
    python3-venv \
    python3-pip \
    alacritty \
    clang \
    patchelf

echo "[FlameBash] Backing up current .bashrc..."

[ -f "$HOME/.bashrc" ] && cp "$HOME/.bashrc" "$HOME/.bashrc.backup"

echo "[FlameBash] Installing FlameBash..."

curl -fsSL \
    "https://raw.githubusercontent.com/Overdjoker048/FlameBash/main/.bashrc" \
    -o "$HOME/.bashrc"

echo "[FlameBash] Configuring Alacritty..."

mkdir -p "$HOME/.config/alacritty"

cat > "$HOME/.config/alacritty/alacritty.toml" << 'EOF'
[window]
opacity = 0.9
EOF

echo "[FlameBash] Configuring GNOME shortcuts..."

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings \
"['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/alacritty/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/nautilus/']"

# Super + Enter -> Alacritty
gsettings set \
org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/alacritty/ \
name "Alacritty"

gsettings set \
org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/alacritty/ \
command "alacritty"

gsettings set \
org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/alacritty/ \
binding "<Super>Return"

# Super + E -> Nautilus
gsettings set \
org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/nautilus/ \
name "Nautilus"

gsettings set \
org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/nautilus/ \
command "nautilus"

gsettings set \
org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/nautilus/ \
binding "<Super>e"

echo "[FlameBash] Setting Alacritty as default terminal..."

if [ -x /usr/bin/alacritty ]; then
    sudo update-alternatives --set x-terminal-emulator /usr/bin/alacritty || true
fi

echo
echo "========================================"
echo "      FlameBash Installed Successfully"
echo "========================================"
echo
echo "Keyboard shortcuts:"
echo "  Super + Enter  -> Alacritty"
echo "  Super + E      -> Nautilus"
echo
echo "Backup created:"
echo "  ~/.bashrc.backup"
echo
echo "Apply the new configuration with:"
echo "  source ~/.bashrc"
echo
echo "Or simply open a new terminal."
echo

if [ -f /var/run/reboot-required ]; then
    echo "[FlameBash] Reboot required."
else
    echo "[FlameBash] No reboot required."
fi