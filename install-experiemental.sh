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

set -euo pipefail

if [[ $EUID -eq 0 ]]; then
    echo "Please run this installer as your normal user, not as root."
    exit 1
fi

sudo -v

# Terminal colours
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
MAGENTA='\033[1;35m'
NC='\033[0m'

clear

echo -e "${CYAN}"
echo '██████╗ ██╗██████╗  █████╗ ███████╗███████╗'
echo '██╔══██╗██║██╔══██╗██╔══██╗██╔════╝██╔════╝'
echo '██████╔╝██║██████╔╝███████║███████╗███████╗'
echo '██╔═══╝ ██║██╔══██╗██╔══██║╚════██║╚════██║'
echo '██║     ██║██████╔╝██║  ██║███████║███████║'
echo '╚═╝     ╚═╝╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝'
echo -e "${MAGENTA}          ██████╗  ██████╗  ██████╗ ███████╗████████╗${NC}"
echo -e "${MAGENTA}          ██╔══██╗██╔═══██╗██╔═══██╗██╔════╝╚══██╔══╝${NC}"
echo -e "${MAGENTA}          ██████╔╝██║   ██║██║   ██║███████╗   ██║${NC}"
echo -e "${MAGENTA}          ██╔══██╗██║   ██║██║   ██║╚════██║   ██║${NC}"
echo -e "${MAGENTA}          ██████╔╝╚██████╔╝╚██████╔╝███████║   ██║${NC}"
echo -e "${MAGENTA}          ╚═════╝  ╚═════╝  ╚═════╝ ╚══════╝   ╚═╝${NC}"
echo
echo -e "${WHITE}        Turn your Raspberry Pi into a bass-crunching machine! ${NC}"
echo -e "${BLUE}             Copyright (C) 2026 @dude365635${NC}"
echo
sleep 2

echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}[1/12]${NC} Updating system packages..."
sudo apt update && sudo apt upgrade -y

echo -e "${GREEN}[2/12]${NC} Installing prerequisite packages..."
sudo apt install -y socat libxcb-cursor0 python3-dbus pipewire wireplumber libspa-0.2-bluetooth rfkill

echo -e "${GREEN}[3/12]${NC} Installing ZRAM..."
wget -O scripts/zram.sh https://github.com/Botspot/pi-apps/raw/refs/heads/master/apps/More%20RAM/install
sudo chmod +x scripts/zram.sh
sudo scripts/zram.sh

echo -e "${GREEN}[4/12]${NC} Configuring Bluetooth..."
sleep 1
mkdir -p ~/.config/systemd/user
cp scripts/speaker-agent.service ~/.config/systemd/user/speaker-agent.service
cp scripts/speaker-agent.py ~/speaker-agent.py
systemctl --user daemon-reload
systemctl --user enable speaker-agent.service
sudo sed -i 's/#JustWorksRepairing.*/JustWorksRepairing = always/' /etc/bluetooth/main.conf

echo -e "${GREEN}[5/12]${NC} Installing Flatpak..."
sudo apt install -y flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo -e "${GREEN}[6/12]${NC} Installing EasyEffects..."
flatpak install -y --noninteractive flathub com.github.wwmm.easyeffects

echo -e "${GREEN}[7/12]${NC} Installing bass presets..."
rfkill unblock bluetooth
bash scripts/profiles.sh

echo -e "${GREEN}[8/12]${NC} Configuring EasyEffects..."
cp scripts/start-easyeffects.sh ~/start-easyeffects.sh
cp scripts/start-easyeffects.service ~/.config/systemd/user/start-easyeffects.service
systemctl --user daemon-reload
systemctl --user enable start-easyeffects.service

echo -e "${GREEN}[9/12]${NC} Enabling startup services..."
sudo loginctl enable-linger "$USER"

echo -e "${GREEN}[10/12]${NC} Enabling EasyEffects local server..."
mkdir -p ~/.var/app/com.github.wwmm.easyeffects/data/easyeffects
cat >> ~/.var/app/com.github.wwmm.easyeffects/data/easyeffects/easyeffectsrc << 'EOF'
[General]
enableLocalServer=true
EOF

echo -e "${GREEN}[11/12]${NC} Installing DSP button support..."
cp scripts/dsp_buttons.py ~/dsp_buttons.py
cp scripts/dsp_buttons.service ~/.config/systemd/user/dsp_buttons.service
systemctl --user daemon-reload
systemctl --user enable dsp_buttons.service

echo -e "${GREEN}[12/12]${NC} Enabling read-only filesystem..."
bash scripts/read-only-fs.sh

clear

echo -e "${GREEN}"
echo "██████╗  ██████╗ ███╗   ██╗███████╗██╗"
echo "██╔══██╗██╔═══██╗████╗  ██║██╔════╝██║"
echo "██║  ██║██║   ██║██╔██╗ ██║█████╗  ██║"
echo "██║  ██║██║   ██║██║╚██╗██║██╔══╝  ╚═╝"
echo "██████╔╝╚██████╔╝██║ ╚████║███████╗██╗"
echo "╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚═╝"
echo -e "${NC}"

echo -e "${WHITE}PiBassBoost has been installed successfully!${NC}"
echo
echo -e "${CYAN}Your Raspberry Pi will reboot in ${YELLOW}5 seconds${CYAN}.${NC}"
echo
echo -e "${WHITE}After reboot:${NC}"
echo "Pair your device over Bluetooth..."
echo "Start playing music..."
echo "And enjoy the bass!"
echo

sleep 5
sudo reboot
