# PiBassBoost
A set of scripts to turn your Raspberry Pi into a portable bass booster using EasyEffects!

# How did you come up with this?? 
Around a year ago I found myself listening to my Spotify playlist and thinking: "Man, this could _really_ use more bass". So I started researching, and found there were no devices on the internet (or even projects!!) that would allow you to have a portable, easy to use, reliable, and cheap bass-boosting setup. Sure, there was a multitude of software that could do the job for 'free', but the majority of these applications either were locked behind paywalls, riddled with ads, or (more often) just didn't do a good job. I gave up hope, all was lost. Until one fateful day months later, when I discovered a program called EasyEffects. I tried it out and it worked really well! It was a FOSS project, and there were plenty of community presets avaliable for download. I liked JackHack's 'Bass Boosted" preset, which worked wonders on 95% of the songs I tried it on. However, there was a caveat. Most devices I use run on Chrome OS and Android, which don't support EasyEffects. I wanted a solution, and it had to be reliable, easy to use (lest it collect dust), relativly cheap, and compact. After a few weeks of research, testing, prototyping, 3D printing, and writing, I am proud to present my hard work to you all!

# How it works
To make it easy to understand I have made a diagram. (which is not done yet lol)

# Basic Installation
Installation is super simple, I've worked hard to create an AIO (all in one) install script to do most of the heavy lifting for you!

The install script requires the following:
* An installation of Pi OS Desktop 64bit (Preferably Bookworm, Trixie may work but haven't tried)
* 16GB micro SD card or bigger
* A Raspberry Pi with built-in Bluetooth (This excludes the Pi Zero W due to lack of processing power)
* OPTIONAL: If using a Pi without a headphone jack (Zero or 5 models) you will need some form of USB audio output device, I've used a Pico progammed as a BT audio device using wasdwasd0105's amazing project: https://github.com/wasdwasd0105/PicoW-usb2bt-audio)

With that done, just clone the repo, move into it and run the script:
```bash
git clone https://github.com/dude363635/PiBassBoost.git
cd PiBassBoost
sudo chmod +x install.sh
```

# Bluetooth Portable Edition Build Instructions
You could setup your PiBassBoost without a case, but why would you? You wanna bring this thing with you everywhere! I'm talking the gym, work, school, uni, anywhere you wanna vibe out! Flex it on your friends, or build one for them!

### Note: These instructions assume that you have at least a basic knowledge of how to image a SD card, customise it using RPI Imager, and connect to it via SSH. It also assumes you understand how to solder safely and understand the small (but still potential) risks involved in this project. I take NO responsibility or liability for any consequences you experience in the event you break something whilst following these instructions. With that out of the way, enjoy the guide :)

### Parts you need: 
* Pi Zero 2W  
* 16GB Micro SD card  
* 5000mah Lipo (Size: 955565) (You can find them on Aliexpress, eBay etc, or in small power banks like I did)
* Charge/Boost unit with USB-C charging and percentage (Non-affiliate link: https://www.aliexpress.com/item/1005006901990636.html)
* A Pico W or Pico 2W (acts as a USB audio device for connecting your Bluetooth headphones or earbuds)
* Micro USB to Micro USB OTG with right angles (as used in DJI drones, for example) (Non-affiliate link: https://www.aliexpress.com/item/32829411837.html
* Some momentary pushbuttons
* BOLTS+NUTS<ADD INFO> 
* Some wires (Make sure they aren't too small, they can cause overcurrent fires)
### Tools you need:
* 3D Printer with PETG filament
* Soldering iron
* Bluetooth headset/earbuds
### Things you'll find helpful:
* A bit of time
* A playlist with some good bass

## Step 1: Preparing the software on the Pi
So firstly, we need to get the software down before we start building the hardware. Start by getting your SD card flashed with a copy of Raspberry Pi OS Legacy (Bookworm), with a desktop. Make sure to use the Raspberry Pi Imager utility to enable SSH, set up a user, and connect it to a Wifi network. 
Next, login to the user you created through an ssh session
On Linux, the command is:
```bash
ssh user@hostname/ip address
```
Then use the basc install instructions above to download, install, and configure your Pi, then move onto the next step.

## Step 2: Set up Pico W as a Bluetooth device
This is a super simple process, and can be done whilst the main software is being set up. You will need another computer to set it up, as the install script does not currently support flashing the Pico live. 
For up to date instructions, visit the install page on wasdwasd0105's repo: https://github.com/wasdwasd0105/PicoW-usb2bt-audio?tab=readme-ov-file#installation

## Step 3: Print the housing and place the parts 
Now that you have all the software ready, its time to move onto the hardware side of things. if you have the same parts as me, grab the STL files you'll need from the "STL" folder in the repo (LINK HERE). I reccomend printing them all in PETG for better heat-resistance, however PLA might work. 
Once the parts have printed, gently place everything together and test fit it all before we start soldering things.
