#!/usr/bin/env python3

import os
import subprocess
from signal import pause
from gpiozero import Button

# Buttons (BCM numbering)
# Physical pin 13 = GPIO27 -> Enable DSP
# Physical pin 29 = GPIO5  -> Disable DSP
enable_button = Button(27, pull_up=True, bounce_time=0.2)
disable_button = Button(5, pull_up=True, bounce_time=0.2)


def send_command(command):
    """Send a command to the EasyEffects control socket."""
    socket = os.path.join(
        os.environ["XDG_RUNTIME_DIR"],
        ".flatpak/com.github.wwmm.easyeffects/tmp/EasyEffectsServer"
    )

    try:
        subprocess.run(
            ["socat", "-", f"UNIX-CONNECT:{socket}"],
            input=command + "\n",
            text=True,
            check=True
        )
    except subprocess.CalledProcessError as e:
        print(f"Error sending command: {e}")
    except KeyError:
        print("XDG_RUNTIME_DIR is not set.")
    except FileNotFoundError:
        print("Could not find EasyEffects socket or socat is not installed.")


def enable_dsp():
    print("Enabling DSP")
    send_command("global_bypass:0")


def disable_dsp():
    print("Disabling DSP")
    send_command("global_bypass:1")


enable_button.when_pressed = enable_dsp
disable_button.when_pressed = disable_dsp

print("DSP button listener started.")
pause()
