#!/usr/bin/python3
# Original Code Copyright (C) 2022 Federic Danis
# Modifications Copyright (C) 2026 @dude365635
#
# This file was originally licensed under LGPLv2.1. 
# As permitted by Section 3 of the LGPLv2.1, it has been modified 
# and is now redistributed under the terms of the GNU General Public License v3.0.
#
#    This program is free software: you can redistribute it and/or modify
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


import dbus
import dbus.service
import dbus.mainloop.glib
from gi.repository import GLib

BUS_NAME = 'org.bluez'
AGENT_INTERFACE = 'org.bluez.Agent1'
AGENT_PATH = "/speaker/agent"

A2DP = '0000110d-0000-1000-8000-00805f9b34fb'
AVRCP = '0000110e-0000-1000-8000-00805f9b34fb'

bus = None


class Rejected(dbus.DBusException):
    _dbus_error_name = "org.bluez.Error.Rejected"


class Agent(dbus.service.Object):
    exit_on_release = True

    def set_exit_on_release(self, exit_on_release):
        self.exit_on_release = exit_on_release

    @dbus.service.method(AGENT_INTERFACE,
                         in_signature="", out_signature="")
    def Release(self):
        print("Release")
        if self.exit_on_release:
            mainloop.quit()

    @dbus.service.method(AGENT_INTERFACE,
                         in_signature="os", out_signature="")
    @dbus.service.method(AGENT_INTERFACE,
                     in_signature="os", out_signature="")
#Edited to accept all incoming requests, otherwie wouldnt work with Chrome OS
    def AuthorizeService(self, device, uuid):
         print("AuthorizeService (%s, %s)" % (device, uuid))
         return
#Finsihed edit
    @dbus.service.method(AGENT_INTERFACE,
                         in_signature="", out_signature="")
    def Cancel(self):
        print("Cancel")


if __name__ == '__main__':
    dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)

    bus = dbus.SystemBus()

    agent = Agent(bus, AGENT_PATH)

    mainloop = GLib.MainLoop()

    # By default Bluetooth adapter is not discoverable and there's
    # a 3 min timeout
    # Set it as always discoverable
    adapter = dbus.Interface(bus.get_object(BUS_NAME, "/org/bluez/hci0"),
                             "org.freedesktop.DBus.Properties")
    adapter.Set("org.bluez.Adapter1", "DiscoverableTimeout", dbus.UInt32(0))
    adapter.Set("org.bluez.Adapter1", "Discoverable", True)
#Edited below to add more adapters and an alias 
adapter.Set("org.bluez.Adapter1", "Pairable", True)
adapter.Set("org.bluez.Adapter1", "PairableTimeout", dbus.UInt32(0))
adapter.Set("org.bluez.Adapter1", "Alias", "PiBassBoost")
#Finished edit
print("RPi speaker discoverable")

    # As the RPi speaker will not have any interface, create a pairing
    # agent with NoInputNoOutput capability
obj = bus.get_object(BUS_NAME, "/org/bluez")
manager = dbus.Interface(obj, "org.bluez.AgentManager1")
manager.RegisterAgent(AGENT_PATH, "NoInputNoOutput")

print("Agent registered")

manager.RequestDefaultAgent(AGENT_PATH)

mainloop.run()
