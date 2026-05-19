# PiBassBoost
A set of simple scripts to turn your Raspberry Pi into a headless, appliance-like bass boosting machine!!

# Install
Installation is super simple, I've worked hard to create an AIO (all in one) install script to do most of the heavy lifting for you!

The install script requires the following:
* An installation of Pi OS Desktop 64bit (Bookworm, Trixie may work but haven't tried, lmk if it works!)
* 16GB micro sd card or bigger
* A Raspberry Pi Zero 2W, 3, 4, or 5 (Script tested with Pi Zero 2, but should work on any) (This excludes any Pi without built-in BT, and Pi Zero W due to lack of processing power)
* OPTIONAL: If using a Pi without a headphone jack (Zero or 5 models) you will need some form of USB audio output device, I've used a Pico setup as a BT audio device using wasdwasd0105's amazing project: https://github.com/wasdwasd0105/PicoW-usb2bt-audio)

With that set up, just clone the repo, move into it and run the script:
```bash
git clone https://github.com/dude363635/PiBassBoost.git
cd PiBassBoost
sudo chmod +x install.sh
```

# Bluetooth Portable Edition Build Instructions
You could setup your PiBassBoost without a case, but why would you? You wanna bring this thing with you everywhere! I'm talking the gym, work, school, uni, anywhere you wanna vibe out! Flex it on your friends, or build one for them!

### Note: These instructions assume that you have at least a basic knowledge of how to image a SD card for your Pi and customise it using RPI Imager. It also assumes you understand how to solder safely and understand the small (but still potential) risks involved in this project. I take NO responsibility or liability for any consequences you experience in the event you break something whilst following these instructions. With that out of the way, enjoy the guide :)

### Parts you need: 
* Pi Zero 2W  
* 16GB Micro SD card  
* 5000mah Lipo (Size: 955565) (You can find them on Aliexpress, eBay etc, or in small power banks like I did)
* Charge/Boost unit with USB-C charging and percentage (Non-affiliate link: https://www.aliexpress.com/item/1005006901990636.html)
* A Pico W or Pico 2W (acts as a USB audio device for connecting your Bluetooth headphones or earbuds)
* Some wires (Make sure they aren't too small, they can cause overcurrent fires)
### Tools you need:
* 3D Printer with PETG filament
* Soldering iron
* Bluetooth headset/earbuds
### Things you'll find helpful:
* A bit of time
* A playlist with some good bass

## Step 1: Preparing the software image
So firstly, we need to get the software down before we start building the hardware. Start by getting your SD card flashed with a copy of Raspberry Pi OS Bookworm, with a desktop. Make sure to use the Raspberry Pi Imager utility to enable SSH, set up a user, and connect it to a Wifi network. There is a guide avaliable here: 
