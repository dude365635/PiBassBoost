# PiBassBoost
A set of scripts to turn your Raspberry Pi into a portable bass booster using EasyEffects!

# How did you come up with this?? 
Around a year ago I found myself listening to my Spotify playlist and thinking: "Man, this could _really_ use more bass". So I started researching, and found there were no devices on the internet (or even projects!!) that would allow you to have a portable, easy to use, reliable, and cheap bass-boosting setup. Sure, there was a multitude of software that could do the job for 'free', but the majority of these applications either were locked behind paywalls, riddled with ads, or (more often) just didn't do a good job. I gave up hope, all was lost. Until one fateful day months later, when I discovered a program called EasyEffects. I tried it out and it worked really well! It was a FOSS project, and there were plenty of community presets avaliable for download. I liked JackHack's 'Bass Boosted" preset, which worked wonders on 95% of the songs I tried it on. However, there was a caveat. Most devices I use run on Chrome OS and Android, which don't support EasyEffects. I wanted a solution, and it had to be reliable, easy to use (lest it collect dust), relativly cheap, and compact. After a few weeks of research, testing, prototyping, 3D printing, and writing, I am proud to present my hard work to you all!

# How it works
To make it easy to understand I have made a diagram. (which is not done yet lol)

# Basic Installation
Installation is super simple, I've worked hard to create an AIO (all in one) install script to do most of the heavy lifting for you!

The install script requires the following:
* An installation of Pi OS Desktop 64bit (Use Bookworm, Trixie may have issues)
* 16GB micro SD card or bigger
* A Raspberry Pi with built-in Bluetooth (This excludes the Pi Zero W due to lack of processing power)
* OPTIONAL: If using a Pi without a headphone jack (Zero or 5 models) you will need some form of USB audio output device, I've used a Pico progammed as a BT audio device using wasdwasd0105's amazing project: https://github.com/wasdwasd0105/PicoW-usb2bt-audio)

With that done, just clone the repo, move into it and run the script:
```bash
git clone https://github.com/dude363635/PiBassBoost.git
cd PiBassBoost
sudo chmod +x install.sh
sudo ./install.sh
```

For a more advanced and useful Portable Edition, see the wiki page here: https://github.com/dude365635/PiBassBoost/wiki/Bluetooth-Portable-Edition
