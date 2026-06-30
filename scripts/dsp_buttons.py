#!/usr/bin/env python3
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
