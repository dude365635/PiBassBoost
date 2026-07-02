#!/bin/bash
# PiBassBoost Setup Script - Turn your Pi into a bass-crunching machine!
#   Copyright (C) 2026 @dude365635
#
#   This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.

echo "Installing PiBassBoost! Depending on your Pi, this could take a while, maybe treat yourself to a cold drink while you wait :-)"
sleep 3
echo "Running an APT update/upgrade"
sudo apt update && sudo apt upgrade -y
echo "Install prerequisite packages via APT"
sudo apt install socat libxcb-sursor0 python3-dbus pipewire wireplumber libspa-0.2-bluetooth
echo "Installing Zram using Botspot's 'More RAM' package"
wget -O scripts/zram.sh https://github.com/Botspot/pi-apps/raw/refs/heads/master/apps/More%20RAM/install
sudo chmod +x zram.sh
sudo ./zram.sh
echo "Setting up the host Bluetooth interface"
sleep 1
echo "Creating a systemd user service file"
mkdir -p .config/systemd/user
cp scripts/speaker-agent.service .config/systemd/user/speaker-agent.service
cp scripts/speaker-agent.py ~/speaker-agent.py
echo "Enabling the Bluetooth host service"
systemctl --user daemon-reload
systemctl --user enable speaker-agent.service
echo "Enabling support for re-pairing without interaction"
sudo sed -i 's/#JustWorksRepairing.*/JustWorksRepairing = always/' /etc/bluetooth/main.conf
echo "Installing Flaptak and adding Flathub"
sudo apt install flatpak -y && flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#echo "Refreshing current bash profile"
#source /etc/profile
#systemctl --user daemon-reexec
echo "Installing EasyEffects"
flatpak install -y flathub com.github.wwmm.easyeffects
echo "Removing Bluetooth soft-block"
rfkill unblock bluetooth
echo "Installing IRS files and Bass Boost preset"
scripts/profiles.sh
echo "Copying and activating EasyEffects script and systemd service file"
cp scripts/start-easyeffects.sh ~/start-easyeffects.sh
cp scripts/start-easyeffects.service .config/systemd/user/start-easyeffects.service
systemctl --user daemon-reload
systemctl --user enable start-easyeffects.service
echo "Enabling lingering to ensure all the startup scripts can run"
sudo loginctl enable-linger $USER
echo "Enabling EasyEffect's local server"
mkdir -p ~/.var/app/com.github.wwmm.easyeffects/data/easyeffects
cat >> ~/.var/app/com.github.wwmm.easyeffects/data/easyeffects/easyeffectsrc << 'EOF'
[General]
enableLocalServer=true
EOF
echo "Adding optional bass-boost switch support"
cp scripts/dsp_buttons.py ~/dsp_buttons.py
cp scripts/dsp_buttons.service ~/.config/systemd/user/dsp-buttons.service
systemctl --user daemon-reload
systemctl --user enable dsp-buttons.service
echo "Enabling read-only filesystem to avoid data corruption"
scripts/read-only-fs.sh
echo "Setup complete! System will reboot in 10 seconds, once rebooted connect to PiBassBoost via Bluetooth to start Bass Boosting!!"
sleep 5
sudo reboot
