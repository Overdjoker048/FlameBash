#!/usr/bin/env bash
set -e

sudo apt upgrade -y
sudo apt autoremove -y && sudo apt autoclean -y
sudo apt update
sudo apt install -y git python3-venv alacritty nautilus

curl -fsSL "https://github.com/Overdjoker048/FlameBash#/.bashrc" -o ~/.bashrc
source ~/.bashrc

mkdir -p ~/.config/alacritty

cat > ~/.config/alacritty/alacritty.toml << 'EOF'
[window]
opacity = 0.9
EOF

# Super + Enter -> Alacritty
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings \
"['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/alacritty/']"

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/alacritty/ name "Alacritty"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/alacritty/ command "alacritty"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/alacritty/ binding "<Super>Return"

# Super + E -> Nautilus
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings \
"['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/alacritty/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/nautilus/']"

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/nautilus/ name "Nautilus"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/nautilus/ command "nautilus"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/nautilus/ binding "<Super>e"
