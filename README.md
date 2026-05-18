# PiBassBoost
A set of simple scripts to turn your Raspberry Pi into a headless, appliance-like bass boosting machine!!

# Install
Installation is super simple, I've worked hard to create an AIO (all in one) install script to do most of the heavy lifting for you!

The install script requires the following:
* An installation of Pi OS Desktop 64bit (Bookworm, Trixie may work but haven't tried, lmk if it works!)
* 16GB micro sd card or bigger
* A Raspberry Pi Zero 2W, 3, 4, or 5 (Script tested with RPIZ2W, but should work on any) (This excludeds any Pi without built-in BT, and the Pi Zero W due to lack of processing power)
* OPTIONAL: If using a Pi without a headphone jack (Zero or 5 models) you will need some form of USB audio output device, I've used a Pico setup as a BT audio device using this great piece of work: https://github.com/wasdwasd0105/PicoW-usb2bt-audio)

With that set up, just clone the repo, move into it and run the script:
```bash
git clone https://github.com/dude363635/PiBassBoost.git
cd PiBassBoost
sudo chmod +x install.sh
```
